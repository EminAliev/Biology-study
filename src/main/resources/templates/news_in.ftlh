<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Biology Study</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="/css/testStyle.css" rel="stylesheet">
</head>

<body>
<#if user??>
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="/">Biology Study</a>
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
                    type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive"
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
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/news">Новости</a>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/support">Помощь</a>
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
                    type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/news">Новости</a>
                    </li>
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
<div class="container my-3 my-sm-5">
    <div class="row">
        <div class="col-12 col-lg-8">
            <article class="mb-3">
                <header class="mb-3">
                    <h1>&nbsp;
                        &nbsp;</h1>
                    <h1>
                        ${news.nameNews}</h1>
                    <div class="small">
                        <a href="#" class="badge badge-secondary">#Биология</a>
                        <a href="#" class="badge badge-secondary">#Важное</a>
                        <a href="#" class="badge badge-secondary">#Образование</a>
                    </div>
                </header>
                <section id="main" class="mb-3">
                    <figure class="figure">
                        <img src="${news.urlPhoto}"
                             class="figure-img img-fluid" alt="Figure 1">
                        <figcaption class="figure-caption">
                            <p class="small mb-0">${news.description}</p>
                        </figcaption>
                    </figure>
                    <p class="lead">
                        ${news.text}
                    </p>
                </section>
                <section id="comments" class="small">
                    <h2 class="mb-3 mt-2">Комментарии</h2>
                    <#list comments as comment>
                    <div class="media mb-2">
                        <img src="/files/${comment.user.image.storageFileName}" alt="media object image"
                             class="mr-3 rounded-circle" style="height: 64px" width="64px">
                        <div class="media-body">
                            <p>${comment.user.name}</p>
                            <p>${comment.text}</p>
                        </div>
                    </div>
                    </#list>
                    <hr>
                    <#if user??>
                    <form method="post" action="/news">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="comment">Комментарий</label>
                                    <textarea name="text" rows="5" class="form-control" required id="text"
                                              placeholder="Введите комментарий..."></textarea>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Комментировать</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    </#if>
                </section>
            </article>
        </div>
    </div>
</div>


<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>
</body>

</html>



