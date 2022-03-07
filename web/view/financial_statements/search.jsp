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
        <link rel="stylesheet" type="text/css" href="<c:url value = "../css/popupModal.css" />" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="../js/takePriceDataFromTable.js"></script>
        <script src="../js/popupModalDelete.js"></script>
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
                        $.each(jsondata, function (key, item) {
                            html += "<option>" + item['FName'] + "</option>";
                        });
                        $('#flockField').html(html);
                    }
                });
            }
            function submitSearchForm() {
                $.ajax({
                    type: 'POST',
                    url: $('#searchForm').attr('action'),
                    data: $('#searchForm').serialize(),
                    dataType: "json",
                    success: function (jsondata) {
                        var html = "";
                    }
                });
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div>
                <form action="showFSTable" id="searchForm">
                    Date: <input type="date" name="date" id="date" onchange="submitSearchForm()"/> </br>
                    Flock: <select name="isAvai" id="searchFlock" onchange="submitSearchFlock();">
                        <option value="-1">-----All FLOCK-----</option>
                        <option value="0">Sold</option>
                        <option value="1">Available</option>
                    </select>
                    <select id="flockField" onchange="submitSearchForm()"></select>
                </form>
            </div>
            <button id="insert" data-modal-target="#modal">Add</button>
            <div id="tableField"></div>

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
