<?php if (!defined('AUTH_TOKEN')) header ('HTTP/1.0 404 Not found');

  require_once ("settings.php");
  require_once (RUTA_CONEXION."conexiones.inc");

  function tools_mysql_consulta ($psSQL, $psConexion, $pbMultiplesFilas=true) {
    global $gasDBConfig;
    //var_dump($psConexion);
    $asSalida=array();
    $oCon=mysqli_connect($gasDBConfig[$psConexion]['host'],$gasDBConfig[$psConexion]['usr'],$gasDBConfig[$psConexion]['pwd']);
    if (!$oCon)
      return (array('ESTATUS' => -1, 'MENSAJE' => "Error al conectarse:".mysqli_connect_error()));
    if (mysqli_select_db($oCon,$gasDBConfig[$psConexion]['db'])==false) {
      mysqli_close($oCon);
      return (array('ESTATUS' => -2, 'MENSAJE' => "Error al seleccionar la base de datos"));
    }
    mysqli_query($oCon, "SET NAMES 'utf8'");
    $rResult=mysqli_query($oCon,$psSQL);
    if ($rResult==false) {
      $sError=mysqli_error($oCon);
      mysqli_close($oCon);
      return (array('ESTATUS' => -3, 'MENSAJE' => "Error en el query:".$sError));
    }
    $iCount=mysqli_num_rows($rResult);
    if ($iCount==0) {
      mysqli_close($oCon);
      return (array('ESTATUS' => 0, 'MENSAJE' => "Resultado: vacio"));
    }

    if ($pbMultiplesFilas) {
      $asSalida=array();
      while ($oFila=mysqli_fetch_array($rResult)) {
        $asSalida[]=$oFila;
      }
    }
    else {
        $asSalida=mysqli_fetch_array($rResult);
    }
    mysqli_close($oCon);
    return (array('ESTATUS' => 1, 'DATOS' => $asSalida, 'MENSAJE' => "ok"));
  }

  function tools_mysql_ejecuta ($psSQL, $psConexion) {
    global $gasDBConfig;
    $asSalida=array();
    $oCon=mysqli_connect($gasDBConfig[$psConexion]['host'],$gasDBConfig[$psConexion]['usr'],$gasDBConfig[$psConexion]['pwd']);
    if (!$oCon)
      return (array('ESTATUS' => -1, 'MENSAJE' => "Error al conectarse:".mysqli_connect_error()));
    if (mysqli_select_db($oCon,$gasDBConfig[$psConexion]['db'])==false) {
      mysqli_close($oCon);
      return (array('ESTATUS' => -2, 'MENSAJE' => "Error al seleccionar la base de datos"));
    }
    $rResult=mysqli_query($oCon,$psSQL);
    if ($rResult==false) {
      $sErrorQuery=mysqli_error($oCon);
      mysqli_close($oCon);
      return (array('ESTATUS' => -1, 'MENSAJE' => "Error en el query:".$sErrorQuery));
    }
    else {
      $iAffected=mysqli_affected_rows($oCon);
      mysqli_close($oCon);
      return (array('ESTATUS' => 1, 'MENSAJE' => "Exito!, filas afectadas:".$iAffected));
    }
  }


?>
