<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.7.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var st="";
		$("#stateid").change(function(){
			$("#districtid").html("<option>Select...</option>");
			st=$("#stateid").val();
			alert(st);
			
			var dist="";
			$.getJSON("readDistrict.jsp?sta="+st,function(ja){
				for(var i=0;i<ja.length;i++)
				{
					dist=ja[i].kdistrict;
					$("#districtid").append("<option>"+dist+"</option>");
				}
			});
		});
	});
</script>
</head>
<body bgcolor="skyblue">
	<table align="center" width="500">
		<tr>
			<th>Select State</th>
			<td>
			<%
			Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/state","root","root");
				Statement stmt=con.createStatement();

				String sname="";
				String s="select distinct s_name from state";
				ResultSet rs=stmt.executeQuery(s);
				
			%>
				<select id="stateid">
					<option>Select...</option>
					<%
					while(rs.next())
					{
						sname=rs.getString("s_name");
						%>
					<option><%=sname %></option>
					
					<%
					}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th>Select District</th>
			<td>
				<select id="districtid">
					<option>Select...</option>
				</select>
			</td>
		</tr>
	</table>
</body>
</html>
