<%-- 
    Document   : view
    Created on : 25-02-2022, 00:30:38
    Author     : TuanAnh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value = "../css/popupModal.css" />" />
        <script defer src="<c:url value = "../js/popupModal.js"/>"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="../js/takePriceDataFromTable.js"></script>
        <script src="../js/popupModalDelete.js"></script>
        <title>JSP Page</title>
    </head>
    <script>
        window.onload = function () {
            submitSearchForm();
        };

        function submitSearchForm() {
            $.ajax({
                type: 'POST',
                url: $('#searchForm').attr('action'),
                data: $('#searchForm').serialize(),
                dataType: "json",
                success: function (jsondata) {
                    var html = "";
                    html = "<table border=\"1px\" id=\"myTable\">\n"
                            + "                <tr>\n"
                            + "                    <td>ID</td>\n"
                            + "                    <td>Product Name</td>\n"
                            + "                    <td>Date</td>\n"
                            + "                    <td>Price</td>\n"
                            + "                    <td>Decrepsion</td>\n"
                            + "                    <td>Interactive</td>\n"
                            + "                </tr>\n";
                    $.each(jsondata, function (key, item) {
                        html += "                <tr>\n"
                                + "                    <td>" + item['PriceID'] + "</td>\n"
                                + "                    <td>" + item['Product']['Product_name'] + "</td>\n"
                                + "                    <td>" + item['Date'] + "</td>\n"
                                + "                    <td>" + item['Price'] + "</td>\n"
                                + "                    <td>" + item['Decrepsion'] + "</td>\n"
                                + "                    <td>\n"
                                + "                        <button id=\"edit\" data-modal-target=\"#modal\">Edit</button>\n"
                                + "                        <button id=\"delete\" data-modal-target=\"#modalDelete\">Delete</button>\n"
                                + "                        <button id=\"interactive\" data-modal-target=\"#modal\">Information</button>\n"
                                + "                    </td>\n"
                                + "                </tr>\n";
                    });
                    $('#priceTable').html(html);
                    $.getScript("../js/popupModal.js");
                    $.getScript("../js/takePriceDataFromTable.js");
                    $.getScript("../js/popupModalDelete.js");
                    console.log(jsondata);
                }
            });
        }
        function submitForm() {
            $.ajax({
                type: 'POST',
                url: $('#submitForm').attr('action'),
                data: $('#submitForm').serialize(),
                success: function (data) {
                    $('#modal').removeClass('active');
                    $('#overlay').removeClass('active');
                    submitSearchForm();
                    $.getScript("../js/popupModal.js");
                    $.getScript("../js/popupModalDelete.js");
                }
            });
            return false;
        }
    </script>
    <body>
        <div class="container">
            <div id="priceField" >
                <form action="showPriceTable" id="searchForm">
                    Product: 
                    <select name="prdid" id="prdid" onchange="submitSearchForm()">
                        <option value="0">---All of product---</option>
                        <option value="1">Eggs</option>
                        <option value="2">Sell Cattle</option>
                        <option value="3">Foodder</option>
                        <option value="4">Medicine</option>
                        <option value="5">Purchase Breeds</option>
                        <option value="6">Other</option>
                    </select>
                    Date: <input type="date" name="date" id="date" onchange="submitSearchForm()"/>
                </form>
                <br/>
                <button id="insert" data-modal-target="#modal">Add</button>
                <div id="priceTable"></div>
            </div>
        </div>
        <div class="modal" id="modal">
            <div class="modal-header">
                <div class="title">Price Information</div>
                <button data-close-button class="close-button">&times;</button>
            </div>
            <div class="modal-body">
                <jsp:include page="submitForm.jsp"/>
            </div>
        </div>
        <jsp:include page="../components/modal_Delete.jsp"/>
        <div id="overlay"></div>
    </body>
</html>
