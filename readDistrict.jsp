<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%
JSONArray ja=new JSONArray();
JSONObject jo;
String st=request.getParameter("sta");
System.out.println(st);

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/state","root","root");
Statement stmt=con.createStatement();

String district="";
String s="select d_name from state where s_name='"+st+"'";
ResultSet rs=stmt.executeQuery(s);
while(rs.next())
{
	district=rs.getString("d_name");
	
	jo=new JSONObject();
	jo.put("kdistrict", district);
	ja.add(jo);
}
System.out.println(ja);
out.println(ja);
%>
