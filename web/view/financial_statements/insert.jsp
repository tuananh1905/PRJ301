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
        <%
            int isAvai = (Integer) request.getAttribute("isAvai");
            ArrayList<Flock> flocks = (ArrayList<Flock>) request.getAttribute("flocks");
        %>
        <script>
            function submitSearchForm()
            {
                document.getElementById("searchForm").submit();
            }
        </script>
    </head>
    <body>
        <form id="searchForm" action="Insert" method="POST">
            Revenue: <input type="checkbox" value="Revenue" name="IsRevenue" /> <br/>
            Date: <input type="date" name="date"/> <br/>
            Select Flock: <select name="isAvai" onchange="submitSearchForm();">
                <option <%=(-1 == isAvai) ? "selected=\"selected\"" : ""%> value="-1">---Status---</option>
                <option <%=(0 == isAvai) ? "selected=\"selected\"" : ""%> value="0">Sold</option>
                <option <%=(1 == isAvai) ? "selected=\"selected\"" : ""%> value="1">Available</option>
            </select>
            <select name="FID">
                <% for (Flock f : flocks) {
                %>
                <option value="<%= f.getFID() %>"><%= f.getFName() %></option>
                <%}%>
            </select>
            
        </form>
    </body>
</html>
