<?php

require "conn.php";

try {
    // kysely työntekijöille, joiden rooli on 'tyonjohto'
    $sql = "SELECT t.etunimi, t.sukunimi,t.puhelin, t.sposti, t.kuvapolku, r.rooli 
        FROM tyontekija t 
        INNER JOIN rooli r ON t.rooliID = r.rooliID 
        WHERE r.rooli = 'tyontekija'";
    $stmt = $yhteys->prepare($sql);
    $stmt->execute();
    $data_tyontekija = $stmt->fetchAll(PDO::FETCH_OBJ);
} catch (PDOException $e) {
    echo "Tietokantavirhe: " . $e->getMessage();
}
?>