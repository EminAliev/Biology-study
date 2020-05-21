<!DOCTYPE html>
<#import "spring.ftl" as spring />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Регистрация</title>

    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <link rel="stylesheet" href="css/style.css">
</head>
<style>
    .error {
        color: #ff0000;
    }
</style>

<body>

<div class="main">

    <div class="container">
        <div class="sign-up-content">
            <@spring.bind "form"/>
            <form action="/signUp" method="POST" class="signup-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <h2>Регистрация</h2>
                <div class="form-textbox">
                    <label for="name">Имя</label>
                    <@spring.formInput "form.name"/>
                    <@spring.showErrors "<br>"/>
                </div>

                <div class="form-textbox">
                    <label for="fullname">Фамилия</label>
                    <@spring.formInput "form.fullname"/>
                    <@spring.showErrors "<br>"/>
                </div>

                <div class="form-textbox">
                    <label for="age">Возраст</label>
                    <@spring.formInput "form.age"/>
                    <@spring.showErrors "<br>"/>
                </div>

                <div class="form-textbox">
                    <label for="classNumber">Класс</label>
                    <@spring.formInput "form.classNumber"/>
                    <@spring.showErrors "<br>"/>
                </div>


                <div class="form-textbox">
                    <label for="email">Email</label>
                    <@spring.formInput "form.email"/>
                    <@spring.showErrors "<br>"/>
                </div>

                <div class="form-textbox">
                    <label for="phone">Телефон</label>
                    <@spring.formInput "form.phone"/>
                    <@spring.showErrors "<br>"/>
                </div>

                <div class="form-textbox">
                    <label for="password">Пароль</label>
                    <@spring.formInput "form.password"/>
                    <@spring.showErrors "<br>","error"/>
                </div>

                <div class="form-textbox">
                    <label for="password">День рождения</label>
                    <@spring.formInput "form.birthday"/>
                    <@spring.showErrors "<br>","error"/>
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