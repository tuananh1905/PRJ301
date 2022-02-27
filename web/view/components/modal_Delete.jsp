<%-- 
    Document   : modal_Delete
    Created on : 26-02-2022, 14:28:01
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal" id="modalDelete">
    <div class="modal-header">
        <div class="title">Delete confirmation</div>
        <button data-close-button class="close-button">&times;</button>
    </div>
    <div class="modal-body">
        Are you sure you want to delete this?
        <form action="Delete" method="POST" id="submitDelete">
            ID <span id="IDdelete_span"></span>
            <input name="ID" id="IDdelete" value="" hidden/> <br/>
            <input type="submit" value="Yes" onclick="return submitDelete()"/><button data-close-button class="close-button">No</button>
        </form>
    </div>
</div>