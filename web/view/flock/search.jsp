<%-- 
    Document   : search
    Created on : 19-02-2022, 14:20:48
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
            ArrayList<Flock> flocks = (ArrayList<Flock>) request.getAttribute("flocks");
            int isAvai = (Integer) request.getAttribute("isAvai");
        %>
        <script>
            function submitSearchForm()
            {
                document.getElementById("searchForm").submit();
            }

            function deleteStudent(id)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    window.location.href = "delete?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <form id="searchForm" method="POST" action="Search">
            Flock name: <select name="isAvai" onchange="submitSearchForm();">
                <option <%=(-1 == isAvai) ? "selected=\"selected\"" : ""%> value="-1">-----SELECT A FLOCK-----</option>
                <option <%=(0 == isAvai) ? "selected=\"selected\"" : ""%> value="0">Sold</option>
                <option <%=(1 == isAvai) ? "selected=\"selected\"" : ""%> value="1">Available</option>
            </select><br/>
        </form>
        <br/>
        <% if (flocks.size() > 0) {%>
        <table border="1px">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Purchase date</td>
                <td>Sale date</td>
                <td></td>
            </tr>
            <% for (Flock f : flocks) {%>
            <tr>
                <td><%= f.getFID()%></td>
                <td><%= f.getFName()%></td>
                <td><%= f.getPurchase_date()%></td>
                <td><%= f.getSale_date()%></td>
                <td>
                    <form method="POST">
                        <button type="submit" name="FID" value="<%=f.getFID()%>" formaction="Edit">Edit</button>
                        <button type="submit" name="FID" value="<%=f.getFID()%>" formaction="Delete">Delete</button>
                        <button type="submit" name="FID" value="<%=f.getFID()%>" formaction="Information">Information</button>
                    </form>
                </td>
            </tr>
            <%}%>
            <%}%>
        </table>
    </body>

</html>
