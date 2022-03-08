<%-- 
    Document   : submitForm
    Created on : 03-03-2022, 14:36:11
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
                <div class="form-group form-check form-switch">
                    <label>Is Revenue</label>
                    <input class="form-check-input" type="checkbox" role="switch" id="isRevenue" name="isRevenue">
                </div>
                </br>

                <div class="input-group">
                    <span class="input-group-text">Date </span>
                    <input type="date" name="date" id="date"/>
                </div>
                </br>

                <div class="input-group">
                    <span class="input-group-text">Select Flock </span>
                    <select class="form-select"  aria-label="Default select example" name="isAvai" id="searchFlock" onchange="submitSearchFlock();">
                        <option value="-1">-----All FLOCK-----</option>
                        <option value="0">Sold</option>
                        <option value="1">Available</option>
                    </select>
                    <select class="form-select" id="flockField" name="FID"></select>
                </div>
                </br>

                <div class="input-group">
                    <span class="input-group-text">Price </span>
                    <select name="prdid" class="form-select"  aria-label="Default select example" id="searchPrice" onchange="submitSearchPrice()">
                        <option value="0">---All of product---</option>
                        <option value="1">Eggs</option>
                        <option value="2">Sell Cattle</option>
                        <option value="3">Foodder</option>
                        <option value="4">Medicine</option>
                        <option value="5">Purchase Breeds</option>
                        <option value="6">Other</option>
                    </select>
                    <select class="form-select" id="priceField" name="PriceID"></select>
                </div>
                </br>
                
                <div class="input-group">
                    <span class="input-group-text">Quantily </span>
                    <input type="number" id="quantily" name="quantily"/>
                </div>
                <span id="error_quantily" class="text-danger"></span>
                </br>
                
                <div class="input-group">
                    <span class="input-group-text">Decrepsion</span>
                    <input type="text" id="decrepsion" name="decrepsion"/>
                </div>
            </div>
            <div class="modal-footer form-group">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <input type="hidden" name="row_id" id="hidden_row_id" />
                <button type="button" id="save" name="save" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>