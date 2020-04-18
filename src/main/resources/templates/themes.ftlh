<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Темы</title>

    <script>
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Кнопка, что спровоцировало модальное окно

            var recipient = button.data('whatever'); // Извлечение информации из данных-* атрибутов

            // Если необходимо, вы могли бы начать здесь AJAX-запрос (и выполните обновление в обратного вызова).

            // Обновление модальное окно Контента. Мы будем использовать jQuery здесь, но вместо него можно использовать привязки данных библиотеки или других методов.

            var modal = $(this);
            modal.find('.modal-title').text('New message to ' + recipient);
            modal.find('.modal-body input').val(recipient)
        })
    </script>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="fonts/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
          type="text/css">

    <link href="css/testStyle.css" rel="stylesheet">
</head>
<body id="page-top">
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/">Biology Study</a>
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

<div id="sidebar">
    <#list themes as theme>
        <p/> <a href="${url + "/theme?themeId=" + theme.id}" style="color: black">${theme.nameTheme} </a>
    </#list>
    <h2>&nbsp;</h2>
    <h1>&nbsp;</h1>
    <h1>&nbsp;</h1>
    <h1>&nbsp;</h1>
    <h1>&nbsp;</h1>
    <h1>&nbsp;</h1>
    <h1>&nbsp;</h1>
    <h1>&nbsp;</h1>
    <h1>&nbsp;</h1>
    <form method="post" action="/theme">
        <div class="bd-example">
            <button type="button" class="btn btn-primary" style="color: black; text-align: center"
                    data-toggle="modal" data-target="#exampleModal"
                    data-whatever="@mdo">Предложить тему
            </button>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="exampleModalLabel">Новая тема</h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Название темы:</label>
                                    <input type="text" class="form-control" id="nameTheme" name="nameTheme">
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="form-control-label">Текст темы:</label>
                                    <textarea class="form-control" id="textTheme" name="textTheme"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                            <button type="submit" class="btn btn-primary">Сохранить</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="content">
    <#if theme??>
        <p class="lead">
            ${theme.textTheme}
        </p>
        <p></p>
        <p/> <a href="${url + "/test" + "?testId=" + theme.id}">Начать тест</a>
    </#if>

</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<script src="js/jquery.easing.min.js"></script>
<script src="js/tests.js"></script>


</body>
</html>