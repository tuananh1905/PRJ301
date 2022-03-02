<%-- 
    Document   : search
    Created on : 20-02-2022, 13:04:21
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
        </div>
    </body>
</html>
