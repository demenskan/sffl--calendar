<?php if (!defined('AUTH_TOKEN')) header ('HTTP/1.0 404 Not found');
  /*  SQL */
    // Place here the MySQL database settings and rename this file as conexiones.inc
  $gasDBConfig=array(
      'default' => array('host' => getenv('SFFL_DB_HOST'),
                      'db' => getenv('SFFL_DB_NAME'),
                      'usr' => getenv('SFFL_DB_USER'),
                      'pwd' => getenv('SFFL_DB_PASS')
                    ),
  );
?>
