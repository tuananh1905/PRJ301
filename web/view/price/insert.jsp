<%-- 
    Document   : insert
    Created on : 16-02-2022, 12:02:10
    Author     : TuanAnh
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
        %>
    </head>
    <body>
        <form action="Insert" method="POST" >
            Product: <select name="pid">
                <% for (Product p : products) {
                %>
                <option <%=(p.getProductID() == 6)?"selected=\"selected\"":""%> value="<%= p.getProductID() %>"><%=p.getProduct_name()%></option>
                <%}%>
            </select><br/>
            Date: <input type="date" name="date" value="<%=new java.sql.Date(java.util.Calendar.getInstance().getTime().getTime())%>" /> <br/>
            Price: <input type="number" name="price"/> <br/>
            Decrepsion: <input type="text" name="decrepsion" /> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
