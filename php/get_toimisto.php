<?php
require "php/conn.php";

// toimisto tyontekijat
$sql = "SELECT t.etunimi, t.sukunimi,t.puhelin, t.sposti, t.kuvapolku, r.rooli 
        FROM tyontekija t 
        INNER JOIN rooli r ON t.rooliID = r.rooliID 
        WHERE r.rooli = 'toimisto'";
$result = $yhteys->query($sql);

// tulosten lukumäärä
if ($result->rowCount() > 0) {
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
        echo '<div class="col-md-auto">';
        echo '<div class="card border-0">';
        echo '<img src="' . $row['kuvapolku'] . '" class="card-img-top mx-auto" alt="Kuva" style="width: 120px; height: auto;">';
        echo '<div class="card-body text-center">';
        echo '<h5 class="card-title">' . $row['etunimi'] . ' ' . $row['sukunimi'] . '</h5>';
        echo '<p class="card-text"><i class="fa-solid fa-phone"></i>'. ' '. $row['puhelin'] . '</p>';
        echo '<p class="card-text"><i class="fa-solid fa-envelope"></i>'.' ' . $row['sposti'] . '</p>';
        echo '</div></div></div>';
    }
} else {
    echo "Ei tuloksia";
}

?>


