<?php

include 'conn.php';

// Tarkistetaan, onko lomakkeen tallennuspainiketta painettu
if (isset($_POST['laheta'])) {
    // Haetaan lomakkeen tiedot
    $kohde = $_POST['kohde'];
    $viesti = $_POST['viesti'];
    $lemmikit = isset($_POST['lemmikit']) ? 1 : 0; 
    $yleisavain = isset($_POST['yleisavain']) ? 1 : 0; 
    $etunimi = $_POST['etunimi'];
    $sukunimi = $_POST['sukunimi'];
    $sposti = $_POST['sposti'];
    $puhelin = $_POST['puhelin'];
    $taloyhtioID = $_POST['taloyhtio'];
    $asuntoID = $_POST['asunto'];

    try {
     
        $sql = "INSERT INTO vikailmoitus (kohde, viesti, lemmikit, yleisavain, etunimi, sukunimi, sposti, puhelin, taloyhtioID, asuntoID) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $yhteys->prepare($sql);
        // Suoritetaan SQL-lauseke ja lisätään tiedot tietokantaan
        $stmt->execute([$kohde, $viesti, $lemmikit, $yleisavain, $etunimi, $sukunimi, $sposti, $puhelin, $taloyhtioID, $asuntoID]);

        // Asetetaan muuttuja ilmoittamaan lomakkeen onnistuneesta lähettämisestä
        session_start();
        $_SESSION['form_lahetetty'] = true;

         header("Location: ../vika.php");
        exit();
    } catch (PDOException $e) {
        // Jos tietokantaoperaatio aiheuttaa virheen, se tallennetaan virheilmoitukseen
        session_start();
        $_SESSION['virhe'] = "Virhe tallennettaessa vikailmoitusta:" . $e->getMessage();

        header("Location: ../vika.php");
        exit;
    }
} 
?>

