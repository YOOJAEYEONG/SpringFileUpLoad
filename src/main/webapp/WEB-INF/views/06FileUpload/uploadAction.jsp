<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--JSTL -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--jquery와 부트스트랩 CDN 추가함 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
	<h2>파일업로드 결과보기</h2>
	<a href="./uploadForm.do">파일업로드 폼바로가기</a>
	
	<c:forEach begin="0" end="${returnObj.files.size()-1 }" var="i">
		<ul>
			<li>제목${i+1 } : ${returnObj.files[i].title }</li>
			<li>원본파일명${i+1 } : ${returnObj.files[i].originalName }</li>
			<li>저장된파일명${i+1 } : ${returnObj.files[i].saveFileName }</li>
			<li>전체경로${i+1 } : ${returnObj.files[i].serverFullName }</li>
			<li><img src="../images/uploadsFile/${returnObj.files[i].saveFileName }" width="200"/></li>
		</ul>
	</c:forEach>
	
</div>
</body>
</html>



















