

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Διαγραφή Ανακοίνωσης</title>
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
            .tableClass{
                width:80%;
                border-collapse: collapse;
                text-align :center;
            }

            .thClass{
                background-color:#3366FF;
                color:white;
            }
        </style>

    </head>
    <body>
        <form id="form1" action="deleteAnnouncement1.jsp" method="POST">
            <table style="width:100%; background-color:#3366FF; color:white; ">
                <tr>
                    <td><a href="adminIndex.html">Αρχική</a></td>
                    <td><div style="text-align: right;"><a href="index.html">Αποσύνδεση</a></div></td>
                </tr>

                <tr>
                    <td> <br>
                        Παρακαλώ επιλέξτε τις ανακοινώσεις που θέλετε να διαγράψετε!
                        <br><br>

                        <input type="submit" name="submit" value="Διαγραφή">
                        <br><br>
                    </td>
                </tr>
            </table>

            <br>

            <%
                int counter1 = 0;
                int counter = 0;
                out.println("<table align=\"center\" class=\"tableClass\" width=\"80%\" border=\"1\">");
                out.println("<tr>"
                        + "<th class=\"thClass\" style=\"width:5%;\">Επιλογή</th>"
                        + "<th width=\"15%\" class=\"thClass\">Ημερομηνία</th>"
                        + "<th class=\"thClass\" style=\"width:60%;\">Ανακοίνωση</th>"
                        + "<th class=\"thClass\" style=\"width:20%;\">Καθηγητής</th></tr>");

                String data = "jdbc:mysql://localhost:3306/eSchedule";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(data, "root", "");
                    Statement st = conn.createStatement();
                    ResultSet rec = st.executeQuery("SELECT * FROM Announcements ORDER BY DateAndTime DESC");

                    while (rec.next()) {
                        out.println("<tr> "
                                + "<td height=\"23\"><br><input type=\"checkbox\" name=\"checkbox\" value=\"" + Integer.parseInt(rec.getString(1)) + "\"><br><br></td>"
                                + "<td><br>" + rec.getString(2).substring(0, 19) + "<br><br></td>"
                                + "<td><br>" + rec.getString(3) + "<br><br></td>"
                                + "<td><br>" + rec.getString(4) + "<br><br></td>"
                                + "</tr>"
                        );
                        counter1++;
                    }

                    out.println("</table><br><br>");
                    if (counter1 == 0) {
                        out.println("<br><br>");
                        out.println("<h3 align=\"center\" style=\"color:#3366FF;\">Ο πίνακας των ανακοινώσεων είναι κενός. Δεν μπορείτε να διαγράψετε κάτι!</h3>");
                    }

                    st.close();
                } catch (SQLException s) {
                    out.println("SQL Error: " + s.toString() + " " + s.getErrorCode() + " " + s.getSQLState());
                } catch (Exception e) {
                    out.println("Error: " + e.toString() + e.getMessage());
                }
            %>


        </form>


        <script type="text/javascript">
            function check() {
                var count = <%=counter1%>;
                if (count == 0) {
                    alert("Ο πίνακας των ανακοινώσεων είναι κενός");
                    return false;
                }
                var c = 0;
                var checkboxes = document.getElementsByName("checkbox");
                for (i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked == false) {
                        c++;
                    }
                }
                if (c == checkboxes.length) {
                    alert("Δεν έχετε επιλέξει καμία ανακοίνωση!");
                    return false;
                }
                return true;
            }

            document.getElementById("form1").onsubmit = function () {
                return check();
            };

        </script>
    </body>
</html>
