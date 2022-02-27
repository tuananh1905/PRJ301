/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $("#myTable").on('click', '#delete', function () {
        var currentRow = $(this).closest("tr");
        var col1 = currentRow.find("td:eq(0)").text();
        document.getElementById("IDdelete_span").innerHTML = col1;
        document.getElementById("IDdelete").setAttribute('value', col1);
    });
});
function submitDelete() {
    $.ajax({
        type: 'POST',
        url: $('#submitDelete').attr('action'),
        data: $('#submitDelete').serialize(),
        success: function (data) {
            $('#modalDelete').removeClass('active');
            $('#overlay').removeClass('active');
            submitSearchForm();
            $.getScript("../js/popupModal.js");
            $.getScript("../js/popupModalDelete.js");
        }
    });
    return false;
}