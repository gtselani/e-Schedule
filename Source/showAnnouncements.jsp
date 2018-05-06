
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Όλες οι Ανακοινώσεις</title>
        <style>

            .tableClass{
                width:80%;
                border-collapse: collapse;
                text-align :center;
            }

            .thClass{
                background-color:#3366FF;
                color:white;
            }

            a{
                color:#3366FF;
                text-decoration:none;
            }

            a:hover {
                color: #990000;
                text-decoration: underline;
            }
            body{
                background-color:white;
                font: 16px Arial,sans-serif;
                font-size:90%;
                margin:0;
            }

        </style>
    </head>
    <body>
        <table style="width:100%;">
            <tr>
                <td><a href="adminIndex.html">Αρχική</a></td>
                <td><div style="text-align: right;"><a href="index.html">Αποσύνδεση</a></div></td>
            </tr>
        </table>


        <%
            int counter = 0;
            out.println("<table align=\"center\" class=\"tableClass\" width=\"80%\" border=\"1\">");
            out.println("<tr><th class=\"thClass\" style=\"width:20%;\">Ημερομηνία και Ώρα</th><th width=\"60%\" class=\"thClass\">Ανακοίνωση</th><th class=\"thClass\" style=\"width:20%;\">Καθηγητής</th></tr>");

            String data = "jdbc:mysql://localhost:3306/eSchedule";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(data, "root", "");
                Statement st = conn.createStatement();
                ResultSet rec = st.executeQuery("SELECT DateAndTime,Announcement,Professor FROM Announcements ORDER BY DateAndTime DESC");

                while (rec.next()) {
                    out.println("<tr> "
                            + "<td height=\"23\"><br>" + rec.getString(1).substring(0, 19) + "<br><br></td>"
                            + "<td><br>" + rec.getString(2) + "<br><br></td>"
                            + "<td><br>" + rec.getString(3) + "<br><br></td>"
                            + "</tr>");
                    counter++;
                }
                out.println("</table><br><br>");

                if (counter == 0) {
                    out.println("<h3 align=\"center\" style=\"color:#3366FF;\">Ο πίνακας των ανακοινώσεων είναι κενός</h3>");
                }

                st.close();

            } catch (SQLException s) {
                out.println("SQL Error: " + s.toString() + " " + s.getErrorCode() + " " + s.getSQLState());
            } catch (Exception e) {
                out.println("Error: " + e.toString() + e.getMessage());
            }
        %>    

    </body>
</html>
