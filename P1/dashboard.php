<?php

    // require('header.php');
    require('conexion/db.php');
    $sesion = $_GET['login'];
    $result;
    $resultI;

    if(empty($sesion)){
        header('location:index.php');
        session_destroy();
    } else {
        $query = 'select user,id from usuarios where user = ?';

        $qprepare = $bd_conection->prepare($query);
        $qprepare->execute(array($sesion));

        $result = $qprepare->fetch(PDO::FETCH_ASSOC);

        if($result['id']){
            $queryI = 'select deuda,costo from deduas where id_usuarios = ?';
            $qprepareI = $bd_conection->prepare($queryI);
            $qprepareI->execute(array($result['id']));

            $resultI = $qprepareI->fetchAll(PDO::FETCH_ASSOC);
            // print_r($resultI);
        }
    }      
    
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Document</title>
</head>
<body>
    <header>
        <form action="inc/logout.inc.php" method="post">
            <button type="submit" value="Log out">Log out</button>
        </form>
    </header>
    <main>

        <div class="contenedor-ds">

            <h1>Tablero</h1>

            <section class="valores">

                <form action="post" class="saldo">

                    <input type="text" name="saldo" id="saldo">
                    <input type="submit" value="Agregar">
                
                </form>

                <form action="post" class="deudas">

                    <input type="text" name="cuenta" id="cuenta">
                    <input type="number" name="deuda" id="deuda">
                    <input type="submit" value="Agregar">

                </form>

            </section>

            <section class="gestor">   
                
                <div class="deuda">
                    <h2>Cuentas</h2>
                    <h2>Deuda</h2>
                </div>    

                <?php
                    if(isset($resultI)){
                        foreach($resultI as $items => $item){
                            
                            echo '<div class="deuda">';                
                            echo '<p>' . $item['deuda'] . '</p>';  
                            echo '<p>' . $item['costo'] . '</p>';                  
                            echo '</div>';
                        }
                    }
                ?>
                <!-- <div class="deuda">
                    <p>Renta</p>
                    <p>1000</p>
                </div>
                <div class="deuda">
                    <p>Renta</p>
                    <p>1000</p>
                </div>
                <div class="deuda">
                    <p>Renta</p>
                    <p>1000</p>
                </div>
                <div class="deuda">
                    <p>Renta</p>
                    <p>1000</p>
                </div>
                <div class="deuda">
                    <p>Renta</p>
                    <p>1000</p>
                </div> -->

            
            </section>
                
        </div>

    </main>
</body>
</html>