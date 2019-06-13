<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
	String msg ="";
        StringBuilder table=new StringBuilder("");
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  String connectString = "jdbc:mysql://172.18.187.6:3306/teaching"
				+ "?autoReconnect=true&useUnicode=true"
				+ "&characterEncoding=UTF-8"; 
	String  user="user";
	String  pwd="123";
      Connection con=DriverManager.getConnection(connectString, 
                 user, pwd);

	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from stu");
	  table.append("<table><tr><th>id</th><th>学号</th><th>姓名</th><th>操作</th>");
	  while(rs.next()) {
             table.append(String.format(
                 "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s %s</td></tr>",
                 rs.getString("id"),rs.getString("num"),rs.getString("name"),
                 "<a href='updateStu.jsp?pid="+rs.getString("id")+"'>修改</a>",
                 "<a href='deleteStu.jsp?pid="+rs.getString("id")+"'>删除</a>"
                 )
              );
	  }
	  table.append("</table>");
	  rs.close();
	  stmt.close();
	  con.close();
	}
	catch (Exception e){
	  msg = e.getMessage();
	}
%><!DOCTYPE HTML>
<html>
   <style>
       table{border-collapse: collapse;
	         border: none;
			 width: 500px;}
	   td,th{border: solid grey 1px; 
			 padding: 5px 5px 5px 5px}
	   .container{ margin:0 auto; 
	         width:500px; 
			 text-align:center; }</style>
<head>
<title>浏览学生名单</title>
</head>
<body>
  <div class="container">
	  <h1>浏览学生名单</h1>  
	  <%=table%><br><br>  
  </div>
</body>
</html>