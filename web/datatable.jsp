<%@ page import="com.java.milon.GetTableData" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 3/2/2020
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="link.jsp"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="page-wrapper"> <!-- content -->
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-7 col-md-12 col-sm-12 col-12">
                    <h5 class="text-uppercase">Data Tables</h5>
                </div>
                <div class="col-lg-5 col-md-12 col-sm-12 col-12">
                    <ul class="list-inline breadcrumb float-right">
                        <li class="list-inline-item"><a href="#">Home</a></li>
                        <li class="list-inline-item"><a href="#">Tables</a></li>
                        <li class="list-inline-item">Data Tables</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card-box">
                    <div class="card-block">
                        <h6 class="card-title text-bold">Default Datatable</h6><br>
                        <p class="content-group">
                            This is the most basic example of the datatables with zero configuration. Use the <code>.datatable</code> class to initialize datatables.
                        </p>
                        <div id="htbl">
                            <h2 id="head" style="color:green;"></h2>
                            <table id = "myTable" class="display">
                                <thead id="thd"></thead>
                                <tbody id="tbd"></tbody>


                            </table>


                            <p id="info"></p>
                        </div>

                        <script>
                            function displayTable(data)
                            {

                                //location.reload(true);
                                $("#insertDiv").empty();
                                $("#htbl").show();

                                kara = Object.keys(data);

//            alert(kara);
                                katr = Object.keys(Object.values(data)[0]);
                                //alert(katr);
                                dataTblhd = "";
                                dataTblhd += "<tr>";
                                for (k = 0; k < katr.length; k++) {
                                    dataTblhd += "<th>" + katr[k] + "</th>";
                                }

                                //dataTblhd += "<th>Delete</th></tr>";

                                //alert(dataTblhd);
                                $("#thd").empty();
                                $("#thd").append(dataTblhd);

                                dataTbl = "";

                                for (i = 0; i < kara.length; i++) {
                                    //alert(kara[i]);
                                    katr = Object.keys(Object.values(data)[i]);
                                    //alert(katr);
                                    dataTbl += "<tr onclick = 'deleteRow(this)'>";
                                    for (j = 0; j < katr.length; j++) {
                                        dataTbl += "<td>" + Object.values(Object.values(data)[i])[j] + "</td>";
                                    }
//                dataTbl += "<td><button type = 'button'>delete</button></td>";
//                dataTbl += "</tr>";


                                }


                                $("#tbd").empty();
                                $("#tbd").append(dataTbl);



                                $("#myTable").DataTable;

                                /*
                                 $(document).ready(function () {
                                 $("#myTable").DataTable();
                                 });
                                 */

                            }

                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
