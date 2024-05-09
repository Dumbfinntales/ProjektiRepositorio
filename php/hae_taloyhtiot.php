<?php

require "conn.php";

try {
    // Haetaan nimi, osoite, tilat ja huoneistojen lukumäärä
    $sql = "SELECT t.nimi AS taloyhtion_nimi, t.osoite AS taloyhtion_osoite, t.tilat AS taloyhtion_tilat, COUNT(a.asuntoID) AS huoneistojen_lkm
            FROM taloyhtio t
            INNER JOIN asunnot a ON t.taloyhtioID = a.taloyhtioID
            GROUP BY t.taloyhtioID, t.nimi, t.osoite, t.tilat";
    $stmt = $yhteys->prepare($sql);
    $stmt->execute();
    $data_taloyhtio = $stmt->fetchAll(PDO::FETCH_OBJ);
} catch (PDOException $e) {
    echo "Tietokantavirhe: " . $e->getMessage();
}

?>