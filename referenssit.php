<?php require "php/hae_taloyhtiot.php";?>

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
      <li class="nav-item">
        <a class="nav-link" href="index.php">Etusivu <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
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

<div class="container a">
  <div class="row">
    <div class="col-md-4 mb-4">
      <h1 class="otsikko">Referenssit</h1>
    </div>
    <div class="col-md-8 a_teksti" >
        <p>Vuosien varrella meille on kertynyt lukuisia tyytyväisiä asiakkaita.
           Suunnittelemme pienet ja suuret projektit yhdessä asiakkaan kanssa.
           Sitoudumme tarjoamaan korkealaatuista kiinteistönhoitopalvelua,
           joka täyttää asiakkaidemme tarpeet ja odotukset.<br>
           Olemme ylpeitä kumppaneistamme ja tehdystä työstämme.</p>
    </div>
  </div>
</div>

<div class="container b">
    <div class="row">
        <div class="col-md-12 col-lg-6 p-4">
          <img class="b_img" src="img/city-view.jpg">
        </div>
        <div class="col-md-12 col-lg-6">
            <div class="row p-4">
                <div class="col-12 mb-2">
                  <h4 class="otsikko">Asiakkaitamme Torniossa ja lähialueilla</h4>
                </div>
                <div class="col">
                  <ul class=b_lista>
                      <?php foreach($data_taloyhtio as $taloyhtio): ?>
                        <div class="row mb-2 ">
                          <li><?php echo $taloyhtio->taloyhtion_nimi; ?>,
                              <?php echo $taloyhtio->taloyhtion_osoite; ?><br>
                              Tilat: <?php echo $taloyhtio->taloyhtion_tilat; ?>.  
                              Huoneistoja: <?php echo $taloyhtio->huoneistojen_lkm; ?> kpl</li>
                        </div>
                      <?php endforeach; ?>
                  </ul>
                </div>
            </div>
        </div>
   </div>
</div>

<div class="container c">
  <div class="row">
    <div class="col-12 mt-4">
      <h2 class="otsikko">Projekteja</h2>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-sm-12 col-lg-3 m-4">
      <div class="row justify-content-center align-items-center">
        <div class="col-10 col-sm-6 col-lg-12 m-2">
          <img src="img/projekti3.jpeg" class="c_img">
        </div>
        <div class="col-10 col-sm-4 col-lg-12">
          <p>Leikkipuiston suunnittelussa ja rakentamisessa on 
              huomioitu kaikki turvallisuus- ja laatuvaatimukset, jotta voimme taata lasten hauskanpidon ja 
              vanhempien mielenrauhan.</p>
        </div>
      </div>
    </div>
    <div class="col-sm-12 col-lg-3 m-4">
      <div class="row justify-content-center align-items-center">
        <div class="col-10 col-sm-6 col-lg-12 m-2"> 
          <img src="img/projekti2.jpeg" class="c_img">
        </div>
        <div class="col-10 col-sm-4 col-lg-12">
        <p>Energiatehokkuus ja kestävyys ovat avainasioita 
            valaisinvalinnoissamme, jotta voimme tarjota asiakkaillemme parhaan mahdollisen valaistusratkaisun 
            vuosiksi eteenpäin.</p>
        </div>
      </div>
    </div>
    <div class="col-sm-12 col-lg-3 m-4 ">
      <div class="row justify-content-center align-items-center">
        <div class="col-10 col-sm-6 col-lg-12 m-2">
          <img src="img/projekti1.jpeg" class="c_img">
        </div>
        <div class=" col-10 col-sm-4 col-lg-12">
        <p>Aita ei ainoastaan lisää kiinteistön turvallisuutta, vaan myös täydentää sen ulkonäköä ja 
            viihtyisyyttä. Laadukas materiaalivalinta ja ammattitaitoinen työnjälki takaavat aidalle pitkän 
            elinkaaren. </p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid d">
  <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 m-4">
          <h2 class="otsikko">Asiakaspalautteita</h2>
        </div>
      </div>
      <div class="row justify-content-center align-items-center">
        <div class="col-10 col-lg-3 m-2 p-4 d_palaute">
          <p>Todella ammattitaitoinen ja ystävällinen tiimi! He rakensivat meille uuden aidan, ja lopputulos ylitti odotuksemme. Kommunikaatio oli sujuvaa ja työ tehtiin sovitussa aikataulussa.<br>- Asukas B11 </p>
        </div>
        <div class="col-10 col-lg-3 m-2 p-4 d_palaute">
          <p>Olen erittäin tyytyväinen uuden leikkipuiston rakentamiseen. Lapset rakastavat uusia leikkivälineitä, ja minä voin luottaa siihen, että puisto on rakennettu kestävästi ja turvallisesti.<br>- Asukas C2 </p>
        </div>
        <div class="col-10 col-lg-3 m-2 p-4 d_palaute">
          <p>Pakkaspäivänä onnistuin lukitsemaan itseni ulos, mutta kiitos heidän ripeän toimintansa, avain oli pian käsissäni ja pääsin takaisin lämpimään kotiini.<br>- Asukas A4</>
        </div>     
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