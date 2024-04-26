<?php
try{
    header('Content-Type: text/html; charset=utf-8');

    $palvelin       = "localhost";
    $tietokanta      = "rautio";
    $tunnus       = "tyontekija";
    $salasana   = "tyontekija12";


    $yhteys = new PDO("mysql:host=$palvelin;dbname=$tietokanta;charset=utf8", "$tunnus", "$salasana");
    $yhteys->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Onnistuikohanko!";
}catch(PDOException $e){
    print "<p>Tietokantayhteyden avaaminen epäonnistui.</P>" . $e -> getMessage();
}