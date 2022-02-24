<%-- 
    Document   : insert
    Created on : 19-02-2022, 12:08:37
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        document.getElementById("id_span").hiden="true";
    </script>
    <body>
        <jsp:include page="submitForm.jsp"/>
    </body>
</html>
<%-- 
    Document   : insert
    Created on : 19-02-2022, 12:08:37
    Author     : TuanAnh


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        document.getElementById("id_span").hiden = "true";
        function submitForm() {
            $.ajax({
                type: 'POST',
                url: $('#submitForm').attr('action'),
                data: {
                    FID: $("#FID").val(),
                    name: $("#name").val(),
                    purchase_date: $("#purchase_date").val(),
                    sale_date: $("#sale_date").val(),
                    url_submit: "insert"
                },
                success: function () {
                    alert("success");
                }
            });
            return false;
        }
    </script>
    <body>
        <jsp:include page="submitForm.jsp"/>
        <div id="mytable"></div>
    </body>
</html>
--%>