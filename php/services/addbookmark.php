<?php

include "../connect.php";

$serviceid = $_POST["serviceid"];
$bookmark = $_POST["bookmark"];

$stmt = $con->prepare
(
    "UPDATE `services` SET bookmark=? WHERE serviceid=?"
);
$stmt->execute(array($bookmark, $serviceid));

$count = $stmt->rowCount();

if ($count > 0){
    echo json_encode(array("status"=>"Success"));
}else{
    echo json_encode(array("status"=>"Failed"));
}

?>