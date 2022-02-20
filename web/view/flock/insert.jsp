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
    <body>
        <form action="Insert" method="POST">
            Flock name: <input type="text" name="name"/> <br/>
            Purchase date: <input type="date" name="purchase"/> <br/>
            Sale date: <input type="date" name="sale"/> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
