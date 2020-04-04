<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Авторизация</title>

    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <link rel="stylesheet" href="css/style.css">
</head>
<body>


<div class="main">

    <div class="container">
        <div class="sign-up-content">
            <#if error.isPresent()>
                <div class="alert-danger" style="text-align: center;color: red" role="alert">Email или пароль введены неверно</div>
            </#if>
            <form action="/signIn" method="POST" class="signup-form">
                <h2 class="form-title">Войти</h2>
                <div class="form-textbox">
                    <label for="email">Email</label>
                    <input type="email" name="email" required/>
                </div>

                <div class="form-textbox">
                    <label for="password">Пароль</label>
                    <input type="password" name="password" required
                           minlength="6" maxlength="20">
                </div>

                <div class="form-textbox">
                    <input type="submit" name="submit" id="submit" class="submit" value="Войти"/>
                </div>
            </form>


        </div>
    </div>

</div>

<script src="js/jquery.js"></script>
</body>
</html>