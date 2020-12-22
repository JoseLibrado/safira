<?php
    $alert = '';      
    $field = isset($_GET['field']);

    if($field == 'failed'){
        echo 'Login Filed';
    } else if($field == 'invalid'){
        echo 'Login Invalid';
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="inc/login.inc.php" method='post'>
        <input type="text" placeholder='user' name='user'>
        <input type="password" name="psw" id="psw" placeholder='password'>
        <input type="submit" value="Login">
    </form>
</body>
</html>