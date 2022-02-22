<%-- 
    Document   : search
    Created on : 19-02-2022, 14:20:48
    Author     : TuanAnh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Flock"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<c:url value = "../css/testPopUp.css" />" />
        <script defer src="<c:url value = "../js/testPopUp.js"/>"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <%
            ArrayList<Flock> flocks = (ArrayList<Flock>) request.getAttribute("flocks");
            int isAvai = (Integer) request.getAttribute("isAvai");
        %>
        <script>
            function submitSearchForm()
            {
                document.getElementById("searchForm").submit();
            }

            function deleteStudent(id)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    window.location.href = "delete?id=" + id;
                }
            }
            $(document).ready(function () {
                $("#myTable").on('click', '#edit', function () {
                    var currentRow = $(this).closest("tr");
                    var col1 = currentRow.find("td:eq(0)").text();
                    var col2 = currentRow.find("td:eq(1)").text();
                    var col3 = currentRow.find("td:eq(2)").text();
                    var col4 = currentRow.find("td:eq(3)").text();

                    document.getElementById("FID_span").innerHTML = col1;
                    document.getElementById("FID").setAttribute('value', col1);
                    document.getElementById("name").setAttribute('value', col2);
                    document.getElementById("purchase_date").setAttribute('value', col3);
                    document.getElementById("sale_date").setAttribute('value', col4);

                    document.getElementById("id_span").removeAttribute('hidden');
                    document.getElementById("submitForm").setAttribute('action', 'Edit');
                });
                
                $("#myTable").on('click', '#delete', function(){
                    var currentRow = $(this).closest("tr");
                    var col1 = currentRow.find("td:eq(0)").text();
                    document.getElementById("FIDdelete_span").innerHTML = col1;
                    document.getElementById("FIDdelete").setAttribute('value', col1);
                });
                
                $("#insert").on('click', function () {
                    document.getElementById("id_span").setAttribute('hidden', 'true');
                    document.getElementById("submitForm").setAttribute('action', 'Insert');

                    document.getElementById("FID").setAttribute('value', '');
                    document.getElementById("name").setAttribute('value', '');
                    document.getElementById("purchase_date").setAttribute('value', '');
                    document.getElementById("sale_date").setAttribute('value', '');
                });
                
                $('#submitForm').on('submit', function () {
                    $.ajax({
                        type: $('#submitForm').attr('method'),
                        url: $('#submitForm').attr('action'),
                        data: $('#submitForm').serialize(),
                        success: function () {
                            $('#container').load(location.href);
                            $('#modal').removeClass('active');
                            $('#overlay').removeClass('active');
                        }
                    });
                    return false;
                });
                
            });
        </script>
    </head>
    <body>
        <div id="container">
            <form id="searchForm" method="POST" action="Search">
                Flock name: <select name="isAvai" onchange="submitSearchForm();">
                    <option <%=(-1 == isAvai) ? "selected=\"selected\"" : ""%> value="-1">-----SELECT A FLOCK-----</option>
                    <option <%=(0 == isAvai) ? "selected=\"selected\"" : ""%> value="0">Sold</option>
                    <option <%=(1 == isAvai) ? "selected=\"selected\"" : ""%> value="1">Available</option>
                </select><br/>
            </form>
            <br/>
            <% if (flocks.size() > 0) {%>
            <button id="insert" data-modal-target="#modal">Add</button>
            <table border="1px" id="myTable">
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Purchase date</td>
                    <td>Sale date</td>
                    <td>Interactive</td>
                </tr>
                <% for (Flock f : flocks) {%>
                <tr>
                    <td><%= f.getFID()%></td>
                    <td><%= f.getFName()%></td>
                    <td><%= f.getPurchase_date()%></td>
                    <td><%= f.getSale_date()%></td>
                    <td>
                        <button id="edit" data-modal-target="#modal">Edit</button>
                        <button id="delete" data-modal-target="#modalDelete">Delete</button>
                        <button id="interactive" data-modal-target="#modal">Information</button>

                    </td>
                </tr>
                <%}%>
                <%}%>
            </table>
        </div>
        <div class="modal" id="modal">
            <div class="modal-header">
                <div class="title">Flock Information</div>
                <button data-close-button class="close-button">&times;</button>
            </div>
            <div class="modal-body">
                <jsp:include page="submitForm.jsp"/>
            </div>
        </div>
        <div class="modal" id="modalDelete">
            <div class="modal-header">
                <div class="title">Delete confirmation</div>
                <button data-close-button class="close-button">&times;</button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this flock?
                <form action="Delete" method="POST" id="submitForm">
                    ID <span id="FIDdelete_span"></span>
                    <input name="FID" id="FIDdelete" value="" hidden/> <br/>
                    <input type="submit" value="Yes"/><button data-close-button class="close-button">No</button>
                </form>
                
            </div>
        </div>
        <div id="overlay"></div>
    </body>
</html>
