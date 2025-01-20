<?php

include "../connect.php";

$email = filterRequest('email');

$password = filterRequest('password');

$stmt = $con->prepare("SELECT * FROM companies WHERE `email`=? AND `password`=? ");

$stmt->execute(array($email, $password));

$data = $stmt->fetch(PDO::FETCH_ASSOC);

$count = $stmt->rowCount();


if($count>0){
    echo $email;
    echo json_encode(array("status" => "Success");
}else{
    echo json_encode(array("status" => "Fail"));
}

?>