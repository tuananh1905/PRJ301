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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <!--        <script src="../js/takePriceDataFromTable.js"></script>-->
        <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
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
                    html = '<table class="table table-striped table-bordered" id="myTable">\n'
                            + "                <tr>\n"
                            + "                    <th>ID</th>\n"
                            + "                    <th>Product Name</th>\n"
                            + "                    <th>Date</th>\n"
                            + "                    <th>Price</th>\n"
                            + "                    <th>Decrepsion</th>\n"
                            + "                    <th>Details</th>\n"
                            + "                    <th>Remove</th>\n"
                            + "                </tr>\n";
                    $.each(jsondata, function (key, item) {
                        const date = new Date(item['Date']);
                        var m = (date.getMonth() + 1 < 10) ? '0' + (date.getMonth() + 1) : date.getMonth() + 1;
                        var d = (date.getDate() < 10) ? '0' + (date.getDate()) : date.getDate();
                        html += "                <tr>\n"
                                + "                    <td>" + item['PriceID'] + "</td>\n"
                                + "                    <td>" + item['Product']['Product_name'] + "</td>\n"
                                + "                    <td>" + date.getFullYear() + '-' + m + '-' + d + "</td>\n"
                                + "                    <td>" + item['Price'] + "</td>\n"
                                + "                    <td>" + item['Decrepsion'] + "</td>\n"
                                + '                    <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="" data-bs-toggle="modal" data-bs-target="#ModalPopup">View</button></td>'
                                + '                    <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="">Remove</button></td>'
                                + "                </tr>\n";
                    });
                    $('#priceTable').html(html);
//                    $.getScript("../js/popupModal.js");
//                    $.getScript("../js/takePriceDataFromTable.js");
//                    $.getScript("../js/popupModalDelete.js");
//                    console.log(jsondata);
                }
            });
        }
        function submitForm() {
            $.ajax({
                type: 'POST',
                url: $('#submitForm').attr('action'),
                data: $('#submitForm').serialize(),
                success: function (data) {
//                    $('#modal').removeClass('active');
//                    $('#overlay').removeClass('active');
                    submitSearchForm();
//                    $.getScript("../js/popupModal.js");
//                    $.getScript("../js/popupModalDelete.js");
                }
            });
            return false;
        }
        $(document).ready(function () {
            $('#add').click(function () {
                var date = new Date();
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (month < 10)
                    month = "0" + month;
                if (day < 10)
                    day = "0" + day;
                var today = year + "-" + month + "-" + day;
                $('#prdid_s').val('0');
                $('#date_s').val(today);
                $('#price_s').val('');
                $('#decrepsion').val('');
                $('#save').val('Save');
            });

            $(document).on('click', '.view_details', function () {
                var currentRow = $(this).closest("tr");
                var col1 = currentRow.find("td:eq(0)").text();
                var col2 = currentRow.find("td:eq(1)").text();
                var col3 = currentRow.find("td:eq(2)").text();
                var col4 = currentRow.find("td:eq(3)").text();
                var col5 = currentRow.find("td:eq(4)").text();

                var productList = document.getElementById("prdid_s");
                for (var i = 0; i < productList.options.length; i++) {
                    if (productList.options[i].text === col2) {
                        $('#prdid_s').val(i.toString()).change();
                    }
                }
                $('#pid_s').val(col1);
                $('#date_s').val(col3);
//                document.getElementById("date_s").setAttribute('value', col3);
                $('#price_s').val(col4);
                $('#decrepsion_s').val(col5);
                $('#save').val('Edit');
            });

            $(document).on('click', '.remove_details', function () {
                var currentRow = $(this).closest("tr");
                var col1 = currentRow.find("td:eq(0)").text();
                var htmlFooter = '';
                htmlFooter += '<button type="button" id="confirm" class="btn btn-primary" data-bs-dismiss="modal">Confirm</button>';
                htmlFooter += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';

                $('#modal_notice .modal-title').html("Confirm Navigation!");
                $('#modal_notice .modal-body').html("Are you sure you want to remove this row data?");
                $('#modal_notice .modal-footer').html(htmlFooter);

                $('#modal_notice').modal('show');

                $('#confirm').click(function () {
                    $('#modal_notice').modal('hide');
                    $.ajax({
                        url: 'Delete',
                        method: 'POST',
                        data: {ID: col1},
                        dataType: 'json',
                        success: function (check) {
                            if (check) {
                                $('#modal_notice1 .modal-title').html("Notification!");
                                $('#modal_notice1 .modal-body').html("Delete successful!");
                                $('#modal_notice1 .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                                $('#modal_notice1').modal('toggle');
                            } else {
                                $('#modal_notice1 .modal-title').html("Notification!");
                                $('#modal_notice1 .modal-body').html("<div>Cant delete this price!</div>");
                                $('#modal_notice1 .modal-body').append("<div>(Maybe that was used in some FS Record)</div>");
                                $('#modal_notice1 .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                                $('#modal_notice1').modal('toggle');
                            }
                            submitSearchForm();
                        }
                    });
                });
            });

            $('#addPrice').on('submit', function (event) {
                event.preventDefault();
                if ($('#save').val() == 'Save') {
                    $.ajax({
                        url: 'Insert',
                        method: 'POST',
                        data: $(this).serialize(),
                        success: function () {
                            submitSearchForm();
                            $('#ModalPopup').modal('hide');
                            $('#modal_notice .modal-title').html('Notice');
                            $('#modal_notice .modal-body').html('Add successed!');
                            $('#modal_notice .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                            $('#modal_notice').modal('show');
                        }
                    });
                } else {
                    $.ajax({
                        url: 'Edit',
                        method: 'POST',
                        data: $(this).serialize(),
                        success: function () {
                            submitSearchForm();
                            $('#ModalPopup').modal('hide');
                            $('#modal_notice .modal-title').html('Notice');
                            $('#modal_notice .modal-body').html('Edit successed!');
                            $('#modal_notice .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                            $('#modal_notice').modal('show');
                        }
                    });
                }
            });
        });
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
                <!--                <button id="insert" data-modal-target="#modal">Add</button>-->
                <div align="right" style="margin-bottom:5px;">
                    <button type="button" id="add" class="btn btn-success btn-xs" data-bs-toggle="modal" data-bs-target="#ModalPopup">Add</button>
                </div>
                <div id="priceTable"></div>
            </div>
        </div>
        <!--        <div class="modal" id="modal">
                    <div class="modal-header">
                        <div class="title">Price Information</div>
                        <button data-close-button class="close-button">&times;</button>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                </div>-->
        <div>
            <jsp:include page="submitForm.jsp"/>
            <jsp:include page="../components/modal_notice.jsp"/>
        </div>
    </body>
</html>
