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
<div class="div">
    <img class="c-bucket-list-graphic-promo-article-2000-x-624-1" src="/img/mainImg.png"/>
    <div class="ellipse-1"></div>
    <div class="rectangle-5"></div>
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
</body>
</html>