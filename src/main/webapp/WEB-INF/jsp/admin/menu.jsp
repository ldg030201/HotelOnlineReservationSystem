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
    <link rel="stylesheet" href="${path}/resources/css/admin-menu.css"/>
    <title>관리자 메뉴</title>
</head>
<body>
<div class="logo"><a href="#"><img src="${path}/resources/img/admin-logo.png" width="15%"></a></div>
<div class="menuContentBox">
    <div class="menu">
        <div class="topMenu">객실</div>
        <div class="bottomMenu">
            <a class="nav" href="${path}/admin/room/reg"><li>객실 등록</li></a>
            <a class="nav" href="${path}/admin/room/list"><li>객실 목록</li></a>
        </div>
    </div>
    <div class="menu">
        <div class="topMenu">예약</div>
        <div class="bottomMenu">
            <a class="nav" href="${path}/admin/reserve/chk"><li>예약 정보 확인</li></a>
        </div>

    </div>
    <div class="menu">
        <div class="topMenu">리뷰</div>
        <div class="bottomMenu">
            <a class="nav" href="${path}/admin/review"><li>리뷰 확인</li></a>
        </div>
    </div>
</div>
<footer>
    <a class="logOut" href="${path}/admin/login/logout">로그아웃</a>
</footer>
</body>
</html>