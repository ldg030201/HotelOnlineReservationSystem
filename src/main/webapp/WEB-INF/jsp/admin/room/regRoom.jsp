<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/admin-reg-room.css"/>
    <title>객실 등록</title>

</head>
<body>
<div class="logo"><a href="${path}/admin/menu"><img src="/img/admin-logo.png" width="8%"></a></div>
<form class="content" onsubmit="return false;" method="post" id="form"enctype="multipart/form-data">
    <div class="inputSection">
        <input type="text" placeholder="객실 이름" name="roomName" class="input"/><br>
        <input type="number" placeholder="인원수" name="numPerson" class="input" maxlength="3"/>
        <input type="number" placeholder="가격" name="roomPrice" class="input"/>
        <textarea placeholder="설명" name="roomDesc"></textarea>
    </div>
    <div class="imgSection">
        <label for="file">
            <div id="btn-upload">파일 업로드하기</div>
        </label>
        <input type="file" name="imgFile" id="file" accept="image/*" onchange="readURL(this);">
        <img id="imgCont">
        <div class="btnBox">
            <button class="saveBtn btn"onclick="save();">저장</button>
            <button class="cancelBtn btn" onclick="cancel();">취소</button>
        </div>
    </div>
</form>


</body>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            document.getElementById('btn-upload').style.marginTop= "5%";
            document.getElementById('imgCont').style.display= "inline";
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('imgCont').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('imgCont').src = "";
        }
    }

    function save(){
        var form = document.getElementById("form");

        form.action = "${path}/admin/room/reg";
        form.mothod = "GET";
        form.submit();
    }
    function cancel(){
        location.href = "${path}/admin/menu";
    }
</script>
</html>