<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/admin-reserve.css"/>
    <title>예약 정보</title>

</head>
<body>
<div class="logo"><a href="${path}/admin/menu"><img src="/img/admin-logo.png" width="10%"></a></div>

<div class="content">
    <c:forEach var="reserve" items="${list}" >
        <div class="room">
            <div class="leftDiv roomDiv">
                <img src="../../../../../saveImg/${reserve.roomImgUrl}">
            </div>
            <div class="rightDiv roomDiv">
                <h1>${reserve.roomName}</h1>
                <c:set var="userId" value="${reserve.userCode}"/>
                <p>예약자 ID : ${fn:substring(userId,0,5) }</p>
            </div>

        </div>
    </c:forEach>
</div>
</body>

</html>