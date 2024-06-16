<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script>
        $(() => {
            $(document).on('click', '.leftMenu', function () {
                $('#leftMenuDiv').toggle();
                $('#mainDiv').toggle();
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
    <button style="color: #ffffff; text-align: center; font-family: 'Inter-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 764px; top: 30px; cursor: pointer;">로그인</button>
    <button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 201px; width: 310px; height: 54px; cursor: pointer;">내 정보</button>
    <button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 321px; width: 310px; height: 54px; cursor: pointer;">숙소 리스트</button>
    <button style="color: #000000; text-align: left; font-family: 'Hahmlet-Bold', sans-serif; font-size: 45px; font-weight: 700; position: absolute; left: 64px; top: 437px; width: 310px; height: 54px; cursor: pointer;">예약 목록</button>
    <div style="border-style: solid; border-color: #000000; border-width: 3px 0 0 0; width: 140px; height: 0px; position: absolute; left: 64px; top: 265.25px; transform-origin: 0 0; transform: rotate(0deg) scale(1, 1);"></div>
    <div style="border-style: solid; border-color: #000000; border-width: 3px 0 0 0; width: 230px; height: 0px; position: absolute; left: 64px; top: 383.51px;"></div>
    <div style="border-style: solid; border-color: #000000; border-width: 3px 0 0 0; width: 190px; height: 0px; position: absolute; left: 64px; top: 500.5px;"></div>
    <img class="leftMenu" src="/svg/left-menu-close.svg" style="width: 4.13%; height: 4.7%; position: absolute; right: 92.63%; left: 3.24%; bottom: 93.94%; top: 1.36%; overflow: visible; cursor: pointer;"/>
</div>
</body>
</html>