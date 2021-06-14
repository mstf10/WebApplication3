<%-- 
    Document   : temlik
    Created on : 12 Haz 2021, 12:44:34
    Author     : mergu
--%>

<%@page import="ClassPackage.Temlik"%>
<%@page import="ClassPackage.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" href="./lib/newcss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./lib/jquery-3.6.0.min.js"></script>
        <title>Temlik</title>
    </head>
    <body>
        <%  Class.forName("org.mariadb.jdbc.Driver");
            String bağlantıyok = "";
            DbConnect dbConnect = new DbConnect();

            if (dbConnect.connection != null) {

            } else {
                bağlantıyok = "Veritabanı bağlantısı yapılamadı.";
            }

            if (session.getAttribute("user") == null) {
                response.sendRedirect("./login.jsp");
            }
        %>
        <%= bağlantıyok%>

        <% Temlik temlik = new Temlik();
            temlik.temlikGetir();
        %>
    <div style="position: fixed; left: 20px; top: 0; width: 50%" >
        <a href="./index.jsp">Anasayfa</a>
        <br><br>

    </div>
    <div style="position: relative; left:10px; top:60px;width: 50%" >
        <table id="tablo2">
            <thead>
                <tr>
                    <th><%= temlik.TabloBaşlık.get(0)%></th>
                    <th><%= temlik.TabloBaşlık.get(1)%></th>
                    <th><%= temlik.TabloBaşlık.get(2)%></th>
                    <th><%= temlik.TabloBaşlık.get(3)%></th>
                    <th><%= temlik.TabloBaşlık.get(4)%></th>
                    <th><%= temlik.TabloBaşlık.get(5)%></th>
                    <th><%= temlik.TabloBaşlık.get(6)%></th>
                    <th><%= temlik.TabloBaşlık.get(7)%></th>
                    <th><%= temlik.TabloBaşlık.get(8)%></th>
                    <th><%= temlik.TabloBaşlık.get(9)%></th>
                    <th><%= temlik.TabloBaşlık.get(10)%></th>
                    <th><%= temlik.TabloBaşlık.get(11)%></th>
                    <th><%= temlik.TabloBaşlık.get(12)%></th>
                </tr>
                <tr>
                    <th><input type="text" id="arama0" style="width: 80%"></th>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>6</th>
                <th>7</th>
                <th>8</th>
                <th>9</th>
                <th><input type="text" id="arama10" onkeyup="myFunction(10)" style="width: 80%"></th>
                    <th><input type="text" id="arama11" onkeyup="myFunction(11)" style="width: 80%"></th>

                        <th>12</th>
                        </tr>

                        </thead>
                        <tbody id="tablo1">         

                            <% for (int i = 0; i < temlik.TemlikVerenFirma.size(); i++) {%>
                            <tr>
                                <td id="TemlikVerenFirma"><%= temlik.TemlikVerenFirma.get(i)%></td>
                                <td><%= temlik.VergiNo.get(i)%></td>
                                <td><%= temlik.FaturaTarihi.get(i)%></td>
                                <td><%= temlik.FaturaNo.get(i)%></td>
                                <td id="FaturaTutarı"><%= temlik.FaturaTutarı.get(i)%></td>
                                <td><%= temlik.DamgaVergisiKesintisi.get(i)%></td>
                                <td><%= temlik.DiğerKesinti.get(i)%></td>
                                <td id="ÖdenecekTutar"><%= temlik.ÖdenecekTutar.get(i)%></td>
                                <td><%= temlik.FişNo.get(i)%></td>
                                <td><%= temlik.Yıl.get(i)%></td>
                                <td id="TemlikNo"><%= temlik.TemlikNo.get(i)%></td>
                                <td><%= temlik.TemlikAlanFirma.get(i)%></td>
                                <td><%= temlik.TemlikAlanFirmaVergiNo.get(i)%></td>
                            </tr>
                            <%}
                            %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td id="FaturaTutarıToplam">5</td>
                                <td>6</td>
                                <td>7</td>
                                <td id="toplam">8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                            </tr>
                        </tfoot>
                        </table>
                        </div>
                        <!-- <script>
                             function myFunction(sutunsay) {
 
                                 var input, filter, table, tr, td, i, txtValue;
                                 input = document.getElementById("arama" + sutunsay);
                                 filter = input.value.toUpperCase();
                                 table = document.getElementById("tablo1");
                                 tr = table.getElementsByTagName("tr");
 
                                 for (i = 0; i < tr.length; i++) {
                                     td = tr[i].getElementsByTagName("td")[sutunsay];
                                     if (td) {
                                         txtValue = td.textContent || td.innerText;
                                         if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                             tr[i].style.display = "";
 
                                         } else {
                                             tr[i].style.display = "none";
                                         }
                                     }
                                 }
 
                             }
                         </script>
                        -->
                        <script>
                            $(document).ready(function () {
                                $("#arama10").keypress(function (e) {
                                    if (e.key === "Enter") {
                                        var value = $(this).val();
                                        var FaturaTutarıToplam = 0.0;
                                        $("td[id='TemlikNo']").each(function (i) {
                                            if ($(this).text() == value && value != "") {
                                                $(this).css("color", "red")
                                                $(this).parent("tr").css("color", "blue");
                                                FaturaTutarıToplam += Number($("td[id='FaturaTutarı']").eq(i).text());
                                                $("#FaturaTutarıToplam").text(FaturaTutarıToplam);
                                            } else if (value == "") {
                                                $(this).css("color", "black");
                                                $(this).parent("tr").css("color", "black");
                                                $(this).parent("tr").css("display", "");
                                                $("#FaturaTutarıToplam").text("");
                                            } else {
                                                $(this).css("color", "black");
                                                $(this).parent("tr").css("color", "black");
                                                $(this).parent("tr").css("display", "none");
                                            }
                                        });
                                    }
                                });
                            });
                        </script>

                        <script>
                            $(document).ready(function () {
                                $("#arama0").keypress(function (e) {
                                    if (e.key === "Enter") {
                                        var value = $(this).val();
                                        var FaturaTutarıToplam = 0.0;
                                        $("td[id='TemlikVerenFirma']").each(function (i) {
                                            if ($(this).text().trim().indexOf(value) == 0 && value != "") {
                                                $(this).css("color", "red")
                                                $(this).parent("tr").css("color", "blue");
                                                FaturaTutarıToplam += Number($("td[id='FaturaTutarı']").eq(i).text());
                                                $("#FaturaTutarıToplam").text(FaturaTutarıToplam);
                                            } else if (value == "") {
                                                $(this).css("color", "black");
                                                $(this).parent("tr").css("color", "black");
                                                $(this).parent("tr").css("display", "");
                                                $("#FaturaTutarıToplam").text("");
                                            } else {
                                                $(this).css("color", "black");
                                                $(this).parent("tr").css("color", "black");
                                                $(this).parent("tr").css("display", "none");
                                            }
                                        });
                                    }
                                });
                            });
                        </script>
                        </body>
                        </html>
