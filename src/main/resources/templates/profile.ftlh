<!DOCTYPE html>
<#import "spring.ftl" as spring />
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Biology Study</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/profileStyle.css" rel="stylesheet">
    <link href="css/testStyle.css" rel="stylesheet">

    <script src="/js/jquery.js"></script>
    <script>
        function sendFile() {
            // данные для отправки
            let formData = new FormData();
            // забрал файл из input
            let files = ($('#file'))[0]['files'];
            // добавляю файл в formData
            [].forEach.call(files, function (file, i, files) {
                formData.append("file", file);
            });

            $.ajax({
                type: "POST",
                url: "/files",
                data: formData,
                processData: false,
                contentType: false
            })
                .done(function (response) {
                    alert(response)
                })
                .fail(function () {
                    alert('Error')
                });
        }
    </script>


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
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="/profile"><@spring.message 'page.nav.profile'/></a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="/theme"><@spring.message 'page.nav.theme'/></a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="/news"><@spring.message 'page.nav.news'/></a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="/support"><@spring.message 'page.nav.support'/> </a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="/logout"><@spring.message 'page.nav.logout'/></a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <select onchange="window.location.href=this.options[this.selectedIndex].value" style="display: block;
  padding: 0.5rem 1rem; color: black">
                        <option style="color: black"><@spring.message 'page.nav.language'/></option>
                        <option value="http://localhost:8080/profile?lang=ru">Русский</option>
                        <option value="http://localhost:8080/profile?lang=en">English</option>
                    </select>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
    <div id="main">
        <div class="row" id="real-estates-detail">
            <div class="col-lg-4 col-md-4 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <header class="panel-title">
                        </header>
                    </div>
                    <div class="panel-body">
                        <div class="text-center" id="author">
                            <#if model.user.imageUrl??>
                                <img class="img-circle" width='200' height='200' src="${model.user.imageUrl}">
                            <#else>
                                <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw0NDQ0PDQ0NDQ4NDQ0NDg0NDQ8NDQ8NFREWFhURFRUYHSggGBolGxgVITEhKSkrLi4uFx8zODMtNygtLisBCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAbAAEBAQEBAQEBAAAAAAAAAAAAAQUEAwIGB//EADEQAQACAAMFBgQHAQEAAAAAAAABAgMFEQQhMUFREiIyYXGRcoGx0RMjM0JSoeGCYv/EABQBAQAAAAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwD+0igIqAKIAKiggoCCgIKAgoCCgIKAgoCCoAAAACgAIqAAoIKAAAAAA+b3isa2mIjrM6A+hx4mY4ccNbekbnPbNZ5Uj5yDUGVGa2/hX3l64eaVnxVmPON4NAeeFjVvGtbRP1egAAAACKgAKCCgIqKAioAqKCKAAADzxcWtI1tOkfV9WtERMzuiI1n0YW1bROJbWeH7Y6QDox8ytPgjsx1nfZx3vNp1tMzPWZ1fIAAAAC0vNZ1rMxMc4auBmVJiO3rW3OYjWJ82SA/Q4WNW/htE6cX2wNmxpw7xaOHCY6w34nXfHPeAKgAoCCgIKAigAioAqKAAAADhzbE0pFf5T/UMh35vbv1jpX6y4AAAAAAAAAG7sF+1hU8o7PtuYTYyr9L/AKkHaigIKAgoCCgIoAIqAKigAAAAx82/Uj4I+suJoZxXvUnrWY9p/wBZ4AAAAAAAADayuPyo85tP9sVu7BGmFT01/sHQAAAAAAigAACKAigAAAADPzivcrPS2nvDKaGb42sxSOXen1Z4AAAAAAAADe2L9LD+GGC1MpxtYmk8u9HpzBogAIoCCgIKAigAAAAAAAADGzWPzfWtXG0M4r3qT1rMe0/6zwAAAAAAAAHXlf6sfDZyO7KK/mTPSv1kGsCgAAAAAAgKAAAAAIoAAOPNMLtYescaTr8ubGfpXBt+yYcUtatdJjSd3Dj0BkgAAAAAAANjK8Ga0mZ43nX5cnxl+x17MXtGszviJ4RDQAAAAAEUAAEVFAAAAAAAAAeO2RrhX+GXs+cSutZjrEwD84ExMbp4xun1AAAAAAfeDhTe0VjnPtHUG9gRpSkf+a/R6JEKAIAoAAAAAIqKAAAAAAAAAD4xsSKVm08oBwZrgRpF43TrEW8/NmPrEvNpmZmZmZ1fIAAAADYyvBitO1zvz8ujHWLTHCZj0mYB+kHhseN+JSJ58J9XsCiAKIAogCiKCKgCiKAAAAAPjFxa0jW1oj14uDGzSP2V187fYGkyc02ntT2KzurPe856PDE23FtxtMR0ruc4AAAAAAAAOvL9p/DtpPhtunynlLZfm3thbViU8Np06TvgG+MvBzSf31+dfs78HaKX8Nony4T7A9RFAEUAAAQBQfGJiVrGtpiI8wfY4MXM6R4Im09Z3Q4cbbMS/G2kdK7oBq4+2YdOM6z0rvln4+ZXturpSPeziAW1pmdZmZnrO9AAAAAAAAAAAAAAIkAdeBmGJXj348+Pu0MDbsO/Psz0t92IA/SjAwdqxKeG06dJ3w7sHNInx1mPOu+AaI88LGpfw2ifq9AAAcG3bd2JmtPFztyj/WVe82nW0zM9Z3pM6gAAAAAAAAAAAAAAAAAAAAAAAALEzE6xMxPWN0tHYswnWK4nPdFvuzQH6Ufnvxr/AMre8gPMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQB6YXH5PQAAAAAAAAAAAAAHxi8gB5gAAAAAAA//9k=">
                            </#if>
                            <h3>${model.user.name}</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-xs-12">
                <div class="panel">
                    <p><@spring.message 'profile.about_user'/></p>
                    <div id="myTabContent" class="tab-content">
                        <table class="table table-th-block">
                            <tbody>
                            <tr>
                                <td class="active"><@spring.message 'profile.name'/></td>
                                <td>${model.user.name}</td>
                            </tr>
                            <tr>
                                <td class="active"><@spring.message 'profile.surname'/></td>
                                <td>${model.user.fullname}</td>
                            </tr>
                            <tr>
                                <td class="active"><@spring.message 'profile.email'/></td>
                                <td>${model.user.email}</td>
                            </tr>
                            <tr>
                                <td class="active"><@spring.message 'profile.classNumber'/></td>
                                <td>${model.user.classNumber}</td>
                            </tr>
                            <tr>
                                <td class="active"><@spring.message 'profile.age'/></td>
                                <td>${model.user.age}</td>
                            </tr>
                            <tr>
                                <td class="active"><@spring.message 'profile.phone'/></td>
                                <td>${model.user.phone}</td>
                            </tr>

                            </tbody>
                        </table>
                        <input type="button" class="btn btn-primary" value="<@spring.message 'profile.edit'/>"
                               onclick="location.href = 'http://localhost:8080/editProfile';">

                    </div>
                    <div class="tab-pane fade" id="contact">
                    </div>
                </div>
            </div>
        </div>
    </div>


</div><!-- /.main -->
</div><!-- /.container -->

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