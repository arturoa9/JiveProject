<%-- 
    Document   : index
    Created on : Sep 8, 2015, 1:41:50 PM
    Author     : RealMadrid
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Enter your info</title>
<h1>Enter your info</h1>
<hr>
</head>
<body>
   <s:form action="loginaction" method="post">
      <s:textfield name="OS" label="OS" size="20" />
      <s:textfield name="OSversion" label="OSversion" size="20" />
      <s:textfield name="Notes" label="Notes" size="20" />
      <s:submit name="submit" label="Submit" align="center" />
    </s:form>	
   </form>
</body>
</html>
