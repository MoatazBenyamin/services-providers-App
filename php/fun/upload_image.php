<?php

define('MB',1048576);
function imageUpload ($imageRequest)
{
global $msgError;
$imagename = $_FILES[$imageRequest] ['name'];
$imagetmp = $_FILES[$imageRequest]['tmp_name'];
$imagesize = $_FILES[$imageRequest]['size'];
$allowExt = array("jpg", "png", "gif", "mp3", "pdf");
$strToArray = explode(".", $imagename);
$ext = end($strToArray);
$ext = strtolower($ext);
if (!empty($imagename) && !in_array($ext, $allowExt)) {
$msgError[] = "Ext";
}
if ($imagesize > 2* MB) {
$msgError[] = "size";
}
if (empty($msgError)) {
move_uploaded_file($imagetmp, "upload/" . $imagename);
} else {
echo "<pre>";
print_r($msgError);
echo "</pre>";
}
}

?>