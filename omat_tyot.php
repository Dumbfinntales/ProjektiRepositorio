<!DOCTYPE html>
<html lang="en">
<head>
  <title>Varatut työt - R.Autio Oy</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/293af4024f.js" crossorigin="anonymous"></script>
  <script src="js/modal.js"></script>
  <script src="js/vika.js"></script>
  <link rel="stylesheet" href="css/tyyli.css">
  <link rel="icon" href="img/tablogo.png">
</head>
<body>

<!--Navbar-->
<nav class="navbar navbar-dark sticky-top navbar-expand-lg" data-mdb-theme="light">
    
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.php">Etusivu</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="referenssit.php">Referenssit</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tyontekijat.php">Työntekijät</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="yhteydenotto.php">Ota yhteyttä</a>
      </li>
      <?php
    session_start();
    if(isset($_SESSION['kayttajaID'])) {
      echo '<li class="nav-item">
        <a class="nav-link" href="vika.php">Huoltopyyntö</a>
      </li>';
  }
  if(isset($_SESSION['kayttajaID']) && $_SESSION['kayttajaID'] == 3) {
    echo '<li class="nav-item">
    <a class="nav-link active" href="ilmoituslistaus.php">Vikailmoitukset</a>
  </li>';
  }
?>

    </ul>
    <ul class="navbar-nav">
<?php
    // Tarkista onko käyttäjä kirjautunut sisään
    if(isset($_SESSION['kayttajaID'])) {
        // Jos käyttäjä on kirjautunut sisään, näytä kirjaudu ulos -nappi
        echo '<a class="nav-link" href="kirjaudu_ulos.php">Kirjaudu ulos</a>';
    } else {
      // Jos käyttäjä ei ole kirjautunut sisään, näytä kirjautumislinkki
      echo '<li class="nav-item">
      <a class="nav-link login-button" href="#" id="login-button" role="button" aria-haspopup="true" aria-expanded="false">
        Kirjaudu
      </a>
    </li>';
    }
?>
    </ul>
  </div>
</nav>

<div class="container-fluid contents">
<?php

include 'php/conn.php';

try {
    // Retrieve all entries from the database with related data
    $sql = "SELECT k.*, ty.etunimi AS t_etunimi, ty.sukunimi AS t_sukunimi,
    t.nimi AS taloyhtio_nimi, a.huoneisto AS asunto FROM kasittely k
    JOIN tyontekija ty ON k.tyontekijaID = ty.tyontekijaID
    JOIN taloyhtio t ON k.taloyhtioID = t.taloyhtioID
    JOIN asunnot a ON k.asuntoID = a.asuntoID
    WHERE k.valmispvm IS NULL";
    $stmt = $yhteys->query($sql);
    $entries = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Virhe haettaessa vikailmoituksia: " . $e->getMessage();
}

?>

<h2 class="vikah2 otsikko">Varatut työt</h2>
<div class="container-fluid p-3 virhe_contents">

<?php if (isset($entries) && !empty($entries)) : ?>
    <div class="row">
        <?php foreach ($entries as $entry) : ?>
            <div class="col-md-3">
                <strong>Kohde:</strong> <?php echo $entry['kohde']; ?><br>
                <strong>Viesti:</strong> <?php echo $entry['viesti']; ?><br>
                <strong>Lemmikit:</strong> <?php echo $entry['lemmikit'] ? 'Kyllä' : 'Ei'; ?><br>
                <strong>Yleisavain:</strong> <?php echo $entry['yleisavain'] ? 'Kyllä' : 'Ei'; ?><br>
                <strong>Etunimi:</strong> <?php echo $entry['etunimi']; ?><br>
                <strong>Sukunimi:</strong> <?php echo $entry['sukunimi']; ?><br>
                <strong>Sähköposti:</strong> <?php echo $entry['sposti']; ?><br>
                <strong>Puhelin:</strong> <?php echo $entry['puhelin']; ?><br>
                <strong>Taloyhtiö:</strong> <?php echo $entry['taloyhtio_nimi']; ?><br>
                <strong>Asunto:</strong> <?php echo $entry['asunto']; ?><br>
                <strong>Kuka tekee:</strong> <?php echo $entry['t_etunimi'] . " " . $entry['t_sukunimi']; ?><br>
                <strong>VikaID:</strong> <?php echo $entry['vikaID']; ?><br><br>
                <form action="php/valmis_tyo.php" method="POST">
                  <input type="hidden" name="vikaID" value="<?php echo $entry['vikaID']; ?>">
                  <input type="hidden" name="tyontekijaID" value="<?php echo $entry['tyontekijaID']; ?>">
                  <textarea class="form-control" name="toimenpide" required oninvalid="this.setCustomValidity('Toimenpide pitää kirjoittaa!')"
                  placeholder="Kirjoita toimenpiteesi"></textarea><br>
                  <button name="valmis" type="submit" class="btn btn-warning">Merkkaa tehdyksi</button><br><br>
                </form>
            </div>
        <?php endforeach; ?>
      </div>
<?php else : ?>
    <p>Ei vikailmoituksia.</p>
<?php endif; ?>
</div>

<a href="ilmoituslistaus.php"><button name="omatyo" class="btn btn-danger omatyo">Takaisin</button></a>
</div>
  

<!-- Kirjautumismodaali -->
  <div id="login-form" class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
      <div class="modal-header">
        <h2 id="kirjautumisotsikko">Kirjaudu sisään</h2>
        <span class="close-button">&times;</span>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="kayttajatunnus">Käyttäjätunnus:</label>
            <input class="login_input" type="text" id="kayttajatunnus" name="kayttajatunnus">
          </div>
          <div class="form-group">
            <label for="salasana">Salasana:</label>
            <input class="login_input" type="password" id="salasana" name="salasana">
          </div>
          <button type="submit">Kirjaudu</button>
          <div class="error"></div>
        </form>
      </div>
    </div>
  </div>

<!-- Footer -->
<footer class="jumbotron footer col-sm-12">
  <div class="col-lg-12 col-md-12 col-sm-12 footerBox">
  <section class="">
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Yhteystiedot -->
          <h6 class="text-uppercase fw-bold mb-4">Yhteystiedot</h6>
          <p><i class="fas fa-home me-3"></i> Jokikatu 3, 95400, Tornio </p>
          <p><i class="fas fa-envelope me-3"></i> r.autio@kiinteistohuolto.com</p>
          <p><i class="fas fa-phone me-3"></i> +358 50 1200</p>
          <p>Y-tunnus: 2345671-8</p>
        </div>
  </section>
    <div class="p-2">
      © 2024 Copyright: KoodariRyhmä
    </div>
  </div>
</footer>

</body>
</html>