<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>BiologyStudy</title>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="css/home_style.css" rel="stylesheet">


</head>

<body id="page-top">

<#if user??>
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Biology Study</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
              type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
              aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/profile">Мой профиль</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/theme">Темы</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/logout">Выйти</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<#else>
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Biology Study</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
              type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
              aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/signIn">Войти</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/signUp">Регистрация</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</#if>

  <header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">
      <img class="masthead-avatar mb-5" src="img/ava.png" alt="">
      <h1 class="masthead-heading text-uppercase mb-0">Biology Study</h1>
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-book-open"></i></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>
      <p class="masthead-subheading font-weight-light mb-0">Сайт, который поможет тебе в обучении в сфере биологии</p>
    </div>
  </header>

  <section class="page-section function" id="function">
    <div class="container">


      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-book-open"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <main class="mt-5">
    <div class="container">
      <section id="proposals" class="text-center">
          <h2 class="mb-5 font-weight-bold">
            Функции сайта
          </h2>
          <div class="row d-flex justify-content-center mb-4">
            <div class="col-md-8">
              <p class="grey-text">
                На сайте имеется:
              </p>
            </div>
          </div> 
          <div class="row">
            <div class="col-md-4 mb-5">
              <i class="fa fa-comment-medical fa-4x grey-text"></i> 
              <h4 class="my-4 font-weight-bold">Темы</h4>
              <p class="grey-text">Возможность изучать темы по биологии</p>
            </div>
            <div class="col-md-4 mb-5">
              <i class="fa fa-newspaper fa-4x grey-text"></i>
              <h4 class="my-4 font-weight-bold">Тесты</h4>
              <p class="grey-text">Проверить свои полученные знания</p>
            </div>
            <div class="col-md-4 mb-5">
              <i class="fa fa-table fa-4x grey-text"></i>
              <h4 class="my-4 font-weight-bold">Расписание</h4>
              <p class="grey-text">Возможность посмотреть свое расписание</p>
            </div>
          </div>
      </section>
  </section>
    </div>
  </section>

  
  <section class="copyright py-4 text-center text-white">
    <div class="container">
      <small>BIOLOGY STUDY</small>
    </div>
  </section>


  <script type="text/javascript" src="js/jquery.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>


</body>

</html>
