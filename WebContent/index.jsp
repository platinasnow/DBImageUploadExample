<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.sql.*,java.io.*"%>

<%!

static final String JDBC_DRIVER_NAME = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
 static final String DB_URL = "jdbc:sqlserver://localhost:1433;";
 static final String USER_ID = "sa";
 static final String USER_PASSWORD = "kurenai0";%>

<%
 try {
	 String path = "C:/";   
	 int    size = 5*1024*1024 ;
	 MultipartRequest multi = new MultipartRequest(request ,path, size,"euc-kr",new DefaultFileRenamePolicy());
     
	File imgfile = multi.getFile("file_path");
	 
  Class.forName(JDBC_DRIVER_NAME);
  Connection con = DriverManager.getConnection(DB_URL, USER_ID, USER_PASSWORD);

  FileInputStream fin = new FileInputStream(imgfile);
  PreparedStatement pre = con
    .prepareStatement("insert into ImageTable(imageData) values(?)");
  pre.setBinaryStream(1, fin, (int) imgfile.length());
  pre.executeUpdate();
  System.out.println("Inserting Successfully!");
  pre.close();
  
  con.close();
 } catch (Exception ex) {
  out.println("error :" + ex);
 }
%>