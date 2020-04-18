<#ftl encoding='UTF-8'>
<!doctype html>
<html lang="en">
<head>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script>
        var webSocket;

        function connect() {
            document.cookie = 'X-Authorization=' + '123456' + ';path=/';
            webSocket = new WebSocket('ws://localhost:8080/chat');

            webSocket.onmessage = function receiveMessage(response) {
                let data = response['data'];
                let json = JSON.parse(data);
                $('#messageList').append("<strong>" + json['sender'] + ": </strong>" + json['text'] + "<br>")
            };

            webSocket.onerror = function errorShow() {
                alert('Ошибка авторизации')
            }
        }

        function sendMessage(text, from, whom) {
            let message = {
                'text': text,
                'from': from,
                'whom': whom
            };
            document.getElementById("message").value = "";
            webSocket.send(JSON.stringify(message));
        }

        $(document).ready(function () {
            connect();
            $('#whom').change(function () {
                window.location.href = location.protocol + '//' + location.host + ':' + location.port + "/admin"
                    + '/' + $(this).val();
            });
            let queryParams = new URLSearchParams(window.location.search);
            if (queryParams.has("whom")) {
                console.log(queryParams.get("whom"));
                document.getElementById("whom").value = queryParams.get("whom");
            }
        });

    </script>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Biology Study</title>
    <link rel="stylesheet"
          href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="fonts/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
          type="text/css">
    <link href="/css/testStyle.css" rel="stylesheet">

</head>
<body>
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

<div id="messageText">
    <#if user.role == "ADMIN">
        <select id="whom">
            <#list users as u>
                <option> ${u.email} </option>
            </#list>
        </select>
    </#if>
</div>

<div id="messageSend">
    <label for="message">Текст сообщения</label>
    <input name="message" id="message" placeholder="Message">
    <button onclick="sendMessage(document.getElementById('message').value,
        '${user.email}', <#if user.role == "ADMIN"> document.getElementById('whom').value <#else> '${admin}' </#if>)">
        Send
    </button>
</div>
<br>

<div>
    <h3> Сообщения </h3>

    <div id="messageList">
        <#list messages as message>
            <strong><#if message.getFrom() == "alievemin718@gmail.com">ADMIN: <#else>${message.getFrom()}:</#if></strong> ${message.text}
            <br>
        </#list>
    </div>

</div>


</body>
</html>