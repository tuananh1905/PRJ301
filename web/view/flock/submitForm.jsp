<%-- 
    Document   : insertForm
    Created on : 21-02-2022, 20:12:43
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<form method="POST" action="Insert" id="submitForm">
    <span id="id_span" hidden>ID: <span id="FID_span"></span><input type="hidden" name="FID" id="FID" value=""/> <br/></span>
    Name: <input type="name" name="name" id="name" value="" /> <br/>
    Purchase date: <input type="date" name="purchase_date" id="purchase_date" value="" /> <br/>
    Sale date: <input type="date" name="sale_date" id="sale_date" value="" /> <br/>
    <input type="submit" value="Save" onclick="return submitForm()"/>
</form>-->

<div class="modal fade" id="ModalPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addFlock">
                    <input type="hidden"  name="FID" id="FID" value=""/>
                    <div class="input-group">
                        <span class="input-group-text">Name </span>
                        <!--                    <select class="form-select"  aria-label="Default select example" name="prdid" id="prdid_s"  onchange="submitSearchFlock();">-->
                        <input class="form-control" type="name" name="name" id="name" value="" />
                    </div>
                    <span id="error_name" class="text-danger"></span>
                    </br>

                    <div class="input-group">
                        <span class="input-group-text">Purchase date </span>
                        <input class="form-control" type="date" name="purchase_date" id="purchase_date" value="" />
                    </div>
                    <span id="error_date" class="text-danger"></span>
                    </br>

                    <div class="input-group">
                        <span class="input-group-text">Sale date </span>
                        <input class="form-control" type="date" name="sale_date" id="sale_date" value="" /> <br/>
                    </div>

<!--                    <div class="input-group">
                        <span class="input-group-text">Decrepsion</span>
                        <input type="text" id="decrepsion" name="decrepsion"/>
                    </div>-->
                </form>
            </div>
            <div class="modal-footer form-group">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <input type="hidden" name="row_id" id="hidden_row_id" />
                <input type="submit" form="addFlock" id="save" name="save" class="btn btn-primary" value="Save"></input>
            </div>
        </div>
    </div>
</div>