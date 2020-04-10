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
    <title>Chat</title>
    <link rel="stylesheet"
          href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
</head>
<body>
<h1>BiologyStudy</h1>
<hr/>

<#if user.role == "ADMIN">
    <select id="whom">
        <#list users as u>
            <option> ${u.email} </option>
        </#list>
    </select>
</#if>

<div>
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