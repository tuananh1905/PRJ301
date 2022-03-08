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
                    $('#isRevenue').prop('checked', true);
                    $('#date').val('');
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
                            html += '<tr id="row_' + count + '">';
                            html += '     <td>' + isRevenue + '<input type="hidden" name="hidden_isRevenue[' + count + ']" id="isRevenue_' + count + '" class="isRevenue" value="' + isRevenue + '"/></td>';
                            html += '     <td>' + date + '<input type="hidden" name="hidden_date[' + count + ']" id="date_' + count + '" class="date" value="' + date + '"/></td>';
                            html += '     <td>' + flockName + '<input type="hidden" name="hidden_flockID[' + count + ']" id="flockID_' + count + '" class="flockID" value="' + flockID + '"/></td>';
                            html += '     <td>' + productName + '</td>';
                            html += '     <td>' + price + '<input type="hidden" name="hidden_priceID[' + count + ']" id="priceID_' + count + '" class="priceID" value="' + priceID + '"/></td>';
                            html += '     <td>' + quantily + '<input type="hidden" name="hidden_quantily[' + count + ']" id="quantily_' + count + '" class="quantily" value="' + quantily + '"/></td>';
                            html += '     <td>' + total + '<input type="hidden" name="hidden_total[' + count + ']" id="total_' + count + '" class="total" value="' + total + '" </td>';
                            html += '     <td>' + decrepsion + '<input type="hidden" name="hidden_decrepsion[' + count + ']" id="decrepsion_' + count + '" class="decrepsion" value="' + decrepsion + '" </td>';
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

                $('#FSForm').on('submit', function (event) {
                    event.preventDefault();
                    var count_data = 0;
                    $('.isRevenue').each(function () {
                        count_data += 1;
                    });
                    if (count_data > 0) {
                        $.ajax({
                            url: '',
                            method: 'POST',
                            data: $(this).serialize(),
                            success: function (data) {
                                window.alert('success');
                            }
                        });
                    } else {
                        window.alert('faild');
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div align="right" style="margin-bottom:5px;">
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
                    <input type="submit" name="insert" id="insert" class="btn btn-primary" value="Insert"/>
                </div>
            </form>
        </div>

        <jsp:include page="submitForm.jsp"/>

    </body>
</html>