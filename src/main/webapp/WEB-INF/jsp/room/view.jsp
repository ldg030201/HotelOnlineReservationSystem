<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/common.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>숙소 상세 페이지</title>
    <style>
        body {
            background: #ffffff;
            height: 1539px;
            position: relative;
        }

        .image-4 {
            width: 100%;
            height: 40%;
            position: absolute;
            object-fit: cover;
        }

        .icon-chevron-left {
            width: 4.13%;
            height: 4.7%;
            position: absolute;
            right: 93.87%;
            left: 2%;
            bottom: 73.6%;
            top: 21.7%;
            overflow: visible;
            cursor: pointer;
        }

        .icon-chevron-right {
            width: 4.11%;
            height: 4.68%;
            position: absolute;
            right: 3.03%;
            left: 92.85%;
            bottom: 73.62%;
            top: 21.7%;
            overflow: visible;
            cursor: pointer;
        }

        .div2 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 100px;
            font-weight: 400;
            position: absolute;
            left: 400px;
            top: 730px;
            width: 571.32px;
            height: 170.88px;
        }

        .div3 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 26px;
            font-weight: 400;
            position: absolute;
            left: 400px;
            top: 901px;
            width: 453px;
            height: 293px;
        }

        .n-n {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 24px;
            font-weight: 400;
            position: absolute;
            left: 400px;
            top: 1225px;
            width: 251px;
            height: 86px;
        }

        .rectangle-7 {
            background: #ffffff;
            border-style: solid;
            border-color: #000000;
            border-width: 2px;
            width: 481px;
            height: 800px;
            position: absolute;
            left: 1100px;
            top: 700px;
        }

        .div4 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 38px;
            font-weight: 400;
            position: absolute;
            left: 1120px;
            top: 783px;
            width: 440px;
            height: 67px;
        }

        ._4 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 30px;
            font-weight: 400;
            position: absolute;
            left: 1120px;
            top: 1303px;
            width: 440px;
            height: 67px;
            cursor: pointer;
        }

        .image-2 {
            width: 441px;
            height: 441px;
            position: absolute;
            left: 1120px;
            top: 852px;
            object-fit: cover;
        }

        .vector {
            width: 4.32%;
            height: 2.94%;
            position: absolute;
            left: 1.91%;
            top: 1.23%;
        }

        .rectangle-11 {
            background: rgba(255, 255, 255, 0.12);
            width: 7368px;
            height: 6194px;
            position: absolute;
            left: -5477px;
            top: -822px;
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
    <img class="image-4" src="/img/room/info.png" />
    <a class="div2">${roomInfo.roomName}</a>
    <a class="div3">
        ${roomInfo.roomDesc}
    </a>
    <a class="n-n">
        평점 N.N
    </a>
    <div class="rectangle-7"></div>
    <span class="div4">이런 숙소는 어때요?</span>
    <a class="_4" href="/room/view?roomId=${randomInfo.roomId}">
        ${randomInfo.roomName}
    </a>
    <img class="image-2" src="${randomInfo.roomImgUrl}" />
    <img class="vector leftMenu" src="/svg/leftmenu.svg" />
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