<%-- 
    Document   : search
    Created on : 20-02-2022, 13:04:21
    Author     : TuanAnh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <!--        <script src="../js/takePriceDataFromTable.js"></script>
                <script src="../js/popupModalDelete.js"></script>-->
        <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script>
            window.onload = function () {
                submitSearchFlock();
            };
            function submitSearchFlock() {
                $.ajax({
                    type: 'POST',
                    url: "../Flock/Search",
//                    data: "isAvai": $("#searchFlock option:selected").val(),
                    data: {"isAvai": $("#searchFlock option:selected").val()},
                    dataType: "json",
                    success: function (jsondata) {
                        var html = "";
                        html += '<option value="-1">---All Flock---</option>';
                        $.each(jsondata, function (key, item) {
                            html += '<option value="' + item['FID'] + '">' + item['FName'] + '</option>';
                        });
                        $('#flockField').html(html);
                    }
                });
            }
//            function submitSearchForm() {
//                $.ajax({
//                    type: 'POST',
//                    url: $('#searchForm').attr('action'),
//                    data: $('#searchForm').serialize(),
//                    dataType: "json",
//                    success: function (jsondata) {
//                        var html = "";
//                    }
//                });
//            }
            $(document).ready(function () {
                $('#searchForm').change(function () {
                    $.ajax({
                        type: 'POST',
                        url: 'showFSTable',
                        data: $('#searchForm').serialize(),
                        dataType: 'json',
                        success: function (jsondata) {
                            var html = '';
                            html += '<tr>';
                            html += '   <th>Status</th>';
                            html += '   <th>Date</th>';
                            html += '   <th>Flock</th>';
                            html += '   <th>Product</th>';
                            html += '   <th>Price</th>';
                            html += '   <th>Quantily</th>';
                            html += '   <th>Total</th>';
                            html += '   <th>Decrepsion</th>';
                            html += '   <th>Details</th>';
                            html += '   <th>Remove</th>';
                            html += '</tr>';
                            $.each(jsondata, function (key, item) {
                                html += '<tr>';
                                html += '   <td>' + item["Revenue"] + '</td>';
                                html += '   <td>' + item["date"] + '</td>';
                                html += '   <td>' + item["flock"]["FName"] + '</td>';
                                html += '   <td>' + item["price"]["Product"]["Product_name"] + '</td>';
                                html += '   <td>' + item["price"]["Price"] + '</td>';
                                html += '   <td>' + item["Quantily"] + '</td>';
                                html += '   <td>' + item["Total"] + '</td>';
                                html += '   <td>' + item["Decrepsion"] + '</td>';
                                html += '   <td></td>';
                                html += '   <td></td>';
                                html += '</tr>';
                            });
                            $('#FSData').html(html);
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div>
                <form action="showFSTable" id="searchForm">
                    <!--                    Date: <input type="date" name="date" id="date" onchange="submitSearchForm()"/> </br>-->
                    Date: <input type="date" name="date" id="date"/> </br>
                    Flock: <select name="isAvai" id="searchFlock" onchange="submitSearchFlock();">
                        <option value="-1">-----All FLOCK-----</option>
                        <option value="0">Sold</option>
                        <option value="1">Available</option>
                    </select>
                    <!--                    <select id="flockField" name="FID" onchange="submitSearchForm()"></select>-->
                    <select id="flockField" name="FID"></select>
                </form>
            </div>
            <button id="insert" data-modal-target="#modal">Add</button>
            <div id="tableField"></div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered" id="FSData">
                    <tr>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Flock</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantily</th>
                        <th>Total</th>
                        <th>Decrepsion</th>
                        <th>Details</th>
                        <th>Remove</th>
                    </tr>
                </table>
            </div>
            <div class="modal" id="modal">
                <div class="modal-header">
                    <div class="title">Financial Statement Information</div>
                    <button data-close-button class="close-button">&times;</button>
                </div>
                <div class="modal-body">
                    <jsp:include page="submitForm.jsp"/>
                </div>
            </div>
            <jsp:include page="../components/modal_Delete.jsp"/>
            <div id="overlay"></div>
            <div id="test"></div>
        </div>
    </body>
</html>
