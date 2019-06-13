<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,java.io.*,java.util.Random"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>40个随机数</h1>
<%
Random rnd= new Random(50); 
for(int i = 0 ; i < 40 ; i++)
{
	int n= rnd.nextInt(1000);
	out.print(n);
    out.print(" ");
}
%>
</body>
</html>