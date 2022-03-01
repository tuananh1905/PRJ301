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
        <script>
            window.onload = function () {
                submitSearchForm();
            };
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
        <jsp:include page="../components/modal_Delete.jsp"/>
        <div id="overlay"></div>
        <div id="test"></div>
    </body>
</html>