<?php require "php/hae_toimisto.php";?>
<?php require "php/hae_tyonjohto.php";?>
<?php require "php/hae_tyontekija.php";?>

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
  <link rel="stylesheet" href="css/tyyli.css"> 
  <link rel="icon" href="img/tablogo.png">
</head>

<body>
<nav class="navbar sticky-top navbar-expand-lg">
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.html">Etusivu <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="tyontekijat.php">Työntekijät</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="yhteydenotto.html">Ota yhteyttä</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Kirjaudu
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item login-button">Asukas</a>
            <a class="dropdown-item login-button">Isannöitsijä</a>
            <a class="dropdown-item login-button">Työntekijä</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>

  
  <div class="container pt-4 pb-4" >
          <!-- Kortit toimisto -->
    <div class="row justify-content-center p-4"><h3>Toimisto</h3></div>
          <div class="row justify-content-center m-4 pb-4">
            <?php foreach($data_toimisto as $toimisto): ?>
                <div class="card text-center m-2">
                  <!-- kuvan kokoa en saanu lisättyä tyyli.css -->
                  <img src="<?php echo $toimisto->kuvapolku; ?>" class="card-img-top mx-auto mt-4" alt="Kuva" style="width: 120px; height: auto;">
                    <div class="card-body">
                        <h6 class="text-uppercase"><?php echo $toimisto->etunimi. " " . $toimisto->sukunimi; ?></h5>
                        <p><i class="fa-solid fa-phone"></i> <?php echo $toimisto->puhelin; ?></p>
                        <p><i class="fa-solid fa-envelope"></i> <?php echo $toimisto->sposti; ?></p>                 
                    </div>
                </div>
            <?php endforeach; ?>
      </div>
      
            <!-- Kortit työnjohtajille -->
    <div class="row justify-content-center p-4"><h3>Työnjohtajat</h3></div>    
      <div class="row justify-content-center m-4 pb-4">
          <?php foreach($data_tyonjohto as $tyonjohto): ?>
              <div class="card text-center m-2">
                <img src="<?php echo $tyonjohto->kuvapolku; ?>" class="card-img-top mx-auto mt-4" alt="Kuva" style="width: 120px; height: auto;">
                  <div class="card-body">
                      <h6 class="text-uppercase"><?php echo $tyonjohto->etunimi . " " . $tyonjohto->sukunimi; ?></h5>
                      <p><i class="fa-solid fa-phone"></i> <?php echo $tyonjohto->puhelin; ?></p>
                      <p><i class="fa-solid fa-envelope"></i> <?php echo $tyonjohto->sposti; ?></p>                 
                  </div>  
              </div>
          <?php endforeach; ?>
      </div>

              <!-- Kortit työntekijöille -->
      <div class="row justify-content-center p-4"><h3>Työntekijät</h3></div> 
        <div class="row justify-content-center m-4 pb-4">
            <?php foreach($data_tyontekija as $tyontekija): ?>
                <div class="card text-center m-2">
                  <img src="<?php echo $tyontekija->kuvapolku; ?>" class="card-img-top mx-auto mt-4" alt="Kuva" style="width: 120px; height: auto;">
                    <div class="card-body">
                        <h6 class="text-uppercase"><?php echo $tyontekija->etunimi . " " . $tyontekija->sukunimi; ?></h5>
                        <p><i class="fa-solid fa-phone"></i> <?php echo $tyontekija->puhelin; ?></p>
                        <p><i class="fa-solid fa-envelope"></i> <?php echo $tyontekija->sposti; ?></p>                 
                    </div>
                </div>
            <?php endforeach; ?>
        </div>  
  </div>      

  <footer class="jumbotron footer">
  <div class="col-lg-12 col-md-12 col-sm-12 footerBox">
  <!-- Section: Links  -->
  <section class="">
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Tiedot</h6>
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
    </div>
  </div>
</footer>

</body>
</html>