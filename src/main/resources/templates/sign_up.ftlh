<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Регистрация</title>

    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="main">

        <div class="container">
            <div class="sign-up-content">
                <form action="/signUp" method="POST" class="signup-form">
                    <h2>Регистрация</h2>
                    <div class="form-textbox">
                        <label for="name">Имя</label>
                        <input type="name" name="name"/>
                    </div>

                    <div class="form-textbox">
                        <label for="fullname">Фамилия</label>
                        <input type="fullname" name="fullname"/>
                    </div>

                     <div class="form-textbox">
                        <label for="age">Возраст</label>
                        <input type="age" name="age"/>
                    </div>

                    <div class="form-textbox">
                        <label for="classNumber">Класс</label>
                        <input type="classNumber" name="classNumber"/>
                    </div>


                    <div class="form-textbox">
                        <label for="email">Email</label>
                        <input type="email" name="email"/>
                    </div>

                    <div class="form-textbox">
                        <label for="password">Пароль</label>
                        <input type="password" name="password"/>
                    </div>

                    <div class="form-textbox">
                        <input type="submit" name="submit" id="submit" class="submit" value="РЕГИСТРАЦИЯ" />
                    </div>
                </form>

               <p class="loginhere">
                    У вас уже есть аккаунт?<a href="/signIn" class="loginhere-link"> Войти</a>
                </p>
            </div>
        </div>

    </div>

    <script src="js/jquery.js"></script>
</body>
</html>