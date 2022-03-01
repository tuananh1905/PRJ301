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
        <link rel="stylesheet" type="text/css" href="<c:url value = "../css/popupModal.css" />" />
        <script defer src="<c:url value = "../js/popupModal.js"/>"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="../js/popupModalDelete.js"></script>
        <script src="../js/takeFlockDataFromTable"></script>
        <%
//            ArrayList<Flock> flocks = (ArrayList<Flock>) request.getAttribute("flocks");
//            int isAvai = (Integer) request.getAttribute("isAvai");
%>
        <script>
            window.onload = function () {
                submitSearchForm();
            };
//            $.ajax({
//                type: 'POST',
//                url: $('#searchForm').attr('action'),
//                data: $('#searchForm').serialize(),
//                success: function (data) {
//                    $('#tableField').html(data);
//                    $.getScript("../js/popupModal.js");
//                    $.getScript("../js/popupModalDelete.js");
//                }
//            });
//            $(document).ready(function () {
//                $("#myTable").on('click', '#edit', function () {
//                    var currentRow = $(this).closest("tr");
//                    var col1 = currentRow.find("td:eq(0)").text();
//                    var col2 = currentRow.find("td:eq(1)").text();
//                    var col3 = currentRow.find("td:eq(2)").text();
//                    var col4 = currentRow.find("td:eq(3)").text();
//
//                    document.getElementById("FID_span").innerHTML = col1;
//                    document.getElementById("FID").setAttribute('value', col1);
//                    document.getElementById("name").setAttribute('value', col2);
//                    document.getElementById("purchase_date").setAttribute('value', col3);
//                    document.getElementById("sale_date").setAttribute('value', col4);
//
//                    document.getElementById("id_span").removeAttribute('hidden');
//                    document.getElementById("submitForm").setAttribute('action', 'Edit');
//                });
////                $("#myTable").on('click', '#delete', function () {
////                    var currentRow = $(this).closest("tr");
////                    var col1 = currentRow.find("td:eq(0)").text();
////                    document.getElementById("FIDdelete_span").innerHTML = col1;
////                    document.getElementById("FIDdelete").setAttribute('value', col1);
////                });
//                $("#insert").on('click', function () {
//                    document.getElementById("id_span").setAttribute('hidden', 'true');
//                    document.getElementById("submitForm").setAttribute('action', 'Insert');
//
//                    document.getElementById("FID").setAttribute('value', '');
//                    document.getElementById("name").setAttribute('value', '');
//                    document.getElementById("purchase_date").setAttribute('value', '');
//                    document.getElementById("sale_date").setAttribute('value', '');
//                });
//
//            });
            function submitForm() {
                $.ajax({
                    type: 'POST',
                    url: $('#submitForm').attr('action'),
                    data: $('#submitForm').serialize(),
                    success: function (data) {
                        $('#modal').removeClass('active');
                        $('#overlay').removeClass('active');
//                        $('#tableField').html(data);
                        submitSearchForm();
                        $.getScript("../js/popupModal.js");
                        $.getScript("../js/popupModalDelete.js");
                    }
                });
                return false;
            }
            function submitSearchForm() {
                $.ajax({
                    type: 'POST',
                    url: $('#searchForm').attr('action'),
                    data: $('#searchForm').serialize(),
                    success: function (data) {
                        $('#tableField').html(data);
                        $.getScript("../js/popupModal.js");
                        $.getScript("../js/popupModalDelete.js");
                        $.getScript("../js/takeFlockDataFromTable.js");
                    }
                });
            }

        </script>
    </head>
    <body>
        <div id="container">
            <form id="searchForm" method="POST" action="Search">
                Flock name: <select name="isAvai" onchange="submitSearchForm();">
                    <option value="-1">-----All FLOCK-----</option>
                    <option value="0">Sold</option>
                    <option value="1">Available</option>
                </select><br/>
            </form>
            <br/>
            <button id="insert" data-modal-target="#modal">Add</button>
            <div id="tableField"></div>

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
        <!--        <div class="modal" id="modalDelete">
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
                </div>-->
        <jsp:include page="../components/modal_Delete.jsp"/>
        <div id="overlay"></div>
        <div id="test"></div>
    </body>
</html>