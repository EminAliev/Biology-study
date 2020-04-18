<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BiologyStudy</title>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="fonts/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
          type="text/css">
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.5.2.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.js" type="text/javascript"></script>

    <link href="css/testStyle.css" rel="stylesheet">

    <script type="text/javascript">
        $(function () {
            $("#form").validate({
                rules: {
                    question_1: "required",
                    question_2: "required",
                    question_3: "required",
                    question_4: "required"
                },
                messages: {
                    question_1: "You must select an account type",
                    question_2: "You must select an account type",
                    question_3: "You must select an account type",
                    question_4: "You must select an account type"
                }
            });
        });
    </script>

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


<div class="form_test">
    <form method="post" action="/test/submit" id="form">
        <ol type="1">
            <#list questions as question>
                <li>
                    ${question.content}
                    <input type="hidden" name="questionId" value=${question.id}>
                    <ol type="a">
                        <#list question.answers as answer>
                            <li>
                                <input type="radio" name="question_${question.id}" value="${answer.id}">
                                ${answer.content}
                            </li>
                        </#list>
                    </ol>
                </li>
            </#list>
        </ol>
        <br>
        <input type="submit" value="Результат">
    </form>
</div>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<script src="js/jquery.easing.min.js"></script>
<script src="js/tests.js"></script>


</body>

</html>