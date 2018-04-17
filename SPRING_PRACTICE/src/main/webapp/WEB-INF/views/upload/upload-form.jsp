<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head><title>파일 업로드</title></head>
<body>

<form action="./" method="POST" enctype="multipart/form-data">
	파일 이름: <input type="text" name="title"><br/> 
	파일 첨부: <input type="file" name="file"><br/> 
    <input type="submit" value="전송" /> 
</form>

</body>
</html>