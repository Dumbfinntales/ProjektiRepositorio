<?php
include 'conn.php';

// Tarkistetaan nappia painettu
if (isset($_POST['valmis'])) {
  // Tarkistetaan, että kommentti on kirjoitettu
  if (isset($_POST['toimenpide'])) {
    // Otetaan tiedot talteen
    $vikaID = $_POST['vikaID'];
    $toimenpide = $_POST['toimenpide'];

    try {
      // Siirretään sitten kaikki tieto lomakkeesta käsittelyyn ja muokataan varattu boolean samalla
      $sql = "UPDATE kasittely SET toimenpide = :toimenpide, valmispvm = NOW() WHERE vikaID = '$vikaID'";
      $stmt = $yhteys->prepare($sql);
      $stmt->bindParam(':toimenpide' ,$toimenpide, PDO::PARAM_STR);
      $stmt->execute();

      // Ohjaa takaisin ilmoituslistaukseen
      header("Location: ../omat_tyot.php");
      exit();
    } catch (PDOException $e) {
      echo "Virhe: " . $e->getMessage();
    }
  } else {
    // Näytä virheviesti, jos ei ole kommentoitu
    echo "Virhe: Kirjoita toimenpidekommentti!";
  }
}
?>
