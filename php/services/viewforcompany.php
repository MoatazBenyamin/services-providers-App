<?php
include "../connect.php";
$companyid = filterRequest("companyid");
$stmt = $con->prepare("SELECT * FROM `services` WHERE `companyid` = ? ");
$stmt->execute(array($companyid)) ;
$data = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
$count = $stmt->rowCount();
if ($count > 0) {
echo json_encode(array("status" => "success", "data" => $data )) ;
}else {
echo json_encode(array("status" => "fail"));
}