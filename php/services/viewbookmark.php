<?php
include "../connect.php";
$bookmark = filterRequest("bookmark");
$stmt = $con->prepare("SELECT * FROM services WHERE `bookmark` = ? ");
$stmt->execute(array($bookmark)) ;
$data = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
$count = $stmt->rowCount();
if ($count > 0) {
echo json_encode(array("status" => "success", "data" => $data )) ;
}else {
echo json_encode(array("status" => "fail"));
}