<%-- 
    Document   : insertForm
    Created on : 21-02-2022, 20:12:43
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form method="POST" action="Insert" id="submitForm">
    <span id="id_span" hidden>ID: <span id="FID_span"></span><input type="hidden" name="FID" id="FID" value=""/> <br/></span>
    Name: <input type="name" name="name" id="name" value="" /> <br/>
    Purchase date: <input type="date" name="purchase_date" id="purchase_date" value="" /> <br/>
    Sale date: <input type="date" name="sale_date" id="sale_date" value="" /> <br/>
    <input type="submit" value="Save" onclick="return submitForm()"/>
</form>