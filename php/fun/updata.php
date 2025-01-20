<?php

include "../connect.php";
// $id                 = filterRequest("id");
// $personName      = filterRequest("personName");
// $personPhone     = filterRequest("personPhone");
// $companyName     = filterRequest("companyName");
// $companyAddress  = filterRequest("companyAddress");
// $companyLocation = filterRequest("companyLocation");



$id = $_POST["companyid"];
$personName = $_POST["contactPersonName"];
$personPhone = $_POST["contactPersonPhone"];
$companyName = $_POST["companyname"];
$companyAddress = $_POST["companyAddress"];
$companyLocation = $_POST["companyLocation"];





$stmt = $con->prepare
(
    "UPDATE `companies` SET contactPersonName='$personName ',contactPersonPhone='$personPhone',companyName='$companyName',
    companyAddress='$companyAddress',companyLocation='$companyLocation' WHERE companyid ='$id'"
);

$stmt->execute();

$count = $stmt->rowCount();

if ($count > 0){
    echo json_encode(array("status"=>"Success"));
}else{
    echo json_encode(array("status"=>"Failed"));
}

?>