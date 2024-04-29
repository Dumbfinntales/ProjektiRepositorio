<?php
// Sisällytetään tietokantayhteys
require "conn.php";

try {
    // SQL-kysely työntekijöiden hakemiseksi, joiden rooli on 'tyonjohto'
    $sql = "SELECT t.etunimi, t.sukunimi,t.puhelin, t.sposti, t.kuvapolku, r.rooli 
        FROM tyontekija t 
        INNER JOIN rooli r ON t.rooliID = r.rooliID 
        WHERE r.rooli = 'tyonjohtaja'";
    $stmt = $yhteys->prepare($sql);
    $stmt->execute();
    $data_tyonjohto = $stmt->fetchAll(PDO::FETCH_OBJ);
} catch (PDOException $e) {
    echo "Tietokantavirhe: " . $e->getMessage();
}
?>



