


<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Επιτυχής Διαγραφή</title>
        <style>
            body{
                background-color:white;
                font: 16px Arial,sans-serif;
                font-size:90%;
                margin:0;
            }
            a{
                color:white;
                text-decoration:none;
            }

            a:hover {
                color: #990000;
                text-decoration: underline;
            }
            table{
                margin:0;
                background-color:#3366FF; 
                color:white; 
                width:100%;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%! String[] selectedBoxes;%>

        <%
            selectedBoxes = request.getParameterValues("checkbox");
            int i = 0;
            String data = "jdbc:mysql://localhost:3306/eSchedule";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(data, "root", "");
                Statement st = conn.createStatement();

                for (i = 0; i < selectedBoxes.length; i++) {
                    st.executeUpdate("delete from announcements where id=" + Integer.parseInt(selectedBoxes[i]));
                }

                out.println("<table><tr><td>");
                out.println("<div style=\"text-align:right;\"><a href=\"index.html\" >Αποσύνδεση</a></div>");
                out.println("<h3>Η διαγραφή των ανακοινώσεων ολοκληρώθηκε με επιτυχία.</h3><br>");
                out.println("<a href=\"adminIndex.html\">Επεξεργασία ξανά</a>");
                out.println("<br><br>");
                out.println("</td></tr></table>");

                st.close();
            } catch (SQLException s) {
                out.println("SQL Error: " + s.toString() + " " + s.getErrorCode() + " " + s.getSQLState());
            } catch (Exception e) {
                out.println("Error: " + e.toString() + e.getMessage());
            }
        %>
    </body>
</html>
