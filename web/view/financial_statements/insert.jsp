<%-- 
    Document   : insert
    Created on : 20-02-2022, 13:04:12
    Author     : TuanAnh
--%>

<%@page import="model.Flock"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <!--        <link rel="stylesheet" type="text/css" href="../css/popupModal.css"/>
                <script defer src="../js/popupModal.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>
            function submitSearchFlock() {
                $.ajax({
                    type: 'POST',
                    url: "../Flock/Search",
                    data: {"isAvai": $("#searchFlock option:selected").val()},
                    dataType: "json",
                    success: function (jsondata) {
                        var html = "";
                        $.each(jsondata, function (key, item) {
                            html += "<option value=\"" + item['FID'] + "\">" + item['FName'] + "</option>";
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

                    $('#isRevenue').prop('checked', true);
                    $('#date').val(today);
                    $('#searchFlock').val(-1);
                    submitSearchFlock();
                    $('#searchPrice').val(0);
                    submitSearchPrice();
                    $('#quantily').val('');
                    $('#decrepsion').val('');
                    $('#save').text('Save');
                });

                var count = 0;
                $("#save").click(function () {
                    var html = "";
                    var isRevenue = $('#isRevenue').is(":checked") ? "Revenue" : "Cost";
                    var date = $('#date').val();
                    var flockID = $('#flockField').val();
                    var flockName = $('#flockField option:selected').text();
                    var priceID = $('#priceField').val();
                    var price = $('#priceField option:selected').attr('price');
                    var productName = $('#priceField option:selected').attr('product_name');
                    var quantily = $('#quantily').val();
                    var total = parseInt(price) * parseInt(quantily);
                    var decrepsion = $('#decrepsion').val();

                    if ($('#quantily').val() == '') {
                        error_quantily = 'Quantily is required';
                        $('#error_quantily').text(error_quantily);
                        $('#quantily').css('border-color', '#cc0000');
                    } else {
                        if ($('#save').text() == 'Save') {
                            count += 1;
                            var html = '';
//                            html += '<tr id="row_' + count + '">';
//                            html += '     <td>' + isRevenue + '<input type="hidden" name="hidden_isRevenue[' + count + ']" id="isRevenue_' + count + '" class="isRevenue" value="' + isRevenue + '"/></td>';
//                            html += '     <td>' + date + '<input type="hidden" name="hidden_date[' + count + ']" id="date_' + count + '" class="date" value="' + date + '"/></td>';
//                            html += '     <td>' + flockName + '<input type="hidden" name="hidden_flockID[' + count + ']" id="flockID_' + count + '" class="flockID" value="' + flockID + '"/></td>';
//                            html += '     <td>' + productName + '</td>';
//                            html += '     <td>' + price + '<input type="hidden" name="hidden_priceID[' + count + ']" id="priceID_' + count + '" class="priceID" value="' + priceID + '"/></td>';
//                            html += '     <td>' + quantily + '<input type="hidden" name="hidden_quantily[' + count + ']" id="quantily_' + count + '" class="quantily" value="' + quantily + '"/></td>';
//                            html += '     <td>' + total + '<input type="hidden" name="hidden_total[' + count + ']" id="total_' + count + '" class="total" value="' + total + '" </td>';
//                            html += '     <td>' + decrepsion + '<input type="hidden" name="hidden_decrepsion[' + count + ']" id="decrepsion_' + count + '" class="decrepsion" value="' + decrepsion + '" </td>';
//                            html += '     <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="' + count + '" data-bs-toggle="modal" data-bs-target="#ModalPopup">View</button></td>';
//                            html += '     <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="' + count + '">Remove</button></td>';
//                            html += '</tr>';

                            html += '<tr id="row_' + count + '">';
                            html += '     <td>' + isRevenue + '<input type="hidden" name="hidden_isRevenue[" id="isRevenue_' + count + '" class="isRevenue" value="' + isRevenue + '"/></td>';
                            html += '     <td>' + date + '<input type="hidden" name="hidden_date[" id="date_' + count + '" class="date" value="' + date + '"/></td>';
                            html += '     <td>' + flockName + '<input type="hidden" name="hidden_flockID[" id="flockID_' + count + '" class="flockID" value="' + flockID + '"/></td>';
                            html += '     <td>' + productName + '</td>';
                            html += '     <td>' + price + '<input type="hidden" name="hidden_priceID[" id="priceID_' + count + '" class="priceID" value="' + priceID + '"/></td>';
                            html += '     <td>' + quantily + '<input type="hidden" name="hidden_quantily[" id="quantily_' + count + '" class="quantily" value="' + quantily + '"/></td>';
                            html += '     <td>' + total + '<input type="hidden" name="hidden_total[" id="total_' + count + '" class="total" value="' + total + '" </td>';
                            html += '     <td>' + decrepsion + '<input type="hidden" name="hidden_decrepsion[" id="decrepsion_' + count + '" class="decrepsion" value="' + decrepsion + '" </td>';
                            html += '     <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="' + count + '" data-bs-toggle="modal" data-bs-target="#ModalPopup">View</button></td>';
                            html += '     <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="' + count + '">Remove</button></td>';
                            html += '</tr>';

                            $('#FSData').append(html);
                            $('#ModalPopup').modal('toggle');
                        } else {
                            var row_id = $('#hidden_row_id').val();
                            var html = '';
                            html += '     <td>' + isRevenue + '<input type="hidden" name="hidden_isRevenue[' + row_id + ']" id="isRevenue_' + row_id + '" class="isRevenue" value="' + isRevenue + '"/></td>';
                            html += '     <td>' + date + '<input type="hidden" name="hidden_date[' + row_id + ']" id="date_' + row_id + '" class="date" value="' + date + '"/></td>';
                            html += '     <td>' + flockName + '<input type="hidden" name="hidden_flockID[' + row_id + ']" id="flockID_' + row_id + '" class="flockID" value="' + flockID + '"/></td>';
                            html += '     <td>' + productName + '</td>';
                            html += '     <td>' + price + '<input type="hidden" name="hidden_priceID[' + row_id + ']" id="priceID_' + row_id + '" class="priceID" value="' + priceID + '"/></td>';
                            html += '     <td>' + quantily + '<input type="hidden" name="hidden_quantily[' + row_id + ']" id="quantily_' + row_id + '" class="quantily" value="' + quantily + '"/></td>';
                            html += '     <td>' + total + '<input type="hidden" name="hidden_total[' + row_id + ']" id="total_' + row_id + '" class="total" value="' + total + '" </td>';
                            html += '     <td>' + decrepsion + '<input type="hidden" name="hidden_decrepsion[' + row_id + ']" id="decrepsion_' + row_id + '" class="decrepsion" value="' + decrepsion + '" </td>';
                            html += '     <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="' + row_id + '" data-bs-toggle="modal" data-bs-target="#ModalPopup">View</button></td>';
                            html += '     <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="' + row_id + '">Remove</button></td>';

                            $('#row_' + row_id + '').html(html);
                            $('#ModalPopup').modal('toggle');
                        }
                    }
                });

                $(document).on('click', '.view_details', function () {
                    var row_id = $(this).attr("id");
                    var isRevenue = $('#isRevenue_' + row_id + '').val();
                    var date = $('#date_' + row_id + '').val();
                    var flockID = $('#flockID_' + row_id + '').val();
                    var priceID = $('#priceID_' + row_id + '').val();
                    var quantily = $('#quantily_' + row_id + '').val();
                    var decrepsion = $('#decrepsion_' + row_id + '').val();

                    var check = (isRevenue == 'Revenue') ? true : false;
                    $('#save').text('Edit');
                    $('#hidden_row_id').val(row_id);
                    $('#isRevenue').prop('checked', check);
                    $('#date').val(date);
                    $('#flockField').val(flockID);
                    $('#priceField').val(priceID);
                    $('#quantily').val(quantily);
                    $('#decrepsion').val(decrepsion);
                });

                $(document).on('click', '.remove_details', function () {
                    var row_id = $(this).attr("id");

                    var htmlFooter = '';
                    htmlFooter += '<button type="button" id="confirm" class="btn btn-primary" data-bs-dismiss="modal">Confirm</button>';
                    htmlFooter += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';

                    $('#modal_notice .modal-title').html("Confirm Navigation!");
                    $('#modal_notice .modal-body').html("Are you sure you want to remove this row data?");
                    $('#modal_notice .modal-footer').html(htmlFooter);

                    $('#modal_notice').modal('toggle');
                    $('#confirm').click(function () {
                        $('#row_' + row_id + '').remove();
                    });
                });

                $('#FSForm').on('submit', function (event) {
                    event.preventDefault();
//                    var count_data = 0;
//                    $('.isRevenue').each(function () {
//                        count_data += 1;
//                        $(this).attr('name','hidden_isRevenue['+count_data+']');
//                        $(this).attr('name','hidden_date['+count_data+']');
//                        $(this).attr('name','hidden_flockID['+count_data+']');
//                        $(this).attr('name','hidden_priceID['+count_data+']');
//                        $(this).attr('name','hidden_quantily['+count_data+']');
//                        $(this).attr('name','hidden_isRevenue['+count_data+']');
//                        $(this).attr('name','hidden_decrepsion['+count_data+']');
//                    });

                    var count_data = -1;
                    $('tr').each(function () {
                        count_data += 1;
                        if (count_data > 0) {
                            var currentRow = $(this).closest("tr");
//                            $(this 'hidden_isRevenue[').attr('name', 'hidden_isRevenue['+count_data+']');
                            $(this).find('.isRevenue').attr('name', 'hidden_isRevenue[' + count_data + ']');
                            $(this).find('.date').attr('name', 'hidden_date[' + count_data + ']');
                            $(this).find('.flockID').attr('name', 'hidden_flockID[' + count_data + ']');
                            $(this).find('.priceID').attr('name', 'hidden_priceID[' + count_data + ']');
                            $(this).find('.quantily').attr('name', 'hidden_quantily[' + count_data + ']');
                            $(this).find('.total').attr('name', 'hidden_total[' + count_data + ']');
                            $(this).find('.decrepsion').attr('name', 'hidden_decrepsion[' + count_data + ']');
                        }
                    });

                    if (count_data > 0) {
                        $.ajax({
                            url: 'Insert',
                            method: 'POST',
                            data: $(this).serialize() + "&count_data=" + count_data,
                            success: function (data) {
                                var html = '';
                                html += "<tr>\n" +
                                        "    <th>Status</th>\n" +
                                        "    <th>Date</th>\n" +
                                        "    <th>Flock</th>\n" +
                                        "    <th>Product</th>\n" +
                                        "    <th>Price</th>\n" +
                                        "    <th>Quantily</th>\n" +
                                        "    <th>Total</th>\n" +
                                        "    <th>Decrepsion</th>\n" +
                                        "    <th>Details</th>\n" +
                                        "    <th>Remove</th>\n" +
                                        "</tr>\n";
                                $('#FSData').html(html);
                            }
                        });
                    } else {
                        $('#modal_notice .modal-title').html('Notice');
                        $('#modal_notice .modal-body').html('Please Add at least one data');
                        $('#modal_notice .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                        $('#modal_notice').modal('toggle');
                    }
                });

                $('#check').click(function () {
                    var total_sum_revenue = 0;
                    var total_sum_cost = 0;
                    $('tr').each(function () {
                        var currentRow = $(this).closest("tr");
                        var status = currentRow.find("td:eq(0)").text();
                        if (status == "Revenue") {
                            total_sum_revenue += parseInt(currentRow.find("td:eq(6)").text());
                        }
                        if (status == "Cost") {
                            total_sum_cost += parseInt(currentRow.find("td:eq(6)").text());
                        }
                    });
                    var html = '';
                    html += '<div> Total Revenue: ' + total_sum_revenue + '</div>';
                    html += '<div> Total Cost: ' + total_sum_cost + '</div>';
                    $('#modal_notice .modal-title').html('Data Overview')
                    $('#modal_notice .modal-body').html(html);
                    $('#modal_notice .modal-footer').html('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>');
                });

                $()
            });
        </script>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>
        <div class="container">
            <div align="right" style="margin-bottom:5px;">
                <button type="button" id="check" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#modal_notice">Check</button>
                <button type="button" id="add" class="btn btn-success btn-xs" data-bs-toggle="modal" data-bs-target="#ModalPopup">Add</button>
            </div>
            <form method="POST" id="FSForm">
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
                <div align="center">
                    <input type="submit" name="insert" id="insert" form="FSForm" class="btn btn-primary" value="Insert"/>
                </div>
            </form>
        </div>
        <div id="modalField">
            <jsp:include page="../components/modal_notice.jsp"/>
            <jsp:include page="submitForm.jsp"/>
        </div>
    </body>
</html>