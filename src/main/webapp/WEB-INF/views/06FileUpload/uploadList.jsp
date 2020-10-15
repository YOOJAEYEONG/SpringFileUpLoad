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
	<h2>upload폴더의 파일목록 보기</h2>
	
	<ul>
		<c:forEach items="${fileMap }" var="file" varStatus="vs">
			<li>
				파일명 : ${file.key }&nbsp;&nbsp;
				파일크기 : ${file.value }Kb&emsp;
				<a href="download.do?fileName=${file.key }&oriFileName=임시파일명${vs.count }.jpg">다운로드</a>
			</li>
		</c:forEach>
		<!-- 다운로드시 원본파일명으로 변경하려면 기존 파일명을 DB에 저장해야하므로, 
		여기서는 임시로 파일명을 지정했다. -->
	</ul>
</div>
</body>
</html>



















