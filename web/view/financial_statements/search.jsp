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
                submitSearchPrice();
                submitSearchFlock1();
                submitSearchFS();
            };

            function submitSearchFS() {
                $.ajax({
                    type: 'POST',
                    url: 'showFSTable',
                    data: {
                        "date": "",
                        "isAvai": "-1",
                        "FID": "-1"
                    },
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
                            const date = new Date(item['date']);
                            var m = (date.getMonth() + 1 < 10) ? '0' + (date.getMonth() + 1) : date.getMonth() + 1;
                            var d = (date.getDate() < 10) ? '0' + (date.getDate()) : date.getDate();
                            if(item['Revenue']==true){
                                html += '<tr class="table-info" id="' + item["FSID"] + '">';
                            }else{
                                html += '<tr class="table-danger" id="' + item["FSID"] + '">';
                            }
                            var isRevnue = (item["Revenue"]==true) ? 'Revenue' : 'Cost';
                            html += '   <td>' + isRevnue + '</td>';
                            html += '   <td>' + date.getFullYear() + '-' + m + '-' + d + '</td>';
                            html += '   <td value="' + item["flock"]["FID"] + '">' + item["flock"]["FName"] + '</td>';
                            html += '   <td>' + item["price"]["Product"]["Product_name"] + '</td>';
                            html += '   <td value="' + item["price"]["PriceID"] + '">' + item["price"]["Price"] + '</td>';
                            html += '   <td>' + item["Quantily"] + '</td>';
                            html += '   <td>' + item["Total"] + '</td>';
                            html += '   <td>' + item["Decrepsion"] + '</td>';
                            html += '   <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="" data-bs-toggle="modal" data-bs-target="#ModalPopup">View</button></td>';
                            html += '   <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="">Remove</button></td>';
                            html += '</tr>';
                        });
                        $('#FSData').html(html);
                    }
                });
            }

            function submitSearchFlock1() {
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
                        $('#flockField1').html(html);
                    }
                });
            }

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
                            html += '<option value="' + item['FID'] + '">' + item['FName'] + '</option>';
                        });
                        $('#flockField').html(html);
                    }
                });
            }

            function submitSearchPrice() {
                $.ajax({
                    type: 'POST',
                    url: "../Price/showPriceTable",
                    data:
                            {
                                "prdid": $("#searchPrice option:selected").val(),
                                "date": ""
                            },
                    dataType: "json",
                    success: function (jsondata) {
                        var html = "";
                        $.each(jsondata, function (key, item) {
                            html += "<option value=\"" + item['PriceID'] + "\" id=\"" + item['Product']['ProductID'] + "\" product_name=\"" + item['Product']['Product_name'] + "\" price=\"" + item['Price'] + "\">";
                            html += item['Product']['Product_name'] + " | " + item['Date'] + " | " + item['Price'];
                            html += "</option>";
                        });
                        $('#priceField').html(html);
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

                $('#add').click(function () {
                    $('#ModalPopup .modal-title').html('Add a new Finnancial Statement record');
                    var date = new Date();
                    var day = date.getDate();
                    var month = date.getMonth() + 1;
                    var year = date.getFullYear();
                    if (month < 10)
                        month = "0" + month;
                    if (day < 10)
                        day = "0" + day;
                    var today = year + "-" + month + "-" + day;

                    $('#isRevenue').prop('checked', true);
                    $('#date').val(today);
                    $('#searchFlock').val(-1);
                    submitSearchFlock();
                    $('#searchPrice').val(0);
                    submitSearchPrice();
                    $('#quantily').val('');
                    $('#decrepsion').val('');
                    $('#save').text('Save');
                    $('#ModalPopup').modal('toggle');
                });

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
                                const date = new Date(item['date']);
                                var m = (date.getMonth() + 1 < 10) ? '0' + (date.getMonth() + 1) : date.getMonth() + 1;
                                var d = (date.getDate() < 10) ? '0' + (date.getDate()) : date.getDate();
                                if(item['Revenue']==true){
                                    html += '<tr class="table-info" id="' + item["FSID"] + '">';
                                }else{
                                    html += '<tr class="table-danger" id="' + item["FSID"] + '">';
                                }
                                var isRevnue = (item["Revenue"]==true) ? 'Revenue' : 'Cost';
                                html += '   <td>' + isRevnue + '</td>';
                                html += '   <td>' + date.getFullYear() + '-' + m + '-' + d + '</td>';
                                html += '   <td value="' + item["flock"]["FID"] + '">' + item["flock"]["FName"] + '</td>';
                                html += '   <td>' + item["price"]["Product"]["Product_name"] + '</td>';
                                html += '   <td value="' + item["price"]["PriceID"] + '">' + item["price"]["Price"] + '</td>';
                                html += '   <td>' + item["Quantily"] + '</td>';
                                html += '   <td>' + item["Total"] + '</td>';
                                html += '   <td>' + item["Decrepsion"] + '</td>';
                                html += '   <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="" data-bs-toggle="modal" data-bs-target="#ModalPopup">View</button></td>';
                                html += '   <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="">Remove</button></td>';
                                html += '</tr>';
                            });
                            $('#FSData').html(html);
                        }
                    });
                });

                $("#save").click(function () {
                    if ($('#save').text() == 'Save') {
                        $.ajax({
                            url: 'Insert',
                            method: 'POST',
                            data: {
                                "hidden_isRevenue[1]": ($('#isRevenue').is(':checked'))? 'Revenue': 'Cost',
                                "hidden_date[1]": $('#date').val(),
                                "hidden_flockID[1]": $('#flockField').val(),
                                "hidden_priceID[1]": $('#priceField').val(),
                                "hidden_quantily[1]": $('#quantily').val(),
                                "hidden_total[1]": "0",
                                "hidden_decrepsion[1]": $('#decrepsion').val(),
                                "count_data": "1"
                            },
                            success: function () {
                                submitSearchFS();
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
                            data: {
                                "isRevenue": $('#isRevenue').is(":checked") ? "Revenue" : "Cost",
                                "date": $('#date').val(),
                                "flockID": $('#flockField').val(),
                                "priceID": $('#priceField').val(),
                                "quantily": $('#quantily').val(),
                                "decrepsion": $('#decrepsion').val(),
                                "ID": $('#FSID').val()
                            },
                            success: function () {
                                submitSearchFS();
                                $('#ModalPopup').modal('hide');
                                $('#modal_notice .modal-title').html('Notice');
                                $('#modal_notice .modal-body').html('Edit successed!');
                                $('#modal_notice .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                                $('#modal_notice').modal('show');
                            }
                        });
                    }
                });

                $(document).on('click', '.view_details', function () {
                    var currentRow = $(this).closest("tr");
                    var row_id = currentRow.attr("id");
                    var status = currentRow.find("td:eq(0)").text();
                    var date = currentRow.find("td:eq(1)").text();
                    var FID = currentRow.find("td:eq(2)").attr("value");
                    var col4 = currentRow.find("td:eq(3)").text();
                    var pid = currentRow.find("td:eq(4)").attr("value");
                    var col6 = currentRow.find("td:eq(5)").text();
                    var col8 = currentRow.find("td:eq(7)").text();


                    var check = (status == 'Revenue') ? true : false;
                    $('#save').text('Edit');
                    $('#FSID').val(row_id);
                    $('#isRevenue').prop('checked', check);
                    $('#date').val(date);
                    $('#searchFlock').val("-1");
//                    submitSearchFlock();
                    $('#searchPrice').val("0");
//                    submitSearchPrice();
                    $('#flockField').val(FID);
                    $('#priceField').val(pid);
                    $('#quantily').val(col6);
                    $('#decrepsion').val(col8);
                });

                $(document).on('click', '.remove_details', function () {
                    var currentRow = $(this).closest("tr");
                    var row_id = currentRow.attr("id");
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
                            data: {ID: row_id},
                            success: function () {
                                $('#modal_notice1 .modal-title').html("Notification!");
                                $('#modal_notice1 .modal-body').html("Delete successful!");
                                $('#modal_notice1 .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                                $('#modal_notice1').modal('toggle');
                                submitSearchFS();
                            }
                        });
                    });
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>
        <div class="container">
            <div>
                <form action="showFSTable" id="searchForm">
                    <!--                    Date: <input type="date" name="date" id="date" onchange="submitSearchForm()"/> </br>-->
                    Date: <input type="date" name="date" id="date1"/> </br>
                    Flock: <select name="isAvai" id="searchFlock1" onchange="submitSearchFlock1();">
                        <option value="-1">-----All FLOCK-----</option>
                        <option value="0">Sold</option>
                        <option value="1">Available</option>
                    </select>
                    <!--                    <select id="flockField" name="FID" onchange="submitSearchForm()"></select>-->
                    <select id="flockField1" name="FID"></select>
                </form>
            </div>
            <div align="right" style="margin-bottom:5px;">
                <button type="button" id="add" class="btn btn-success btn-xs" data-bs-toggle="modal" data-bs-target="#ModalPopup">Add</button>
            </div>
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
            <jsp:include page="submitForm.jsp"/>
            <jsp:include page="../components/modal_notice.jsp"/>
            <jsp:include page="../components/modal_overview.jsp"/>
        </div>
    </body>
</html>
