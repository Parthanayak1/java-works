<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="FileRead.jsp" method="post" enctype="multipart/form-data"> 
<table border="1" width="400">
<tr>
<th>Roll No</th>
<td><input type="text" name="rollno"></td>
</tr>
<tr>
<th>Name</th>
<td><input type="text" name="name"></td>
</tr>
<tr>
<th>Photo</th>
<td><input type="file" name="photo"></td>
</tr>
<tr>

<td colspan="2" align="center"><input type="submit" value="SUBMIT"></td>
</tr>
</table>
</form>
</body>
</html>
