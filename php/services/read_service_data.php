<?php

include "../connect.php";


$statement = $con->prepare("SELECT * FROM `services`");
$statement -> execute();


$users = $statement->fetchAll(PDO::FETCH_ASSOC) ;

print_r(json_encode($users))

?>