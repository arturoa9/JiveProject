<%-- 
    Document   : success
    Created on : Sep 8, 2015, 1:42:10 PM
    Author     : RealMadrid
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <title>Successful Add</title>
    </head>
    <body>
        <h1>Information in database</h1>
        <hr>
        <br>
        <form method="post">

            <table border="2">
                <tr>
                    <td><b>OS</b></td>
                    <td><b>OSversion</b></td>
                    <td><b>Notes</b></td>
                </tr>
                <%
                    try {
                        /*
                         These are the the values that I used to connect to my database and get this 
                         file running succesfully.
                         If it cannot connect to your databse simple change the values of "URL", "Username",
                         and "Password" to match the configuration of your database.
                        */
                        Class.forName("com.mysql.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3307/DBase";
                        String username = "root";
                        String password = "";
                        String query = "select * from information_table";
                        Connection conn = DriverManager.getConnection(url, username, password);
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);
                        while (rs.next()) 
                        {
                %>
                            <tr>
                            <td><%=rs.getString("OS") %></td>
                            <td><%=rs.getString("OSversion") %></td>
                            <td><%=rs.getString("Notes") %></td>
                            </tr>
                <%
                        }
                %>
            </table>
            <%
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

        </form>
        <br/>
        <a href="index.jsp">Back</a>
    </body>

</html>
