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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <!--        <script src="../js/popupModalDelete.js"></script>
                <script src="../js/takeFlockDataFromTable"></script>-->
        <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
//                        $('#modal').removeClass('active');
//                        $('#overlay').removeClass('active');
//                        $('#tableField').html(data);
                        submitSearchForm();
//                        $.getScript("../js/popupModal.js");
//                        $.getScript("../js/popupModalDelete.js");
                    }
                });
                return false;
            }

            function getListChartData(_fs, _date) {
                var data = [];
                _date.forEach(function (elem) {
                    if (_fs.length > 0) {
                        if (elem === _fs[0].Decrepsion) {
                            data.push(_fs[0].Total);
                            _fs.shift();
                        }else{
                            data.push('');
                        }
                    }
                });
                return data;
            }

            function submitSearchForm() {
                $.ajax({
                    type: 'POST',
                    url: $('#searchForm').attr('action'),
                    data: $('#searchForm').serialize(),
                    dataType: "json",
                    success: function (jsondata) {
                        var html = "";
                        html += '<table class="table table-striped table-bordered" id="myTable">\n'
                                + "                <tr>\n"
                                + "                    <th>ID</th>\n"
                                + "                    <th>Name</th>\n"
                                + "                    <th>Purchase date</th>\n"
                                + "                    <th>Sale date</th>\n"
//                            + "                    <th>Interactive</th>\n"
                                + '                    <th>Detail</th>\n'
                                + '                    <th>Remove</th>\n'
                                + '                    <th>More Information</th>\n'
                                + "                </tr>\n";
                        $.each(jsondata, function (key, item) {
                            html += "                <tr>\n"
                                    + "                    <td>" + item['FID'] + "</td>\n"
                                    + "                    <td>" + item['FName'] + "</td>\n"
                                    + "                    <td>" + convertDateType(item['Purchase_date']) + "</td>\n"
                                    + "                    <td>" + convertDateType(item['Sale_date']) + "</td>\n"
//                                    + "                    <td>\n"
//                                    + "                        <button id=\"edit\" data-modal-target=\"#modal\">Edit</button>\n"
//                                    + "                        <button id=\"delete\" data-modal-target=\"#modalDelete\">Delete</button>\n"
//                                    + "                        <button id=\"interactive\" data-modal-target=\"#modal\">Information</button>\n"
//                                    + "\n"
//                                    + "                    </td>\n"
                                    + '                    <td><button type="button" name="view_details" class="btn btn-warning btn-xs view_details" id="" data-bs-toggle="modal" data-bs-target="#ModalPopup">View</button></td>\n'
                                    + '                    <td><button type="button" name="remove_details" class="btn btn-danger btn-xs remove_details" id="">Remove</button></td>\n'
                                    + '                    <td><button type="button" class="btn btn-info overview">Overview</button></td>\n'
                                    + "               </tr>\n";
                        });
                        $('#tableField').html(html);
//                        $.getScript("../js/popupModal.js");
//                        $.getScript("../js/popupModalDelete.js");
//                        $.getScript("../js/takeFlockDataFromTable.js");
                    }
                });
            }
            function convertDateType(dateJson) {
                if (dateJson != null) {
                    const date = new Date(dateJson);
                    var m = (date.getMonth() + 1 < 10) ? '0' + (date.getMonth() + 1) : date.getMonth() + 1;
                    var d = (date.getDate() < 10) ? '0' + (date.getDate()) : date.getDate();

                    return date.getFullYear() + '-' + m + '-' + d;
                }
            }
            $(document).ready(function () {
                $('#add').click(function () {
                    $('#ModalPopup .modal-title').html('Add new flock');
                    $('#name').val('');
                    $('#purchase_date').val('');
                    $('#sale_date').val('');
                    $('#ModalPopup').modal('toggle');
                });

                $(document).on('click', '.view_details', function () {
                    var currentRow = $(this).closest("tr");
                    var col1 = currentRow.find("td:eq(0)").text();
                    var col2 = currentRow.find("td:eq(1)").text();
                    var col3 = currentRow.find("td:eq(2)").text();
                    var col4 = currentRow.find("td:eq(3)").text();

                    $('#FID').val(col1);
                    $('#name').val(col2);
//                document.getElementById("date_s").setAttribute('value', col3);
                    $('#purchase_date').val(col3);
                    $('#sale_date').val(col4);
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
                                console.log(check);
                            }
//                            success: function (error) {
//                                if (error == 547) {
//                                    console.log("loiiiii");
//                                } else {
//                                    console.log("done");
//                                }
//                            }
                        });
                    });
                });

                $(document).on('click', '.overview', function () {
                    var currentRow = $(this).closest("tr");
                    var col1 = currentRow.find("td:eq(0)").text();
                    $('#chart').html('<canvas id="myChart" style="width:100%;max-width:100%"></canvas>');
                    $.ajax({
                        url: 'Information_Flock',
                        method: 'POST',
                        data: {ID: col1},
                        dataType: 'json',
                        success: function (jsonData) {
                            var data = [];
                            jsonData[1].forEach(function (elem) {
                                data.push(elem.Total);
                            });
                            var _arrayR = getListChartData(jsonData[1], jsonData[3]);
                            var _arrayC = getListChartData(jsonData[2], jsonData[3]);
                            const ctx = document.getElementById('myChart').getContext('2d');
                            const myChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: jsonData[3],
                                    datasets: [
                                        {
                                            label: 'Revenue',
                                            data: _arrayR,
                                            backgroundColor: 'rgb(0, 150, 255)',
                                            borderColor: 'rgb(0, 150, 255)',
                                            borderWidth: 1
                                        },
                                        {
                                            label: 'Cost',
                                            data: _arrayC,
                                            backgroundColor: 'rgb(255, 0, 0)',
                                            borderColor: 'rgb(255, 0, 0)',
                                            borderWidth: 1
                                        }
                                    ]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    },
                                    spanGaps: true
                                }
                            });

                            var table = '<dl class="row">'
                                    + '    <dt class="col-8">Days of flock</dt>'
                                    + '    <dd class="col-4">' + jsonData[0][2] + '</dd>'
                                    + '    <dt class="col-8">Total Revenue</dt>'
                                    + '    <dd class="col-4">' + jsonData[0][0] + '</dd>'
                                    + '    <dt class="col-8">Total Cost</dt>'
                                    + '    <dd class="col-4">' + jsonData[0][1] + '</dd>'
                                    + '</dl>';
                            $('#modal_overview .modal-body').html(table);
                            $('#modal_overview').modal('toggle');
                        }
                    });
                });

                $('#addFlock').on('submit', function (event) {
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
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>
        <div class="container">
            <form id="searchForm" method="POST" action="Search">
                Flock name: <select name="isAvai" onchange="submitSearchForm();">
                    <option value="-1">-----All FLOCK-----</option>
                    <option value="0">Sold</option>
                    <option value="1">Available</option>
                </select><br/>
            </form>
            <br/>
            <!--            <button id="insert" data-modal-target="#modal">Add</button>-->
            <div align="right" style="margin-bottom:5px;">
                <button type="button" id="add" class="btn btn-success btn-xs" data-bs-toggle="modal" data-bs-target="#ModalPopup">Add</button>
            </div>
            <div id="tableField" class="table-responsive"></div>

        </div>

        <!--        <div class="modal" id="modal">
                    <div class="modal-header">
                        <div class="title">Flock Information</div>
                        <button data-close-button class="close-button">&times;</button>
                    </div>
                    <div class="modal-body">
                    </div>
                </div>-->
        <div>
            <jsp:include page="submitForm.jsp"/>
            <jsp:include page="../components/modal_notice.jsp"/>
            <jsp:include page="../components/modal_overview.jsp"/>
        </div>
    </body>
</html>
