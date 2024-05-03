<!DOCTYPE html>
<html lang="en">
<head>
  <title>R.Autio Oy</title>
  <meta charset="utf-8">
  <meta name="author" content="Roope, Miika, Riina ja Nico">
  <meta name="keywords" content="website, school project">
  <meta name="description" content=" ">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/293af4024f.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
  integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
  crossorigin=""/>
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
      <li class="nav-item active">
        <a class="nav-link" href="index.php">Etusivu <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
      <!-- laitettu nyt vain tähän, mietiään keille pitää näkyä-->
        <a class="nav-link" href="tyontekijat.php">Työntekijät</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="yhteydenotto.html">Ota yhteyttä</a>
      </li>
<?php
  session_start();

  // Tarkista onko käyttäjä kirjautunut sisään
  if(isset($_SESSION['kayttajaID'])) {
      // Jos käyttäjä on kirjautunut sisään, näytä kirjaudu ulos -nappi
      echo '<a class="nav-link" href="kirjaudu_ulos.php">Kirjaudu ulos</a>';
  } else {
    // Jos käyttäjä ei ole kirjautunut sisään, näytä kirjautumislinkki
    echo '<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Kirjaudu
    </a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
      <a class="dropdown-item login-button">Asukas</a>
      <a class="dropdown-item login-button">Isannöitsijä</a>
      <a class="dropdown-item login-button">Työntekijä</a>
    </div>
  </li>';
  }
?>
    </ul>
  </div>
</nav>

<!--Hiano logo sivulle-->
<div class="upper-jumbo">
  <div class="container logo">
  <a href="index.php"><img src="img/rautiologo.png"></a>
  <p>R. Autio Oy, parasta palvelua Suomessa!</p>
  </div>
</div>

<!--Palvelut-->
<div class="container palvelut ">
  <div class="row">
    <div class="col-12 col-lg-6" > 
    	<h2 class="h2_otsikko">Palvelut</h2>
  		<p>Tavoitteenamme on tarjota ammattitaitoista palvelua,<br> 
         joka kattaa kaikki kiinteistön pienistä huoltotehtävistä<br>
         suurempiin remontteihin sekä ympäristön<br> kunnossapitoon.<br><br>
         Voimme räätälöidä juuri teidän tarpeisiinne sopivan<br> 
         palvelupaketin, joka pitää kiinteistönne turvallisena,<br> 
         siistinä ja toimivana vuoden<br> jokaisena päivänä. </p>
    </div>
    <div class="col">
      <div class="row " >
        <div class="col m-2 shadow">
          <img src="img/tyokalut.jpg" class="palvelut_img p-2">
          <p>Huolto</p>
        </div>
        <div class="col m-2 shadow">
          <img src="img/siivous.jpg" class="palvelut_img p-2">
          <p>Puhtaus</p>   
        </div>
        <div class="col m-2 shadow">
          <img src="img/lumi.jpg" class="palvelut_img p-2">
          <p>Lumityöt</p>         
        </div>
        <div class="col m-2 shadow">
          <img src="img/roskis.jpg" class="palvelut_img p-2">
          <p>Jätehuolto</p> 
        </div>
        <div class="col m-2 shadow">
          <img src="img/piha.jpg" class="palvelut_img p-2">
          <p>Pihatyöt</p>    
        </div>
        <div class="col m-2 shadow">
          <img src="img/avain.jpg" class="palvelut_img p-2" >
          <p>24h Päivystys</p> 
        </div>
      </div>
    </div>
  </div>
</div>

<!--Kartta-->
<div class="container-fluid kartta-container">
  <div id="kartta"></div>
</div> 

<!-- Footer -->
<footer class="jumbotron footer col-sm-12">
  <div class="col-lg-12 col-md-12 col-sm-12 footerBox">
  <section class="">
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Yhteystiedot -->
          <h6 class="text-uppercase fw-bold mb-4">Yhteystiedot</h6>
          <p><i class="fas fa-home me-3"></i> Tornio, 95400, Suomi</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            r.autio@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i> +358 50 1200</p>
        </div>
  </section>
    <div class="p-4">
      © 2024 Copyright: KoodariRyhmä
      <!--<a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>-->
      <!--Jätän tuon ylemmän koodin tähän jos myöhemmin tarvitsee johonkin kivaan-->
    </div>
  </div>
</footer>

<!-- Kirjautumismodaali -->
<div id="login-form" class="modal">
  <div class="modal-background"></div>
  <div class="modal-content">
    <div class="modal-header">
      <h2>Kirjaudu sisään</h2>
      <span class="close-button">&times;</span>
    </div>
    <div class="modal-body">
      <form>
        <div class="form-group">
          <label for="kayttajatunnus">Käyttäjätunnus:</label>
          <input type="text" id="kayttajatunnus" name="kayttajatunnus">
        </div>
        <div class="form-group">
          <label for="salasana">Salasana:</label>
          <input type="password" id="salasana" name="salasana">
        </div>
        <button type="submit">Kirjaudu</button>
        <div class="error"></div>
      </form>
    </div>
  </div>
</div>

<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="modal.js"></script>
<script src="kartta.js"></script>
</body>
</html>