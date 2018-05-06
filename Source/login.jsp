
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <%
            String username, password;
            username = request.getParameter("username");
            password = request.getParameter("password");

            String data = "jdbc:mysql://localhost:3306/eSchedule";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(data, "root", "");
                Statement st = conn.createStatement();
                ResultSet rec = st.executeQuery("select * from users where username='" + username + "' and userpass='" + password + "'");

                while (rec.next()) {
                    response.sendRedirect("adminIndex.html");
                }
                response.sendRedirect("index.html");
                st.close();
            } catch (SQLException s) {
                out.println("SQL Error: " + s.toString() + " " + s.getErrorCode() + " " + s.getSQLState());
            } catch (Exception e) {
                out.println("Error: " + e.toString() + e.getMessage());
            }

        %>

    </body>
</html>
