<%@ page import="View.DbWithTable" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="link.jsp"/>
<html>
<head>
    <title>DATABASE CLIENT</title>
    <script>
        function myFunction() {
            var query = "create database " + prompt("Enter Database name.");
            //alert(query);
            $.get("Query_Execute", {
                sql: query
            }, function (data, status) {
            });
        }
        function myFunction2() {
            var query = "drop database " + prompt("Enter Database name.");
            //alert(query);
            $.get("Query_Execute", {
                sql: query
            }, function (data, status) {
            });
        }
        function myFunction3() {
            var query = "create table " + prompt("Enter table name and all Column name.");
            //alert(query);
            $.get("Query_Execute", {
                sql: query

            }, function (data, status) {
            });
        }
        function myFunction4() {
            var query = "drop table "+prompt("enter table name.");
            //alert(query);

            $.get("Query_Execute", {
                sql: query

            }, function (data, status) {
            });
        }

        function myFunction5() {
            var query = "insert into " +prompt("Example: tbl_name values(...)");
            //alert(query);

            $.get("Query_Execute", {
                sql: query

            }, function (data, status) {
            });
        }
        function myFunction6() {
            var query = "Delete from " +prompt("Example: Column_name where (Condition)");
            //alert(query);

            $.get("Query_Execute", {
                sql: query

            }, function (data, status) {
            });
        }





        $(document).ready(function () {


            $("#create_tbl").click(function () {
                $(".textArea").hide();


            });
            $("#sqlLink").click(function () {
                $('#htbl').hide();
                $(".textArea").toggle(400);
                $('#colNo').hide();
                $('#inputdiv').hide();
            });

            $("#run_button").click(function () {

                var query = $.trim($("#comment").val());
//                alert(query);

                $.get("Query_Execute", {
                        sql: query
                    },
                    function (data, status) {



                        dataTbl = JSON.stringify(data);

                        if (dataTbl.startsWith("{")) {

                            displayTable(data);
                           // $("#head").html("<u>Table</u>");
                        } else {

                            alert(data);
                            location.reload(true)
                        }

                    });

            });
        });

        function forDB(v)
        {
            var s = $("#" + v).attr("value");
            //alert(s);
            var txt = "selected database:- " + s + ".";
            document.getElementById("demo").innerHTML = txt;
            $("#" + v).children("ul").toggle(100);
            var sql = "use " + $("#" + v).attr("value");


            $.get("Query_Execute", {
                sql: sql
            }, function (data, status) {


            });

            $("#tbl_structure").hide();

            //dataTbl = null;
            //dataTblhd = null;
            $("#thd").show();
            $("#tbd").showCreate_table();
            $("#head").empty();
            $("#htbl").empty();
            $("#txt").hide();

            $("#create_tbl").show();


        }





        function forTbl(v)
        {


            $("#head").html("<h1 class='d-flex' style='color: #721c24;text-align: left;'>Table</h1>");


            dataTbl = null;

          dbtbl_name = $("#" + v).attr("value");
           var tbl_name = dbtbl_name.split(",")[1];

            //document.getElementById("demo").innerHTML=dbtbl_name

            document.getElementById("demo").innerHTML="Selected Table:-" +tbl_name


            $.get("Query_Execute", {
                    dbtbl_name: dbtbl_name,
                    //sql: 'select *  from ' + tbl_name

                },
                function (data) {
                    displayTable(data);

                    document.getElementById("demo").innerHTML='select *  from ' + tbl_name;
                });


        }





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
//                dataTbl += "<td><button type = 'button' class='btn btn-dark btn-sm'>delete</button></td>";
//                dataTbl += "</tr>";


            }
            $("#tbd").empty();
            $("#tbd").append(dataTbl);
            $("#myTable").DataTable();

        }





        function showDelete_table() {

            $("#colNo").hide();
            $("#inputdiv").hide();



            var query = "drop table " + prompt("Enter Table name.");
            //alert(query);

            $.get("Query_Execute", {
                sql: query
            }, function (data, status) {
                alert(data);
                location.reload(true);
            });

        }

         function deleteRow(v)
        {
            document.getElementById('info').innerHTML = "";
            //alert(v.rowIndex);
            var row = v.rowIndex;
            var tab = document.getElementById('myTable');
            var header = tab.rows.item(0).cells;
            var obj = tab.rows.item(row).cells;
            var sql = 'delete from ' + tbl_name + ' where ';
            //alert(tbl_name);
            if (obj.length === 2) {
                for (var i = 0; i < obj.length - 1; i++)
                {
                    //info.innerHTML = info.innerHTML + ' ' + obj.item(i).innerHTML;

                    sql += header.item(i).innerHTML + "='" + obj.item(i).innerHTML + "'";

                    //info.innerHTML = info.innerHTML + '<br />';
                }
            }
            else {
                for (var i = 0; i < obj.length - 2; i++)
                {
                    //info.innerHTML = info.innerHTML + ' ' + obj.item(i).innerHTML;

                    sql += header.item(i).innerHTML + "='" + obj.item(i).innerHTML + "' and ";

                    //info.innerHTML = info.innerHTML + '<br />';
                }
                sql += header.item(obj.length - 2).innerHTML + "='" + obj.item(obj.length - 2).innerHTML + "'";
            }
            $.get("Query_Execute",
                {
                    sql: sql
                }, function (data, status)
                {
                    alert(data);
                    location.reload(true);
                });

        }
    </script>

</head>

<body>
<div class="container" style="display: block;margin-left: auto;margin-right: auto;width: 150%;">



    <div class="page-wrapper"> <!-- content -->
        <div class="content container-fluid">

            <div class="row">

                <div class="col-sm-12">
                    <div >
                            <div class="textArea" id="txt"  style="display: none">
                                <div class="col-sm-12">
                                    <ul class="nav user-menu float-left">

                                        <li class="nav-item dropdown has-arrow">
                                            <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img"><img class="rounded-circle" src="assets/img/d.jpg" width="40" alt="Admin">
							<span class="status online"></span></span>
                                                <span>Sorted All Database Command</span>
                                            </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#" onclick="myFunction()">DB Create</a>
                                                <a class="dropdown-item" href="#" onclick="myFunction2()">DB Drop</a>
                                                <a class="dropdown-item" href="#" onclick="myFunction3()">Table Create</a>
                                                <a class="dropdown-item" href="#" onclick="myFunction4()">Table Delete</a>
                                                <a class="dropdown-item" href="#" onclick="myFunction5()">Value Insert</a>
                                                <a class="dropdown-item" href="#" onclick="myFunction6()">Row Delete</a>
                                                <%--<a class="dropdown-item" href="#" onclick="myFunction4()">Table value</a>--%>
                                                <%--<button onclick="myFunction()" class="btn btn-dark btm-sm" >DB Create</button>--%>
                                                <%--<button onclick="myFunction2()" class="btn btn-dark btm-sm">DB Drop</button>--%>
                                                <%--<button onclick="myFunction3()" class="btn btn-dark btm-sm">Table Create</button>--%>
                                            </div>
                                        </li>
                                    </ul>





                                    <br><br>
                                    <h4 class="page-title" style="color: lightcoral">SQL Compose</h4>
                                </div>
                            <div>
                                <%--<input type="text" class="form-control summernote" id="comment" name="sql" placeholder="Enter your message here">--%>
                                <textarea style="color: green" id="comment" class="form-control"   rows="12" cols="133"></textarea>
                            </div>
                            <div class="form-group m-b-0 custom-mt-form-group">
                                <div class="text-center">
                                    <button class="btn btn-primary" id="run_button"><span>Save</span> <i class="fa fa-send m-l-5"></i></button>
                                    <button class="btn btn-success m-l-5" type="button"><span>Update</span> <i class="fa fa-floppy-o m-l-5"></i></button>
                                    <button class="btn btn-primary m-l-5" type="button"><span>Delete</span> <i class="fa fa-trash-o m-l-5"></i></button>
                                </div>
                            </div>
                                <br><br>

                               <h2 id="demo" style="color: #dddddd;text-align: center;border: dotted 2px"></h2>


                                <div id="htbl">
                                    <h2 id="head" style="color:green;"></h2>
                                    <table id = "myTable" class="display">
                                        <thead id="thd"></thead>
                                        <tbody id="tbd"></tbody>


                                    </table>


                                    <p id="info"></p>
                                </div>
                                <div id='insertDiv'></div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main-wrapper">
    <div class="header"> <!-- Header start -->
        <div class="header-left" >
            <a href="#" class="logo">
                <img src="assets/img/milon.jpg" width="60" height="40" alt="">
                <span class="text-uppercase" style="color: red;border: solid 2px" >ZHAKUNI</span>
            </a>
        </div>
        <br>
        <div>
            <a href="#" class="btn btn-primary btn-md">Database</a>
            <a href="#" class="btn btn-primary btn-md" id="sqlLink">SQL</a>
            <a href="#" class="btn btn-primary btn-md">Insert</a>
            <a href="#" class="btn btn-primary btn-md">Update</a>
            <a href="#" class="btn btn-primary btn-md">Delete</a>
            <a href="#" class="btn btn-primary btn-md" >Exist</a>
            <a href="#" class="btn btn-primary btn-md">SMS</a>
            <a href="#" class="btn btn-primary btn-md">Email</a>
            <a href="#" class="btn btn-primary btn-md">Create Table</a>
            <a href="#" class="btn btn-primary btn-md">Variables</a>
            <a class="btn btn-primary btn-md" href="datatable.jsp"  >Structure</a>
            <a href="#" class="btn btn-primary btn-md">Drop</a>
            <a href="#" class="btn btn-primary btn-md">Settings</a>
            <a href="#" class="btn btn-primary btn-md">MASSA</a>


        </div>
        <div class="page-title-box float-left">
            <h3 class="text-uppercase">Preschool</h3>
        </div>
        <%--<a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars" aria-hidden="true"></i></a>--%>
        <ul class="nav user-menu float-right">

            <li class="nav-item dropdown has-arrow">
                <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img"><img class="rounded-circle" src="assets/img/user.jpg" width="40" alt="Admin">
							<span class="status online"></span></span>
                    <span>User Profile</span>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">My Profile</a>
                    <a class="dropdown-item" href="#">Edit Profile</a>
                    <a class="dropdown-item" href="#">Settings</a>
                    <a class="dropdown-item" href="logout.jsp">Logout</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="sidebar" id="sidebar">  <!-- sidebar -->
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li class="menu-title" style="color: #007bff">All Database list</li>
                    <li><a id="tbl_structure" href="#" onclick="showStructure()" style="float:left; display: none">Structure</a></li>
                    <li class="">
                        <a href="#"><i class="fa fa-tachometer" aria-hidden="true"></i> New</a>
                    </li>

                        <%
                        List<DbWithTable> dataList = (List<DbWithTable>) request.getAttribute("dataList");
                        for (int i = 0; i < dataList.size(); i++) {
                        DbWithTable data = dataList.get(i);
                        String dbName = data.getDbName();
                        List<String> tblList = data.getTblList();

                        %>

                        <li cursor="hand" class="clk" id="id<%=i%>" value="<%=dbName%>"> <a href="#" onclick="forDB('id<%=i%>')">  <%=dbName%> </a>
                        <%
                        for (int j = 0; j < tblList.size(); j++) {
                        String tblName = tblList.get(j);
                        %>
                        <ul class="id<%=i%>" type="circle" style="display: none;">
                        <li class="tblclk" id="id<%=i%><%=j%>" value="<%=dbName%>,<%=tblName%>"> <a  href="#" onclick="forTbl('id<%=i%><%=j%>')"> <%=tblName%> </a> </li>
                        </ul>
                        <%
                        }
                        %>

                        <%
                        }
                        %>


                </ul>


    </div>
</div>
    </div>
    </div>

</body>
</html>