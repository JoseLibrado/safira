<?php
    require('../conexion/db.php');
    
    $usuario = $_REQUEST['user'];
    $pass   = $_REQUEST['psw'];

    
    $query = "call GetLogin(?,?)";
    $qprepare = $bd_conection->prepare($query);

    $qprepare->execute(array($usuario,$pass));

    $result = $qprepare->fetch(PDO::FETCH_ASSOC);
    // print_r($result);
    // echo $result->array['user'];
    
    // foreach ($result as $value) {
    //     echo $value;
    // }
    if(empty($result['USER'])){
        header('location:../index.php?field=empty');        
    }
    else {
        session_start();
        $_SESSION['login'] = $result['USER'];
        header('location:../dashboard.php?login=' . $_SESSION['login']);
    }