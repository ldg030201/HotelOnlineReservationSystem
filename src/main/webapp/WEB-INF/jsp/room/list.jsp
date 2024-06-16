<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/common.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
    <title>숙소 검색 리스트</title>
    <style>
        .main-container {
            background: #ffffff;
            height: 1539px;
            position: relative;
            overflow: hidden;
        }

        .image-1 {
            width: 400px;
            height: 400px;
            position: absolute;
            left: 500px;
            top: 211px;
            object-fit: cover;
        }

        .image-2 {
            width: 400px;
            height: 400px;
            position: absolute;
            left: 500px;
            top: 646px;
            object-fit: cover;
        }

        .image-3 {
            width: 400px;
            height: 400px;
            position: absolute;
            left: 500px;
            top: 1090px;
            object-fit: cover;
        }

        .search-bar {
            background: #ffffff;
            border-style: solid;
            border-color: #000000;
            border-width: 3px;
            width: 928px;
            height: 76px;
            position: absolute;
            left: 490px;
            top: 109px;
        }

        .button-container {
            display: flex;
            gap: 10px;
            position: absolute;
            left: 520px;
            top: 120px;
        }

        .search-text {
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Bold", sans-serif;
            font-size: 24px;
            font-weight: 700;
            height: 57px;
            display: flex;
            align-items: center;
            justify-content: center;
        }


        .search-button {
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Bold", sans-serif;
            font-size: 24px;
            font-weight: 700;
            width: 280px;
            height: 57px;
            background-color: transparent;
            border: 1px solid transparent;
            cursor: pointer;
        }

        .lodging-name-1 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 64px;
            font-weight: 400;
            position: absolute;
            left: 1050px;
            top: 224px;
        }

        .description-1 {
            background: #FFFFFF;
            border: 1px solid #000000;
            padding: 10px;
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 12px;
            font-weight: 200;
            position: absolute;
            left: 1000px;
            top: 328px;
            width: 400px;
        }

        .rating-address-1 {
            background: #FFFFFF;
            border: 1px solid #000000;
            padding: 10px;
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 12px;
            font-weight: 200;
            position: absolute;
            left: 1045px;
            top: 480px;
            width: 300px;
        }

        .lodging-name-2 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 64px;
            font-weight: 400;
            position: absolute;
            left: 1050px;
            top: 678px;
        }

        .description-2 {
            background: #FFFFFF;
            border: 1px solid #000000;
            padding: 10px;
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 12px;
            font-weight: 200;
            position: absolute;
            left: 1000px;
            top: 782px;
            width: 400px;
        }

        .rating-address-2 {
            background: #FFFFFF;
            border: 1px solid #000000;
            padding: 10px;
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 12px;
            font-weight: 200;
            position: absolute;
            left: 1045px;
            top: 934px;
            width: 300px;
        }

        .lodging-name-3 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 64px;
            font-weight: 400;
            position: absolute;
            left: 1050px;
            top: 1119px;
        }

        .description-3 {
            background: #FFFFFF;
            border: 1px solid #000000;
            padding: 10px;
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 12px;
            font-weight: 200;
            position: absolute;
            left: 1000px;
            top: 1223px;
            width: 400px;
        }

        .rating-address-3 {
            background: #FFFFFF;
            border: 1px solid #000000;
            padding: 10px;
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 12px;
            font-weight: 200;
            position: absolute;
            left: 1045px;
            top: 1375px;
            width: 300px;
        }

        .logo-vector {
            width: 4.32%;
            height: 2.94%;
            position: absolute;
            right: 93.77%;
            left: 1.91%;
            bottom: 95.89%;
            top: 1.17%;
            overflow: visible;
            cursor: pointer;
        }

        .header-bar {
            background: #466e8b;
            width: 10%;
            height: 3%;
            position: absolute;
            left: calc(50% - 5%);
            right: calc(50% - 5%);
            bottom: 93.89%;
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

        .rating-select {
            position: absolute;
            left: 40%;
            width: 12%;
            top: 65%;
            height: 5%;
            font-size: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .rating-select-Start1 {
            position: absolute;
            left: 55%;
            width: 12%;
            top: 35%;
            height: 5%;
            font-size: 25px;
            /* display: flex; */
            align-items: center;
            /* justify-content: center; */
            cursor: pointer;
        }

        .rating-select-Start2 {
            position: absolute;
            left: 55%;
            width: 12%;
            top: 64%;
            height: 5%;
            font-size: 25px;
            /* display: flex; */
            align-items: center;
            /* justify-content: center; */
            cursor: pointer;
        }

        .rating-select-Start3 {
            position: absolute;
            left: 55%;
            width: 12%;
            top: 92%;
            height: 5%;
            font-size: 25px;
            /* display: flex; */
            align-items: center;
            /* justify-content: center; */
            cursor: pointer;
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
<div class="main-container" id="mainDiv">
    <c:forEach var="item" items="${roomList}" varStatus="status">
        <img class="image-${status.count}" src="${item.roomImgUrl}"/>
    </c:forEach>
    <div class="search-bar" style="text-align: center; font-size: 35px;">숙소 목록</div>
    <%--<form>
        <div class="button-container">
            <input class="search-button" placeholder="인원 수" size="8">
            <input class="search-button" placeholder="장소" size="8">
            <button class="search-text" style="text-align: center; width: 280px;">검색</button>
        </div>
    </form>--%>
    <c:forEach var="item" items="${roomList}" varStatus="status">
        <a href="/room/view?roomId=${item.roomId}" class="lodging-name-${status.count}">${item.roomName}</a>
        <div class="description-${status.count}">
            ${item.roomDesc}
        </div>
        <%--<div class="rating-address-${status.count}">
            ${item.roomAddress}
        </div>--%>
        <div class="rating-select-Start${status.count}">
            <p>★★★★★</p>
        </div>
    </c:forEach>
    <img class="logo-vector leftMenu" src="/svg/leftmenu.svg" />
    <div class="header-bar"></div>
    <div class="logo">LOGO</div>
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
        <button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 321px; width: 310px; height: 54px; cursor: pointer;">예약 목록</button>
    </c:if>
    <%--<button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 437px; width: 310px; height: 54px; cursor: pointer;">내 정보</button>--%>
    <img class="leftMenu" src="/svg/left-menu-close.svg" style="width: 4.13%; height: 4.7%; position: absolute; right: 92.63%; left: 3.24%; bottom: 93.94%; top: 1.36%; overflow: visible; cursor: pointer;"/>
</div>
</body>
</html>