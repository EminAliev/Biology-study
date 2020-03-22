<#ftl encoding='utf-8'/>
<!DOCTYPE html>
<html>

<#include "base.ftlh"/>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Темы</title>
    <style type="text/css">
        body {
            margin: 0;
        }
        #sidebar, #content {
            position: absolute;
        }
        #sidebar, #content {
            overflow: auto;
            padding: 10px;
        }
        #header {
            height: 80px;
            border-bottom: 2px solid #7B5427;
        }
        #header h1 {
            padding: 20px;
            margin: 0;
        }
        #sidebar {
            width: 150px;
            background: #ECF5E4;
            border-right: 1px solid #231F20;
            top: 82px;
            bottom: 0;
        }
        #content {
            top: 82px;
            left: 170px;
            bottom: 0;
            right: 0;
        }
    </style>
</head>


<body>
<div id="header"><h1>Темы</h1></div>
<div id="sidebar">
    <#list themes as theme>
        <p/> <a href="${url + "/theme?themeId=" + theme.id}">${theme.nameTheme}</a>
    </#list>
</div>
<div id="content">
    <#if theme??>
        ${theme.textTheme}
        <p/> <a href="${url + "/test" + "?testId=" + theme.id}">Начать тест</a>
        <p/> <a href="${"/comments"}">Комментарии</a>
    </#if>

</div>
</body>
</html>
