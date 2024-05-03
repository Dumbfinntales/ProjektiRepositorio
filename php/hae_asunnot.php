<?php
// Otetaan yhteys tietokantaan
include 'conn.php';

// Tarkistetaan, onko taloyhtiöID asetettu ja onko se kelvollinen
if (isset($_GET['taloyhtioID']) && is_numeric($_GET['taloyhtioID'])) {
    // Suojataan taloyhtiöID mahdollisilta haitallisilta merkeiltä
    $taloyhtioID = htmlspecialchars($_GET['taloyhtioID']);

    try {
        // Haetaan asunnot valitulle taloyhtiölle ja järjestetään ne aakkosjärjestyksessä
        $sql = "SELECT asuntoID, huoneisto FROM asunnot WHERE taloyhtioID = ? ORDER BY huoneisto ASC";
        $stmt = $yhteys->prepare($sql);
        $stmt->execute([$taloyhtioID]);

        // Tulostetaan asunnot alasvetovalikkoon
        echo "<option value=''>Valitse asunto</option>";
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<option value='{$row['asuntoID']}'>{$row['huoneisto']}</option>";
        }
    } catch (PDOException $e) {
        // Tulosta virhe, jos kyselyssä tapahtuu virhe
        echo "Virhe: " . $e->getMessage();
    }
} else {
    // Jos taloyhtiöID:tä ei ole asetettu tai se ei ole kelvollinen, palautetaan tyhjä vastaus
    echo "<option value=''>Valitse asunto</option>";
}
?>

