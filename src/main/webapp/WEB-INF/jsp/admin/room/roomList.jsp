<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/admin-room-list.css"/>
    <title>객실 목록</title>

</head>
<body>
<div class="logo"><a href="${path}/admin/menu"><img src="/img/admin-logo.png" width="10%"></a></div>

<div class="content">
    <c:forEach var="item" items="${roomList}" varStatus="status">
        <div class="room">
            <div class="leftDiv roomDiv">
                <img src="../../../../../saveImg/${item.roomImgUrl}">
            </div>
            <div class="rightDiv roomDiv">
                <h1>${item.roomName}</h1>
                <p>${item.roomDesc}</p>
                <p>이용 가능 인원수 : ${item.numPerson} 명</p>
                <p>가격 : ${item.roomPrice} 원</p>
            </div>

        </div>
    </c:forEach>

</div>
</body>
</html>