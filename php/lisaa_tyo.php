<?php
include 'conn.php';

// Tarkista, onko "ota työn alle" -nappia painettu
if (isset($_POST['lisaatyo'])) {
  // Tarkista, että työntekijä on valittu ja vikailmoitusID lähetetty
  if (isset($_POST['tyontekija']) && isset($_POST['vikaID'])) {
    // Otetaan lomakkeen tiedot talteen
    $vikaID = $_POST['vikaID'];
    $kohde = $_POST['kohde'];
    $viesti = $_POST['viesti'];
    $lemmikit = $_POST['lemmikit'];
    $yleisavain = $_POST['yleisavain'];
    $etunimi = $_POST['etunimi'];
    $sukunimi = $_POST['sukunimi'];
    $sposti = $_POST['sposti'];
    $puhelin = $_POST['puhelin'];
    $taloyhtioID = $_POST['taloyhtio'];
    $asuntoID = $_POST['asunto'];
    $tyontekijaID = $_POST['tyontekija'];

    try {
      // Lisätään tiedot käsittelytauluun
      $sql = "INSERT INTO kasittely (vikaID, kohde, viesti, lemmikit, yleisavain, etunimi, sukunimi,
                sposti, puhelin, taloyhtioID, asuntoID, tyontekijaID) VALUES (:vikaID, :kohde, :viesti, :lemmikit, :yleisavain,
                :etunimi, :sukunimi, :sposti, :puhelin, :taloyhtioID, :asuntoID, :tyontekijaID)";
      $sql2 = "UPDATE vikailmoitus SET varattu = '1' WHERE vikaID = '$vikaID'";
      $sql3 = "UPDATE tyontekija SET status = '1' WHERE tyontekijaID = '$tyontekijaID'";
      $stmt = $yhteys->prepare($sql);
      $stmt2 = $yhteys->prepare($sql2);
      $stmt3 = $yhteys->prepare($sql3);
      $stmt->bindParam(':vikaID', $vikaID, PDO::PARAM_INT);
      $stmt->bindParam(':kohde', $kohde, PDO::PARAM_STR);
      $stmt->bindParam(':viesti', $viesti, PDO::PARAM_STR);
      $stmt->bindParam(':lemmikit', $lemmikit, PDO::PARAM_INT);
      $stmt->bindParam(':yleisavain', $yleisavain, PDO::PARAM_INT);
      $stmt->bindParam(':etunimi', $etunimi, PDO::PARAM_STR);
      $stmt->bindParam(':sukunimi', $sukunimi, PDO::PARAM_STR);
      $stmt->bindParam(':sposti', $sposti, PDO::PARAM_STR);
      $stmt->bindParam(':puhelin', $puhelin, PDO::PARAM_STR);
      $stmt->bindParam(':taloyhtioID', $taloyhtioID, PDO::PARAM_INT);
      $stmt->bindParam(':asuntoID', $asuntoID, PDO::PARAM_INT);
      $stmt->bindParam(':tyontekijaID', $tyontekijaID, PDO::PARAM_INT);
      $stmt->execute();
      $stmt2->execute();
      $stmt3->execute();

      // Ohjaa takaisin vikailmoituslistaukseen
      header("Location: ../ilmoituslistaus.php");
      exit();
    } catch (PDOException $e) {
      echo "Virhe: " . $e->getMessage();
    }
  } else {
    // Näytä virheviesti, jos työntekijää ei ole valittu tai vikailmoitusID:tä ei ole lähetetty
    echo "Virhe: Työntekijä ei ole valittu tai vikaID:tä ei ole lähetetty!";
  }
}
?>

