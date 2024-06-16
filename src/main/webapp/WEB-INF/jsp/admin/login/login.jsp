<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${path}/resources/css/common.css"/>
    <link rel="stylesheet" href="${path}/resources/css/admin-login.css"/>
    <title>관리자 로그인</title>

</head>
<body>
    <div class="logo"><img src="${path}/resources/img/admin-logo.png" width="25%"></div>
    <h1 class="pageName">관리자 페이지</h1>
    <form method="post" action="${path}/admin/login/do-login" class="loginForm">
        <label>
            <input class="input formStyle" placeholder="아이디" type="text" name="adminId">
        </label>
        <br>
        <label>
            <input class="input formStyle" placeholder="비밀번호" type="password" name="adminPw">
        </label>
        <div class="loginBtnBox">
            <button class="loginBtn formStyle">로그인</button>
        </div>
        <p class="guiMsg">${result}</p>
    </form>
</body>
</html>