<%-- 
    Document   : submitForm
    Created on : 25-02-2022, 00:35:31
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action="Insert" method="POST" id="submitForm">
    <span id="id_span" hidden>ID: <span id="pid_span"></span><input type="hidden" name="pid" id="pid_s" value=""/> <br/></span>
    Product: <select name="prdid" id="prdid_s">
        <option value="0">---All of product---</option>
        <option value="1">Eggs</option>
        <option value="2">Sell Cattle</option>
        <option value="3">Foodder</option>
        <option value="4">Medicine</option>
        <option value="5">Purchase Breeds</option>
        <option value="6">Other</option>
    </select><br/>
    Date: <input type="date" name="date" id="date_s" value="<%=new java.sql.Date(java.util.Calendar.getInstance().getTime().getTime())%>"/> <br/>
    Price: <input type="number" name="price" id="price_s"/> <br/>
    Decrepsion: <input type="text" name="decrepsion" id="decrepsion_s"/> <br/>
    <input type="submit" value="Save" onclick="return submitForm()"/>
</form>