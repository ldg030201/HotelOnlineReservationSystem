<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/common.css">
    <title>메인홈페이지</title>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script type="text/javascript" src="/js/daterangpickerConfig.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
    <style>
        .div,
        .div * {
            box-sizing: border-box;
        }
        .div {
            background: #ffffff;
            height: 1539px;
            position: relative;
            overflow: hidden;
        }
        .c-bucket-list-graphic-promo-article-2000-x-624-1 {
            width: 1920px;
            height: 672px;
            position: absolute;
            left: 0%;
            top: 0px;
            object-fit: cover;
        }
        .ellipse-1 {
            background: #ffffff;
            border-radius: 50%;
            width: 1920px;
            height: 886px;
            position: absolute;
            top: 500px;
        }
        .vector {
            position: absolute;
            object-fit: contain;
            overflow: visible;
            cursor: pointer;
            width: 4.32%;
            height: 2.94%;
            right: 92.93%;
            left: 2.74%;
            bottom: 95.3%;
            top: 1.75%;
        }

        .group-4 {
            position: absolute;
            inset: 0;
        }

        .rectangle-5 {
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
        .rectangle-2 {
            background: #ffffff;
            border-style: solid;
            border-color: #000000;
            border-width: 3px;
            width: 928px;
            height: 76px;
            position: absolute;
            left: 490px;
            top: 506px;
        }
        .div2 {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Bold", sans-serif;
            font-size: 38px;
            font-weight: 700;
            position: absolute;
            left: 175px;
            top: 515px;
            width: 858px;
            height: 57px;
        }

        .rectangle-3 {
            border-radius: 10px;
            border-style: solid;
            border-color: #000000;
            border-width: 3px;
            width: 928px;
            height: 676px;
            position: absolute;
            left: 490px;
            top: 673px;
            object-fit: cover;
        }

        .button-container {
            display: flex;
            gap: 10px;
            position: absolute;
            left: 520px;
            top: 515px;
        }

        .button {
            color: #000000;
            text-align: center;
            font-family: "Hahmlet-Bold", sans-serif;
            font-size: 22px;
            font-weight: 700;
            width: 280px; /* Adjust width as needed */
            height: 57px;
            background-color: transparent; /* Make background transparent */
            border: 1px solid transparent; /* Make border transparent */
            cursor: pointer; /* Pointer cursor on hover */
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

            $('#date').daterangepicker({
                "showDropdowns": true,
                "locale": localeData,
                "startDate": moment().format('YYYY-MM-DD'),
                "endDate": moment().format('YYYY-MM-DD')
            }, function(start, end, label) {
                console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
            });
        });

        Kakao.init('${kakaoApiJs}');
    </script>
</head>
<body>
<div class="div" id="mainDiv">
    <img class="c-bucket-list-graphic-promo-article-2000-x-624-1" src="/img/mainImg.png"/>
    <div class="ellipse-1"></div>
    <div class="rectangle-5"></div>
    <img class="vector leftMenu" src="/svg/leftmenu.svg" />
    <div class="logo">LOGO</div>
    <div class="rectangle-2"></div>
    <div class="button-container">
        <form action="#" method="get">
            <input type="text" class="button" placeholder="날짜 입력" id="date" required>
            <input type="number" class="button" placeholder="인원 수" required>
            <button class="button" type="submit">검색</button>
        </form>
    </div>
    <div class="rectangle-3" id="map">

    </div>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoApiJs}"></script>
    <script>
        let map = new kakao.maps.Map(document.getElementById('map'), {
            center: new kakao.maps.LatLng(37.33025761863124, 126.68956581605936),
            level: 4,
            mapTypeId : kakao.maps.MapTypeId.ROADMAP
        });

        let marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(37.33025761863124, 126.68956581605936),
            map: map
        });
    </script>
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
    <button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 201px; width: 310px; height: 54px; cursor: pointer;">숙소 리스트</button>
    <c:if test="${not empty userCode}">
        <button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 321px; width: 310px; height: 54px; cursor: pointer;">예약 목록</button>
    </c:if>
    <%--<button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 437px; width: 310px; height: 54px; cursor: pointer;">내 정보</button>--%>
    <img class="leftMenu" src="/svg/left-menu-close.svg" style="width: 4.13%; height: 4.7%; position: absolute; right: 92.63%; left: 3.24%; bottom: 93.94%; top: 1.36%; overflow: visible; cursor: pointer;"/>
</div>
</body>
</html>