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

  <div class="container-fluid text-center p-4">
    <h3>Toimisto</h3>
    <div class="row justify-content-center p-4"> 
        <?php include 'php/get_toimisto.php'; ?>
    </div>
  </div>

  <div class="container-fluid text-center p-4 ">
    <h3>Työnjohtajat</h3>
    <div class="row justify-content-center p-4"> 
        <?php include 'php/get_johto.php'; ?>
    </div>
  </div>

  <div class="container-fluid text-center p-4">
    <h3>Työntekijät</h3>
    <div class="row justify-content-center p-4"> 
        <?php include 'php/get_tyontekijat.php'; ?>
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