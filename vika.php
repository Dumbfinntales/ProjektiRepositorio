<!DOCTYPE html>
<html lang="en">
<head>
  <title>Huoltopyyntö - R.Autio Oy</title>
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
      echo '<li class="nav-item active">
        <a class="nav-link" href="vika.php">Huoltopyyntö</a>
      </li>';
    }
    if(isset($_SESSION['kayttajaID']) && $_SESSION['kayttajaID'] == 3) {
      echo '<li class="nav-item">
      <a class="nav-link" href="ilmoituslistaus.php">Vikailmoitukset</a>
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


<div class="container col-lg-6 col-md-6 col-sm-12 vika-content">
    <h2 class="otsikko">Huoltopyyntö</h2>

    <?php
    // Tarkistetaan onko lomake lähetetty ja näytetään ilmoitus
    if(isset($_SESSION['form_lahetetty']) && $_SESSION['form_lahetetty'] == true) {
        echo '<div class="alert alert-success" role="alert">
                Huoltopyyntö on lähetetty onnistuneesti!
              </div>';
        unset($_SESSION['form_lahetetty']);
    }
    ?>

    <!--Huoltopyyntö lomake-->
    <form action="php/uusi_vika.php" method="POST">
      <br>
      <div class="form-group">
        <div class="row">
          <div class="col">
            <label for="taloyhtio">Valitse taloyhtiö:</label>
            <select class="custom-select" id="taloyhtio" name="taloyhtio" onchange="haeAsunnot(this.value)" required>
                <option value="">Valitse taloyhtiö</option>
                <?php
                // Haetaan taloyhtiöt tietokannasta ja lisätään ne dropdown-valikkoon
                include 'php/conn.php'; // Sisällytetään tietokantayhteys
                
                $sql = "SELECT taloyhtioID, nimi, osoite FROM taloyhtio";
                $result = $yhteys->query($sql);
                
                if ($result->rowCount() > 0) {
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        echo "<option value='{$row['taloyhtioID']}'>{$row['nimi']}, {$row['osoite']}</option>";
                    }
                }
                ?>
            </select>
          </div>

          <div class="col">
            <label for="asunto">Valitse asunto:</label>
            <select class="custom-select" id="asunto" name="asunto" required>
                <option value="">Valitse asunto</option>
            </select>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label for="kohde">Kohde:</label>
        <input type="text" id="kohde" name="kohde" class="form-control" required>
      </div>
      <div class="form-group">
        <label for="viesti">Viesti:</label>
        <textarea id="viesti" class="form-control" name="viesti" rows="5" required placeholder="Kuvaile huollon kohde ja tarve mahdollisimman tarkasti."></textarea>
      </div>
      <div class="form-group">
        <div class="row">
          <div class="col">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="lemmikit" name="lemmikit" value="1">
              <label class="form-check-label" for="lemmikit">Huoneistossa lemmikkejä</label>
            </div>
          </div>
          <div class="col">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="yleisavain" name="yleisavain" value="1">
              <label class="form-check-label" for="yleisavain">Saa käyttää yleisavainta</label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label for="etunimi">Etunimi:</label>
        <input type="text" id="etunimi" name="etunimi" class="form-control" required>
      </div>
      <div class="form-group">
        <label for="sukunimi">Sukunimi:</label>
        <input type="text" id="sukunimi" name="sukunimi" class="form-control" required>
      </div>
      <div class="form-group">
        <div class="row"> 
          <div class="col">
            <label for="sposti">Sähköposti:</label>
            <input type="email" id="sposti" name="sposti" class="form-control" required>
          </div>

          <div class="col">
            <label for="puhelin">Puhelin:</label>
            <input type="tel" id="puhelin" name="puhelin" class="form-control" required>
          </div>
        </div>
      </div>
        
      <button name="laheta" type="submit" class="btn btn-warning">Lähetä</button>
    </form>
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
</footer>

</body>
</html>

