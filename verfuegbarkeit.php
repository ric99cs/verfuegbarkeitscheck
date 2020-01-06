<?php
  header('Content-Type: text/html; charset=UTF8');
  $path = '/xxx/verfuegbarkeit/include/';
  set_include_path(get_include_path() . PATH_SEPARATOR . $path);

  include 'colognephon.php';
  include 'setting.php';
  include 'mail.php';
  include 'functions.php';

  $con = mysql_connect($host, $user, $pass);
  $query=mysql_query("SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'", $con);


  if (!$con) {
    include("ups.php");
    //die(mysql_error());
  } else {
    mysql_select_db($db);
    
    $straße=mysql_real_escape_string($_GET['Straße']);
    $tempstraße=$straße;
    $straße = clearStreetName($straße);

    $hausnummer=mysql_real_escape_string($_GET['Hausnummer']);
    $zusatz=mysql_real_escape_string($_GET['Zusatz']);
    $ort=mysql_real_escape_string($_GET['Ort']); 
    $ortZiffer=preg_match("/[0-9]+/",$ort);
    $straßeZiffer=preg_match("/[0-9]+/",$straße);

    $from_user="schott.tv - Verfügbarkeitscheck";
    $from_user = "=?UTF-8?B?".base64_encode($from_user)."?=";
    $headers = "From: $from_user <support@schott.tv>\r\n".
    $headers .= ("Content-type: text/plain; charset=\"utf-8\"\r\n");
    $ip=$_SERVER["REMOTE_ADDR"];
    $newip=getAnonymIp($ip);
    $promotion = FALSE;

    if ($_GET['Straße']=="") { 
      include("ups.php");
      //die(mysql_error());
    } else {

      $oldstring=array('ß','ä','ö','ü',' ','%','-');
      $newstring=array('ss','ae','oe','ue','','','');
      
      //Erste Abfrage nach genauem Namen und Regex
      $querystring= "SELECT ID, KAA, KAD, KAI, Strasse, Hausnummer, Zusatz, Ort, Gebuehr, Status  FROM anschrift ";
      $querystring.="WHERE (MATCH (RegExStrasse) AGAINST (\"%". str_replace($oldstring,$newstring,$straße)."%\") ";
      $querystring.="OR  Strasse like \"%". $straße."%\") ";
      $querystring.="AND Hausnummer=". $hausnummer." AND Zusatz like \"%". $zusatz."%\" AND Ort like \"%".$ort."%\"";
      $allqueries .= $querystring."\r\n\r\n";

      $query=mysql_query($querystring) or die(mysql_error());
      if (mysql_num_rows($query)<1) {
        //Wenn kein Treffer, dann Abfrage mit Kölner Phonetik
        $querystring= "SELECT ID, KAA, KAD, KAI, Strasse, Hausnummer, Zusatz, Ort, Gebuehr, Status  FROM anschrift ";
        $querystring.="WHERE ColognePhon LIKE \"".cologne_phon(str_replace($oldstring,$newstring,$straße))."\" ";
        $querystring.="AND Hausnummer=". $hausnummer." AND Zusatz like \"%". $zusatz."%\" AND Ort like \"%".$ort."%\"";
        $allqueries .= $querystring."\r\n\r\n";
        $query=mysql_query($querystring) or die(mysql_error());

        if (mysql_num_rows($query)<1) {
          //Wenn auch da kein Treffer, dann Abfrage über Soundex-Code
          $querystring= "SELECT ID, KAA, KAD, KAI, Strasse, Hausnummer, Zusatz, Ort, Gebuehr, Status  FROM anschrift ";
          $querystring.="WHERE Soundex like \"".soundex($straße)."\" ";
          $querystring.="AND Hausnummer=". $hausnummer." AND Zusatz like \"%". $zusatz."%\" AND Ort like \"%".$ort."%\"";
          $allqueries .= $querystring."\r\n\r\n";
          $query=mysql_query($querystring) or die(mysql_error());
        }
      }

      if (mysql_num_rows($query) != 0) {
          $searchaddress=mysql_result($query,0,4)." ".mysql_result($query,0,5).mysql_result($query,0,6).", ".mysql_result($query,0,7);
        } else {
          $searchaddress='keine Daten gefunden';
        }

        include("searchinfo.php");

        if (!$query) {
          $queryResult=false;
        }

        if ($straßeZiffer==1) {
          $echoString.="<span style='color:#FF0000'><b>- Die Angabe des Feldes 'Straße' enthält Zahlen, dies ist möglicherweise nicht richtig. ";
          $echoString.="Bitte keine Hausnummern oder ähnliches angeben, diese gehören in das Feld 'Hausnummer'.</b></span><br />";
        }

        if ($ortZiffer==1) {
          $echoString.="<span style='color:#FF0000'><b>- Die Angabe des Ortes enthält Zahlen, dies ist möglicherweise nicht richtig. ";
          $echoString.="Bitte keine Postleitzahlen oder ähnliches angeben.</b></span><br />";
        }

        if (mysql_num_rows($query) == 0) {

          include("nohit.php");

          if ($streetresult==False) {
            $echoString .="- Zu der angegebenen Straße konnte keine Entsprechung in unserer Datenbank gefunden werden<br />";
          }
      
          if ($queryResult==False) {
            $echoString .= "- Keiner der Punkte der Anschrift (Straße, Hausnummer etc.) lieferte ein passendes Ergebnis<br />";
          }
      
          if ($streetresult==False OR $queryResult==FALSE) {
            include("moreinfo.php");
          }
        
          $AngebotD="Nein";
          $AngebotI="Nein";
          $promotion=TRUE;
        } else {
          $promotion=TRUE;
          $KAA=mysql_result($query, 0,1);
          $KAD=mysql_result($query, 0,2);
          $KAI=mysql_result($query, 0,3);
          $gebuehr=mysql_result($query, 0,8);
          $Status=mysql_result($query, 0,9);
          $rest=substr($Status,0,1);
          if ($rest="R") {
            $Status=substr($Status,1);
            $Status=str_replace(',','.',$Status);
            $gebuehr=str_replace(',','.',$gebuehr);
            $gebuehr=floatval($gebuehr)+floatval($Status);
          }
      
          // echo $KAA." ".$KAD." ".$KAI." ".$gebuehr." ".$Status;
          // echo "<p>";
          // echo "ID: ".mysql_result($query, 0,0)."\n";
          // echo "<p>";

          $querystring = "SELECT result, angebot FROM resultblocks WHERE versorgung='KAA' AND wert='".$KAA."'";
          $allqueries .= $querystring."\r\n\r\n";

          $query=mysql_query($querystring) or die(mysql_error());
          if (mysql_num_rows($query) != 0) {
            echo mysql_result($query,0,0);
          } 

          $querystring = "SELECT result, angebot FROM resultblocks WHERE versorgung='KAD' AND wert='".$KAD."'";
          $allqueries .= $querystring."\r\n\r\n";

          $query=mysql_query($querystring) or die(mysql_error());
          if (mysql_num_rows($query) != 0) {
            echo mysql_result($query,0,0);
            $AngebotD = mysql_result($query,0,1);
          } 

          $querystring = "SELECT result, angebot FROM resultblocks WHERE versorgung='KAI' AND wert='".$KAI."'";
          $allqueries .= $querystring."\r\n\r\n";

          $query=mysql_query($querystring) or die(mysql_error());
          if (mysql_num_rows($query) != 0) {
            echo mysql_result($query,0,0);
            $AngebotI = mysql_result($query,0,1);
          } 

        }
        include("bottommenu.php");

        if ($promotion == TRUE) {
          include("sideblock.php");
          $streetstring=$_GET['Straße']." ".$_GET['Hausnummer'].$_GET['Zusatz'].", ".$_GET['Ort'];
          $body="Folgende Suchanfrage wurde am ".$datum.", um ".$uhrzeit." Uhr von der IP ".$newip." getätigt:\r\n\r\n";
          $body.="Query:\r\n".$allqueries."\r\n\r\nStraße: ".$streetstring."\r\n\r\nSuchergebnis: ".$searchaddress."\r\n\r\n";
          $body.="Daten aus GET-Variablenübergabe:\r\nStraße: ".mysql_real_escape_string($_GET['Straße'])."\r\nHausnummer: ".mysql_real_escape_string($_GET['Hausnummer']);
          $body.="\r\nZusatz: ".mysql_real_escape_string($_GET['Zusatz'])."\r\nPLZ: ".mysql_real_escape_string($_GET['PLZ'])."\r\nOrt: ".mysql_real_escape_string($_GET['Ort']);
          $body.="\r\n\r\nErgebnis:\r\nEchostring: ".$echoString."\r\nKAA/KAD/KAI: ".$KAA."/".$KAD."/".$KAI;
          $body.="\r\n\r\nUser Agent:\r\n\r\n".$_SERVER['HTTP_USER_AGENT'];
      
          mail($recipient,$header,$body,$headers);
        }
      }
    }
?>
