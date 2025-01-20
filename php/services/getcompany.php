<?php

include "../connect.php";
$companyid = filterRequest("companyid");


$stmt = $con->prepare("SELECT * FROM `companies` Where `companyid` = ?");
$stmt -> execute(array($companyid));
$data = $stmt->fetch(PDO::FETCH_ASSOC) ;
$count = $stmt->rowCount();

if ($count > 0) {
echo json_encode(array("status" => "success", "data" => $data )) ;
}else {
echo json_encode(array("status" => "fail"));
}

?>