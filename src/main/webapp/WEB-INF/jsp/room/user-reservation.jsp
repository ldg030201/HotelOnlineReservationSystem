<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/common.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
    <title>예약 리스트</title>
    <style>
        .div, .div * {
            box-sizing: border-box;
        }

        .div {
            background: #ffffff;
            height: 1539px;
            position: relative;
            overflow: hidden;
        }

        .vector {
            width: 4.32%;
            height: 2.94%;
            position: absolute;
            right: 93.1%;
            left: 2.58%;
            bottom: 94.91%;
            top: 2.14%;
            overflow: visible;
            cursor: pointer;
        }

        .rectangle-5 {
            background: #466e8b;
            width: 10%;
            height: 3%;
            position: absolute;
            left: calc(50% - 5%);
            right: calc(50% - 5%);
            top: 1.75%;
        }
        .logo {
            color: #ffffff;
            text-align: center;
            font-family: "Hahmlet-Bold", sans-serif;
            font-size: 24px;
            font-weight: 700;
            position: absolute;
            left: calc(50% - 6.4%);
            right: calc(50% - 6.4%);
            width: 12.8%;
            bottom: 93.89%;
            top: 1.88%;
            height: 4.22%;
        }

        .div2 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Bold", sans-serif;
            font-size: 60px;
            font-weight: 700;
            position: absolute;
            right: 63.67%;
            left: 10.56%;
            width: 25.77%;
            bottom: 87.26%;
            top: 9.23%;
            height: 3.51%;
        }

        .image-1 {
            width: 33.25%;
            height: 25.99%;
            position: absolute;
            right: 56.19%;
            left: 10.56%;
            bottom: 55.62%;
            top: 18.39%;
            object-fit: cover;
        }

        .image-2 {
            width: 33.25%;
            height: 25.99%;
            position: absolute;
            right: 56.19%;
            left: 10.56%;
            bottom: 23.98%;
            top: 50.03%;
            object-fit: cover;
        }

        .frame-1 {
            display: flex;
            flex-direction: column;
            gap: 29px;
            align-items: center;
            justify-content: flex-start;
            position: absolute;
            left: calc(50% - -36px);
            top: calc(50% - 438.5px);
        }

        .div3 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 64px;
            font-weight: 400;
            position: relative;
        }

        ._2000-00-00-2000-00-00-n {
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 24px;
            font-weight: 400;
            position: relative;
        }

        .n {
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 24px;
            font-weight: 400;
            position: relative;
        }

        .frame-2 {
            display: flex;
            flex-direction: column;
            gap: 29px;
            align-items: center;
            justify-content: flex-start;
            position: absolute;
            left: calc(50% - -36px);
            top: calc(50% - -48.5px);
        }

        .rectangle-1 {
            background: #466e8b;
            width: 14.21%;
            height: 4.68%;
            position: absolute;
            right: 28.75%;
            left: 57.03%;
            bottom: 55.62%;
            top: 39.7%;
            cursor: pointer;
            color: #ffffff;
            font-size: 30px;
            font-weight: 400;
        }

        .rectangle-2 {
            background: #466e8b;
            width: 14.21%;
            height: 4.68%;
            position: absolute;
            right: 28.75%;
            left: 57.03%;
            bottom: 23.98%;
            top: 71.35%;
            cursor: pointer;
            color: #ffffff;
            font-size: 30px;
            font-weight: 400;
        }
    </style>
    <script>
        $(() => {
            $(document).on('click', '.leftMenu', function () {
                $('#leftMenuDiv').toggle();
                $('#mainDiv').toggle();
            }).on('click', '#login', function () {
                Kakao.Auth.authorize({
                    redirectUri: 'http://${serverIp}:8080/main/login',
                });
            }).on('click', '#loginOut', function () {
                if(!confirm("로그아웃 하시겠습니까?")) return false;
                location.href = "/main/logout";
            });

            Kakao.init('${kakaoApiJs}');
        });
    </script>
</head>
<body>
<div class="div" id="mainDiv">
    <img class="vector leftMenu" src="/svg/leftmenu.svg" />
    <div class="rectangle-5"></div>
    <div class="logo">LOGO</div>
    <div class="div2">예약 목록</div>
    <c:forEach var="item" items="${reservationList}" varStatus="status">
        <img class="image-${status.count}" src="${item.roomImgUrl}" />
        <div class="frame-${status.count}">
            <a href="/room/view?roomId=${item.roomId}" class="div3">${item.roomName}</a>
            <a class="n">
                아래 리뷰를 클릭하여 리뷰를 남겨주세요.
            </a>
        </div>
        <a href="/room/review?roomId=${item.roomId}" class="rectangle-${status.count}" style="text-align: center; line-height: 70px;">리뷰</a>
    </c:forEach>
</div>

<div style="background: #ffffff; height: 1539px; position: relative; display: none;" id="leftMenuDiv">
    <div style="background: rgba(191, 191, 191, 0.5); left: 50%; width: 50%; height: 100%; position: absolute; backdrop-filter: blur(25px);"></div>
    <div style="background: #ffffff; border-style: solid; border-color: #000000; border-width: 3px; width: 50%; height: 100%; position: absolute;"></div>
    <button style="background: #466e8b; width: 163px; height: 62px; position: absolute; left: 750px; top: 26px;"></button>
    <c:if test="${empty userCode}">
        <button style="color: #ffffff; text-align: center; font-family: 'Inter-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 764px; top: 30px; cursor: pointer;" id="login">로그인</button>
    </c:if>
    <c:if test="${not empty userCode}">
        <button style="color: #ffffff; text-align: center; font-family: 'Inter-Bold', sans-serif; font-size: 35px; font-weight: 700; position: absolute; left: 764px; top: 30px; cursor: pointer;" id="loginOut">로그아웃</button>
    </c:if>
    <a href="/room/list" style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 201px; width: 310px; height: 54px; cursor: pointer;">숙소 리스트</a>
    <c:if test="${not empty userCode}">
        <a href="/room/user-reservation" style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 321px; width: 310px; height: 54px; cursor: pointer;">예약 목록</a>
    </c:if>
    <%--<button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 437px; width: 310px; height: 54px; cursor: pointer;">내 정보</button>--%>
    <img class="leftMenu" src="/svg/left-menu-close.svg" style="width: 4.13%; height: 4.7%; position: absolute; right: 92.63%; left: 3.24%; bottom: 93.94%; top: 1.36%; overflow: visible; cursor: pointer;"/>
</div>
</body>
</html>