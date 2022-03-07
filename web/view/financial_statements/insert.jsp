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
//            document.getElementById("id_span").hiden = "true";
            window.onload = function () {
                submitSearchFlock();
                submitSearchPrice();
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
                            html += "<option value=\"" + item['PriceID'] + "\">" + item['Product']['Product_name'] + " | " + item['Date'] + " | " + item['Price'] + "</option>";
                        });
                        $('#priceField').html(html);
                    }
                });
            }
//            var myModal = document.getElementById('myModal')
//            var myInput = document.getElementById('myInput')
//
//            myModal.addEventListener('shown.bs.modal', function () {
//                myInput.focus()
//            });
//            $(document).ready(function () {
//
//                var count = 0;
//
//                $('#add').click(function () {
//
//                });
//
//                $('#save').click(function () {
//                    window.alert();
//                    var error_quantily = '';
//                    var quantily = '';
//                    if ($('#quantily').val() == '') {
//                        error_quantily = 'Quantily is required';
//                        $('#error_quantily').text(error_quantily);
//                        $('#quantily').css('border-color', '#cc0000');
//                        quantily = '';
//                    } else {
//                        error_quantily = '';
//                        $('#error_quantily').text(error_quantily);
//                        $('#quantily').css('border-color', '');
//                        quantily = $('#quantily').val();
//                    }
//                    if (error_quantily != '') {
//                        return false;
//                    } else {
//                        if ($('#save').text == 'Save') {
//                            count += 1;
//                            var isRevenue = $("#isRevenue").attr("checked") ? "True" : "False";
//                            var date = $("#date").val();
//                            var flockID = $("#flockField").val();
//                            var priceID = $("#priceField").val();
//                            var total = 150;
//
//
//
//                            output = '<tr id="row_' + count + '">';
//                            output += '<td>' + isRevenue + '<input type="hidden" name="hidden_isRevenue[]" id="isRevenue' + count + '" class="isRevenue" value="' + isRevenue + '"/></td>';
//                            output += '<td>' + date + '<input type="hidden" name="hidden_date[]" id="date' + count + '" class="date" value="' + date + '"/></td>';
//                            output += '<td>' + flockID + '<input type="hidden" name="hidden_flockID[]" id="flockID' + count + '" class="flockID" value="' + flockID + '"/></td>';
//                            output += '<td>' + priceID + '<input type="hidden" name="hidden_priceID[]" id="priceID' + count + '" class="priceID" value="' + priceID + '"/></td>';
//                            output += '<td>' + quantily + '<input type="hidden" name="hidden_quantily[]" id="quantily' + count + '" class="quantily" value="' + quantily + '"/></td>';
//                            output += '<td>' + total + '<input type="hidden" name="hidden_total[]" id="total' + count + '" class="total" value="' + total + '"/></td>';
//                            output += '<td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="' + count + '">View</button></td>';
//                            output += '<td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="' + count + '">Remove</button></td>';
//                            output += '</tr>';
//                            
//                            $('FSData').append(output);
//                        }
//                    }
//                });
//            });
            $(document).ready(function () {
                var count = 0;
                $("#save").click(function () {
                    var html = "";
//                    var isRevenue = $('#isRevenue').val();
//                    var isRevenue = $("#isRevenue").attr("checked") ? "True" : "False";
                    var isRevenue = $('#isRevenue').is(":checked") ? "Revenue" : "Cost";
                    var date = $('#date').val();
                    var flockID = $('#flockField').val();
                    var price = $('#priceField').val();
                    var quantily = $('#quantily').val();

                    if ($('#quantily').val() == '') {
                        error_quantily = 'Quantily is required';
                        $('#error_quantily').text(error_quantily);
                        $('#quantily').css('border-color', '#cc0000');
                    } else {
                        count += 1;
                        var html = '';
                        html += '<tr id="row_' + count + '">';
                        html += '     <td>' + isRevenue + '<input type="hidden" name="hidden_isRevenue[' + count + ']" id="isRevenue' + count + '" class="isRevenue" value="' + isRevenue + '"/></td>';
                        html += '     <td>' + date + '<input type="hidden" name="hidden_date[' + count + ']" id="date' + count + '" class="date" value="' + date + '"/></td>';
                        html += '     <td>' + flockID + '<input type="hidden" name="hidden_flockID[' + count + ']" id="flockID' + count + '" class="flockID" value="' + flockID + '"/></td>';
                        html += '     <td>' + price + '<input type="hidden" name="hidden_price[' + count + ']" id="price' + count + '" class="price" value="' + price + '"/></td>';
                        html += '     <td>' + quantily + '<input type="hidden" name="hidden_quantily[' + count + ']" id="quantily' + count + '" class="quantily" value="' + quantily + '"/></td>';
                        html += '     <td></td>';
                        html += '     <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="' + count + '">View</button></td>';
                        html += '     <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="' + count + '">Remove</button></td>';
                        html += '</tr>';

                        $('#FSData').append(html);
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
                            <th>Quantily</th>
                            <th>Total</th>
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