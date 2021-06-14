<%-- 
    Document   : index
    Created on : 11 Haz 2021, 17:11:20
    Author     : mergu
--%>

<%@page import="ClassPackage.UserControl"%>
<%@page import="ClassPackage.DbConnect"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Hello World!</h1>
    <%  Class.forName("org.mariadb.jdbc.Driver");
        String bağlantıyok = "";
        DbConnect dbConnect = new DbConnect();

        if (dbConnect.connection != null) {

        } else {
            bağlantıyok = "Veritabanı bağlantısı yapılamadı.";
        }
    %>
    <%= bağlantıyok%>
<fieldset style="width: 20%" >
    <legend>Giriş</legend>
    <form method="POST">
        <table>
            <tr>
                <td>Kullanıcı Adı:</td>
                <td><input type="text" name="username"  /></td>
            </tr>
            <tr>
                <td>Şifre:</td>
                <td><input type="text" name="password" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Giriş"/></td>
            </tr>
        </table>
    </form>
</fieldset>
<%   UserControl userControl = new UserControl();
if (session.getAttribute("user") != null) {
            response.sendRedirect("./index.jsp");
        }
    if (request.getParameter("username") != null && request.getParameter("password") != null) {
        userControl.setUsername(request.getParameter("username"));
        userControl.setPassword(request.getParameter("password"));
        userControl.userController();

        if (userControl.logincheck == "true") {
            session.setAttribute("user", userControl.getUsername());
            response.sendRedirect("./index.jsp");
        } else {
            session.setAttribute("user", null);
        }
        
    }

%>

</body>
</html>
