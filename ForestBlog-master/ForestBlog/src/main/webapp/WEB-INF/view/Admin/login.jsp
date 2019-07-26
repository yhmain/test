<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<!--[if IE 8]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie8" lang="zh-CN">
<![endif]-->
<!--[if !(IE 8) ]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<!--<![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${options.optionSiteTitle} &lsaquo; 登录</title>

    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="/plugin/out/login.css">

    <meta name='robots' content='noindex,follow'/>
    <meta name="viewport" content="width=device-width"/>

</head>
<body>
<div id="login">
    <div id="particles-js" style="display: flex;align-items: center;justify-content: center"></div>
    <%
        String username = "";
        String password = "";
        //获取当前站点的所有Cookie
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {         //对cookies中的数据进行遍历，找到用户名、密码的数据
            if ("username".equals(cookies[i].getName())) {
                username = cookies[i].getValue();
            } else if ("password".equals(cookies[i].getName())) {
                password = cookies[i].getValue();
            }
        }
    %>
    <form name="loginForm" id="loginForm" method="post" class="login-content">
        <p class="login-tit" style="text-align: center">登录</p>
        <p class="login-input">
            <input type="text" name="username" id="user_login" placeholder="用户名/电子邮件" value="<%=username%>" size="20"
                   required/></label>
        </p>
        <p class="login-input">
            <input type="password" name="password" id="user_pass" placeholder="密码" value="<%=password%>" size="20"
                   required/>
        </p>

        <div class="login-btn">

            <div class="login-btn-left" id="submit-btn">
                <span>登录</span>
            </div>

            <div class="login-btn-right" onClick="changeImg()" style="font-size: 13px">
                <img src="/img/checked.png" alt="" id="picture" > 记住密码
                <input name="rememberme" type="checkbox" id="rememberme"  value="1" style="display:none" checked />
                    <%--<input name="rememberme" type="checkbox" id="rememberme" value="1" checked /> 记住密码--%>
            </div>
        </div>
        <div style="margin: 30px auto 0">
            <p id="backtoblog" style="font-size: 15px;text-align: right"><a href="/">&larr; 返回到${options.optionSiteTitle}</a></p>
        </div>
    </form>

    <%

    %>

    <script type="text/javascript">
        function wp_attempt_focus() {
            setTimeout(function () {
                try {
                    d = document.getElementById('user_login');
                    d.focus();
                    d.select();
                } catch (e) {
                }
            }, 200);
        }
        wp_attempt_focus();
        if (typeof wpOnload == 'function') wpOnload();
    </script>

</div>

<div class="clear"></div>

<script src="/js/jquery.min.js"></script>
<script src="/js/out/particles.js"></script>
<script src="/js/out/app.js"></script>
<script type="text/javascript">

    <%--登录验证--%>
    $("#submit-btn").click(function () {

        var user = $("#user_login").val();
        var password = $("#user_pass").val();
        if (user == "") {
            alert("用户名不可为空!");
        } else if (password == "") {
            alert("密码不可为空!");
        } else {
            $.ajax({
                async: false,//同步，待请求完毕后再执行后面的代码
                type: "POST",
                url: '/loginVerify',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: $("#loginForm").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.code == 0) {
                        alert(data.msg);
                    } else {
                        window.location.href = "/admin";

                    }
                },
                error: function () {
                    alert("数据获取失败")
                }
            })
        }
    })

    //给页面绑定回车响应事件
    document.onkeydown = function(e) {
        var key = window.event.keyCode;
        if (key == 13) {
            $("#submit-btn").click(); //处理事件
        }
    }

    //勾选框的特效
    function changeImg() {
        var chk = document.getElementById('rememberme');//通过getElementById获取节点
        let pic = document.getElementById('picture');
        console.log(pic.src);
        if (pic.getAttribute("src", 2) == "/img/check.png") {
            pic.src = "/img/checked.png"
            chk.checked=true;
        } else {
            pic.src = "/img/check.png"
            chk.checked=false;
        }
    }

</script>
</body>
</html>

