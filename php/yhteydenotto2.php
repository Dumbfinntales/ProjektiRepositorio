<?php
require "conn.php";

// Tarkistetaan, onko lomakkeen tiedot lähetetty POST-metodilla
if(isset($_POST['laheta'])){
    $etunimi=$_POST['etunimi'];
    $sukunimi=$_POST['sukunimi'];
    $sposti=$_POST['sposti'];
    $puhelin=$_POST['puhelin'];
    $viesti=$_POST['viesti'];
    $yhteydenottotapa=$_POST['yhteydenottotapa'];

    $komento="INSERT INTO yhteydenotto(etunimi, sukunimi, sposti, puhelin, viesti, yhteydenottotapa) VALUES (:etunimi, :sukunimi, :sposti, :puhelin, :viesti, :yhteydenottotapa)";

    $yht = $yhteys->prepare($komento);
    $yht->bindValue(':etunimi', $etunimi, PDO::PARAM_STR);
    $yht->bindValue(':sukunimi', $sukunimi, PDO::PARAM_STR);
    $yht->bindValue(':sposti', $sposti, PDO::PARAM_STR);
    $yht->bindValue(':puhelin', $puhelin, PDO::PARAM_STR);
    $yht->bindValue(':viesti', $viesti, PDO::PARAM_STR);
    $yht->bindValue(':yhteydenottotapa', $yhteydenottotapa, PDO::PARAM_STR);
    $yht->execute();

    // Session-muuttuja asetettu ilmoittamaan lomakkeen onnistuneesta lähettämisestä
    session_start();
    $_SESSION['form_lahetetty'] = true;

    // Ohjataan takaisin yhteydenotto.php-sivulle
    header("Location: ../yhteydenotto.php");
    exit();
}
?>

