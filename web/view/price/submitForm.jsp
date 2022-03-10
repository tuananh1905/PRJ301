<%-- 
    Document   : submitForm
    Created on : 25-02-2022, 00:35:31
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="ModalPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addPrice">
                    <input type="hidden" name="pid" id="pid_s" value=""/>
                    <div class="input-group">
                        <span class="input-group-text">Product: </span>
                        <!--                    <select class="form-select"  aria-label="Default select example" name="prdid" id="prdid_s"  onchange="submitSearchFlock();">-->
                        <select class="form-select"  aria-label="Default select example" name="prdid" id="prdid_s">
                            <option value="0">---All of product---</option>
                            <option value="1">Eggs</option>
                            <option value="2">Sell Cattle</option>
                            <option value="3">Fodder</option>
                            <option value="4">Medicine</option>
                            <option value="5">Purchase Breeds</option>
                            <option value="6">Other</option>
                        </select>
                    </div>
                    </br>

                    <div class="input-group">
                        <span class="input-group-text">Date </span>
                        <input type="date" name="date" id="date_s" value="<%=new java.sql.Date(java.util.Calendar.getInstance().getTime().getTime())%>"/>
                    </div>
                    </br>

                    <div class="input-group">
                        <span class="input-group-text">Price </span>
                        <input type="number" name="price" id="price_s"/>
                    </div>
                    <span id="error_quantily" class="text-danger"></span>
                    </br>

                    <div class="input-group">
                        <span class="input-group-text">Decrepsion</span>
                        <input type="text" id="decrepsion" name="decrepsion"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer form-group">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <input type="hidden" name="row_id" id="hidden_row_id" />
                <input type="submit" form="addPrice" id="save" name="save" class="btn btn-primary" value="Save"></input>
            </div>
        </div>
    </div>
</div>