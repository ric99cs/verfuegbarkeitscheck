<?php

$oldstring=array('ß','ä','ö','ü',' ','%','-');
$newstring=array('ss','ae','oe','ue','','','');

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
    $street=str_replace(".","%",$street);
    $street=str_replace("_","%",$street);   
    $street=str_replace("str","%str",$street);
    $street=str_replace("Str","%Str",$street);
    $street=str_replace("weg","%weg",$street);
    $street=str_replace("Weg","%Weg",$street);
    $street=str_replace("platz","%platz",$street);
    $street=str_replace("Platz","%Platz",$street);
    return $street;
}

function checkSimpleName($straße, $hausnummer, $zusatzquery, $ort) {
    $querystring= "SELECT ID, KAA, KAD, KAI, Strasse, Hausnummer, Zusatz, Ort, Gebuehr, Status  FROM anschrift ";
    $querystring.="WHERE (MATCH (RegExStrasse) AGAINST (\"%". str_replace($oldstring,$newstring,$straße)."%\") ";
    $querystring.="OR  Strasse like \"%". $straße."%\") ";
    $querystring.="AND Hausnummer=". $hausnummer.$zusatzquery." AND Ort like \"%".$ort."%\"";
    $query=mysql_query($querystring) or die(mysql_error());
    if (mysql_num_rows($query)>0) {
        return [$query,TRUE];
    } else {
        return [NULL,FALSE];
    }
}

function checkColognePhonetic($straße, $hausnummer, $zusatzquery, $ort) {
    $querystring= "SELECT ID, KAA, KAD, KAI, Strasse, Hausnummer, Zusatz, Ort, Gebuehr, Status  FROM anschrift ";
    $querystring.="WHERE ColognePhon LIKE \"".cologne_phon(str_replace($oldstring,$newstring,$straße))."\" ";
    $querystring.="AND Hausnummer=". $hausnummer.$zusatzquery." AND Ort like \"%".$ort."%\"";
    $query=mysql_query($querystring) or die(mysql_error());
    if (mysql_num_rows($query)>0) {
        return [$query,TRUE];
    } else {
        return [NULL,FALSE];
    }
}

function checkSoundex($straße, $hausnummer, $zusatzquery, $ort) {
    $querystring= "SELECT ID, KAA, KAD, KAI, Strasse, Hausnummer, Zusatz, Ort, Gebuehr, Status  FROM anschrift ";
    $querystring.="WHERE Soundex like \"".soundex($straße)."\" ";
    $querystring.="AND Hausnummer=". $hausnummer.$zusatzquery." AND Ort like \"%".$ort."%\"";
    $query=mysql_query($querystring) or die(mysql_error());
    if (mysql_num_rows($query)>0) {
        return [$query,TRUE];
    } else {
        return [NULL,FALSE];
    }
}

function checkLevenshtein($straße, $hausnummer, $zusatzquery, $ort) {
    $querystring = "SELECT DISTINCT RegExStrasse AS rstreet FROM anschrift";
    $query=mysql_query($querystring) or die(mysql_error());
    $levenstheinArray = [];
    while ($row = mysql_fetch_assoc($query)) {
      //echo $row["rstreet"].' - '.levenshtein($straße,$row["rstreet"])."<br />";
      $data = array('street'=>$row["rstreet"],'lev'=>levenshtein($straße,$row["rstreet"]));
      $levenstheinArray[]= $data;
    }
    $street=array_column($levenstheinArray, 'street');
    $lev=array_column($levenstheinArray, 'lev');
    array_multisort($lev, SORT_ASC, $street, SORT_ASC, $levenstheinArray);
    echo $levenstheinArray['street'];
    foreach($levenstheinArray as $key => $row) {
      $straße=$row['street'];
      $levlength = $row['lev'];
      break;
    }
    if ($levlength<10) {
        $querystring= "SELECT ID, KAA, KAD, KAI, Strasse, Hausnummer, Zusatz, Ort, Gebuehr, Status  FROM anschrift ";
        $querystring.="WHERE (MATCH (RegExStrasse) AGAINST (\"%". str_replace($oldstring,$newstring,$straße)."%\") ";
        $querystring.="OR  Strasse like \"%". $straße."%\") ";
        $querystring.="AND Hausnummer=". $hausnummer.$zusatzquery." AND Ort like \"%".$ort."%\"";
        $query=mysql_query($querystring) or die(mysql_error());
        return [$query,TRUE];
    } else {
        return [NULL,FALSE];
    }
}


?>