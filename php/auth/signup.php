<?php
    include '../connect.php';

    $email           = filterRequest('email');
    $password        = filterRequest('password');
    $contactPersonName      = filterRequest('contactPersonName');
    $contactPersonPhone     = filterRequest('contactPersonPhone');
    $companyname     = filterRequest('companyname');
    $companySize     = filterRequest('companySize');
    $companyAddress  = filterRequest('companyAddress');
    $companyLocation = filterRequest('companyLocation');
    $companyIndustry= filterRequest('companyIndustry');


    $statement = $con->prepare("INSERT INTO `companies`(`email`, `password`, `contactPersonPhone`, `contactPersonName`, `companyname`, `companySize`, `companyAddress`, `companyLocation`, `companyIndustry` , `companyImage` ) 
                                VALUES 
                                (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $statement->execute(array($email, $password, $contactPersonPhone, $contactPersonName, $companyname, $companySize, $companyAddress, $companyLocation, $companyIndustry , 'image1efq34efa3eff2023894.jpg'));

    $count = $statement->rowCount();

    if ($count > 0){
        echo json_encode(array("status"=>"Success"));
    }else{
        echo json_encode(array("status"=>"Failed"));
    }
?>
