<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>객실 등록 성공</title>
    <script type="text/javascript">

        window.onload = function(){
            location.href="${path}/admin/room/list";
        }
    </script>
</head>
<body></body>
</html>