<?php
    $dsn = 'mysql:dbname=jlso94001;host=127.0.0.1';
    $usuario = 'root';
    $contraseña = '';
    $bd_conection = '';


    try {
        $bd_conection = new PDO($dsn, $usuario, $contraseña);
        //echo 'conexion hecha';

    } catch (PDOException $e) {
        echo 'Falló la conexión: ' . $e->getMessage();
    }