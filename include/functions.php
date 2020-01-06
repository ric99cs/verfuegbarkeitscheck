<?php
function getAnonymIp( $ip ) {
    
    return preg_replace('/[0-9]+\z/', 'xxx', $ip);
    
} 

function clearStreetName($street) {
    $street=str_replace("straße","str",$street);
    $street=str_replace("Straße","Str",$street);
    $street=str_replace("Strasse","Str",$street);
    $street=str_replace("strasse","str",$street);
    $street=str_replace(" ","%",$street);
    $street=str_replace("-","%",$street);   
    $street=str_replace("str","%str",$street);
    $street=str_replace("Str","%Str",$street);
    $street=str_replace("weg","%weg",$street);
    $street=str_replace("Weg","%Weg",$street);
    $street=str_replace("platz","%platz",$street);
    $street=str_replace("Platz","%Platz",$street);
    return $street;
}
?>