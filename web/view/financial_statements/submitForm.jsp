<%-- 
    Document   : submitForm
    Created on : 03-03-2022, 14:36:11
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<form id="submitForm" action="Insert" method="POST">
    <span id="id_span" hidden>ID: <span id="FSID_span"></span><input type="hidden" name="FSID" id="FSID" value=""/> <br/></span>
    Revenue: <input type="checkbox" value="Revenue" name="IsRevenue" /> <br/>
    Date: <input type="date" name="date"/> <br/>
    Select Flock: <select name="isAvai" id="searchFlock" onchange="submitSearchFlock();">
        <option value="-1">-----All FLOCK-----</option>
        <option value="0">Sold</option>
        <option value="1">Available</option>
    </select>
    <select id="flockField" name="FID"></select> </br>

    Product: <select name="prdid" id="searchPrice" onchange="submitSearchPrice()">
        <option value="0">---All of product---</option>
        <option value="1">Eggs</option>
        <option value="2">Sell Cattle</option>
        <option value="3">Foodder</option>
        <option value="4">Medicine</option>
        <option value="5">Purchase Breeds</option>
        <option value="6">Other</option>
    </select>
    <select id="priceField" name="PriceID"></select> </br>
    Quantily: <input type="number" name="quantily"/> <br/>
    Total: <span id="total"></span> <input type="number" name="total" hidden> <br/>
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
                <!--                <form id="submitForm" action="Insert" method="POST">-->
                <!--                <div>
                                    <span id="id_span" hidden>ID: <span id="FSID_span"></span><input type="hidden" name="FSID" id="FSID" value=""/> <br/></span>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch" id="isRevenue" name="isRevenue" value="True">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Is Revenue</label>
                                    </div>
                                                        Revenue: <input class="form-check-input" type="checkbox" role="switch" value="Revenue" name="IsRevenue" /> <br/>
                                    Date: <input type="date" id="date" name="date"/> <br/>
                
                                    <div class="input-group">
                                        <span class="input-group-text">Select Flock: </span>
                                        <select class="form-select"  aria-label="Default select example" name="isAvai" id="searchFlock" onchange="submitSearchFlock();">
                                            <option value="-1">-----All FLOCK-----</option>
                                            <option value="0">Sold</option>
                                            <option value="1">Available</option>
                                        </select>
                                        <select class="form-select" id="flockField" name="FID"></select> </br>
                                    </div>
                
                                    Price: <select name="prdid" id="searchPrice" onchange="submitSearchPrice()">
                                        <option value="0">---All of product---</option>
                                        <option value="1">Eggs</option>
                                        <option value="2">Sell Cattle</option>
                                        <option value="3">Foodder</option>
                                        <option value="4">Medicine</option>
                                        <option value="5">Purchase Breeds</option>
                                        <option value="6">Other</option>
                                    </select>
                                    <select id="priceField" name="PriceID"></select> </br>
                                    Quantily: <input type="number" id="quantily" name="quantily"/> <br/>
                                    Total: <span id="total"></span> <input type="number" name="total" hidden> <br/>
                                    <input type="submit" value="Save" onclick="return submitForm()"/>
                                </div>-->
                <!--                </form>-->
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
            </div>
            <div class="modal-footer form-group">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="save" name="save" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>