<?php

include "../connect.php";


$statement = $con->prepare("INSERT INTO `companies`(`email`, `password`, `contactPersonPhone`, `contactPersonName`, `companyname`, `companySize`, `companyAddress`, `companyLocation`, `companyIndustry` , `companyImage`) VALUES
('mohamed@gmail.com','pass1234','01067619364','mohamed','mohamedCompany','mini','kkkkkkk','1.11111111,2.2222222222','Manufacturing', '1efq34efa3eff2023894.jpg')");
$statement -> execute();


$count = $statement->rowCount() ;

if($count > 0){
    echo "Success";
}else{
    echo "Failed";
}

?>