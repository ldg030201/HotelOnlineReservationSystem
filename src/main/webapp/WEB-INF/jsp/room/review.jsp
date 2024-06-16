<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/common.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
    <title>리뷰</title>
    <style>
        .container {
            background: #ffffff;
            height: 800px;
            width: 1920px;
            position: relative;
            overflow: hidden;
        }

        .header-bar {
            background: #466e8b;
            width: 10%;
            height: 4.35%;
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

        .vector {
            width: 4.32%;
            height: 2.94%;
            position: absolute;
            left: 2.74%;
            top: 1.75%;
            overflow: visible;
        }

        .main-image {
            width: 400px;
            height: 400px;
            position: absolute;
            left: 110px;
            top: 170px;
            object-fit: cover;
        }

        .accommodation-name {
            color: #000000;
            text-align: left;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 32px;
            font-weight: 400;
            position: absolute;
            left: 100px;
            top: 80px;
            padding-left: 20px;
        }

        .review-background {
            width: 89.36%;
            height: 56.21%;
            position: absolute;
            left: 5.82%;
            top: 40.68%;
            overflow: visible;
        }

        .cancel-button-bg {
            background: #838383;
            width: 10%;
            height: 5%;
            position: absolute;
            left: 68%;
            top: 65%;
        }

        .cancel-button {
            color: #ffffff;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 25px;
            font-weight: 700;
            position: absolute;
            left: 68%;
            width: 10%;
            top: 65%;
            height: 5%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .submit-button-bg {
            background: #466e8b;
            width: 10%;
            height: 5%;
            position: absolute;
            left: 57%;
            top: 65%;
        }

        .submit-button {
            color: #ffffff;
            text-align: center;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 25px;
            font-weight: 400;
            position: absolute;
            left: 57%;
            width: 10%;
            top: 65%;
            height: 5%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
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

        .review-input {
            color: #000000;
            text-align: start;
            font-family: "Hahmlet-Regular", sans-serif;
            font-size: 24px;
            font-weight: 400;
            position: absolute;
            left: 600px;
            top: 170px;
            width: 900px;
            height: 300px;
            padding-left: 50px;
        }

        .user-icon {
            width: 40px;
            height: 40px;
            position: absolute;
            left: 550px;
            top: 170px;
            object-fit: cover;
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

        function fnReview() {
            if(!confirm("리뷰를 남기시겠습니까?\n한번 작성된 리뷰는 변경이 불가합니다.")) {
                return false;
            }

            $.ajax({
                url: '/room/review-write'
                ,type: 'post'
                ,data: $('#frm').serialize()
                ,success: () => {
                    alert("성공적으로 리뷰가 작성되었습니다.");
                    location.reload();
                }
                ,error: () => alert("리뷰를 저장하던 도중 오류가 발생하였습니다.")
            });
        }
    </script>
</head>
<body>
<div class="container" id="mainDiv">
    <form id="frm">
        <input type="hidden" name="roomId" value="${roomInfo.roomId}">
        <div class="header-bar"></div>
        <div class="logo">LOGO</div>
        <img class="vector leftMenu" src="/svg/leftmenu.svg" style="cursor: pointer;"/>
        <img class="main-image" src="${roomInfo.roomImgUrl}" />
        <div class="accommodation-name">${roomInfo.roomName}</div>
        <div class="review-background"></div>
        <div class="cancel-button-bg"></div>
        <a href="#" class="cancel-button" onclick="history.back();">취소</a>
        <c:if test="${empty reviewInfo}">
            <div class="submit-button-bg"></div>
            <button class="submit-button" onclick="fnReview();">리뷰 달기</button>
        </c:if>
        <c:if test="${empty reviewInfo}">
            <select class="rating-select" name="reviewScore">
                <option value="5">★★★★★</option>
                <option value="4">★★★★☆</option>
                <option value="3">★★★☆☆</option>
                <option value="2">★★☆☆☆</option>
                <option value="1">★☆☆☆☆</option>
            </select>
        </c:if>
        <c:if test="${not empty reviewInfo}">
            <span class="rating-select">
                ${reviewInfo.reviewScore eq 5 ? '★★★★★' : ''}
                ${reviewInfo.reviewScore eq 4 ? '★★★★☆' : ''}
                ${reviewInfo.reviewScore eq 3 ? '★★★☆☆' : ''}
                ${reviewInfo.reviewScore eq 2 ? '★★☆☆☆' : ''}
                ${reviewInfo.reviewScore eq 1 ? '★☆☆☆☆' : ''}
            </span>
        </c:if>
        <img class="user-icon" src="/img/user.png" />
        <textarea class="review-input" name="reviewContent" placeholder="리뷰를 작성해주세요." ${not empty reviewInfo ? 'readonly' : ''}>${reviewInfo.reviewContent}</textarea>
    </form>
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