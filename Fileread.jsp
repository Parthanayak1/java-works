<%@page import="java.sql.*"%>

<%@page import="java.util.Random"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

try
{
String rl="",na="",ph="";
FileItem item = null;
File uploadedFile=null;
String imgfilename="";
File path = new File("D:/workspacej2ee/File/WebContent/userfiles");

	Random rand = new Random();
	int p = rand.nextInt(90000) + 10000;
	System.out.println(p);

	
if (!path.exists()) {
	boolean status = path.mkdirs();
}

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
System.out.println("isMulti"+isMultipart);
if (isMultipart) {
	
FileItemFactory factory = new DiskFileItemFactory();

	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);

		
		// Parse the request
		List items = upload.parseRequest(request);
		Iterator iterator = items.iterator();
		while (iterator.hasNext()) {

			item = (FileItem) iterator.next();
			imgfilename=p+item.getName();
			if(imgfilename!=null)
			{
			uploadedFile = new File(path + "/"+imgfilename);	
			item.write(uploadedFile); 
			}
			
			if (!item.isFormField()) {
				
				//String fileName = item.getName();
				if(item.getFieldName().equals("photo"))
				{
					ph=p+item.getName();
				}
			}
			else
			{
				
				// Get datas from form except file(image,video,audio,file etc)
				
				if(item.getFieldName().equals("rollno"))
				{
					rl=item.getString();
				}
				else if(item.getFieldName().equals("name"))
				{
					na=item.getString();
				} 
			}
		}
		
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/file","root","root");
	    Statement stmt=con.createStatement();
	    
	    String qry="insert into file(rollno,name,photo) values('"+rl+"','"+na+"','"+ph+"')";
	    stmt.executeUpdate(qry);
	    
	    response.sendRedirect("File.jsp");
	    
	    
}

}catch(Exception e){System.out.println(e);}		
%>


