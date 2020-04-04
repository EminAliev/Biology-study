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
                    <input type="name" name="name" required
                           pattern="[A-Za-z]+" minlength="6" maxlength="20"/>
                </div>

                <div class="form-textbox">
                    <label for="fullname">Фамилия</label>
                    <input type="fullname" name="fullname" required
                           pattern="[A-Za-z]+" minlength="6" maxlength="20"/>
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
                    <input type="email" name="email" required/>
                </div>

                <div class="form-textbox">
                    <label for="phone">Телефон</label>
                    <input type="phone" name="phone"
                           pattern="^(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$"
                           required/>
                </div>

                <div class="form-textbox">
                    <label for="password">Пароль</label>
                    <input type="password" name="password" required
                           minlength="6" maxlength="20"/>
                </div>

                <div class="form-textbox">
                    <select name="role" class="browser-default custom-select" style="
    background: transparent;
    display: block;
    width: 100%;
    border: 1px solid #a7a7a7;
    color: #32353a;
    font-size: 16px;
    line-height: 1.4;
    font-weight: normal;
    padding: 7px 10px 7px 10px;
    height: 36px;
    vertical-align: top;
    outline: 0;
    -webkit-appearance: none;
    -moz-appearance: none;
    -ms-appearance: none;
    appearance: none !important;">
                        <option selected>Кто ты?</option>
                        <option value="TEACHER">Учитель</option>
                        <option value="STUDENT">Студент</option>
                    </select>
                </div>

                <div class="form-textbox">
                    <input type="submit" name="submit" id="submit" class="submit" value="РЕГИСТРАЦИЯ"/>
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