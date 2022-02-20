<%-- 
    Document   : edit
    Created on : 19-02-2022, 21:22:53
    Author     : TuanAnh
--%>

<%@page import="model.Flock"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Flock f = (Flock) request.getAttribute("flock");
        %>
    </head>
    <body>
        <form action="Edit" method="POST">
            ID: <%= f.getFID() %> <input type="hidden" name="FID" value="<%=f.getFID()%>"/> <br/>
            Name: <input type="name" name="name" value="<%=f.getFName()%>" /> <br/>
            Purchase date: <input type="date" name="purchase_date" value="<%=f.getPurchase_date() %>" /> <br/>
            Sale date: <input type="date" name="sale_date" value="<%=f.getSale_date() %>" /> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
