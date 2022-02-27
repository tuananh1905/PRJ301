/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $("#myTable").on('click', '#edit', function () {
        var currentRow = $(this).closest("tr");
        var col1 = currentRow.find("td:eq(0)").text();
        var col2 = currentRow.find("td:eq(1)").text();
        var col3 = currentRow.find("td:eq(2)").text();
        var col4 = currentRow.find("td:eq(3)").text();
        var col5 = currentRow.find("td:eq(4)").text();

        document.getElementById("pid_span").innerHTML = col1;
        document.getElementById("pid_s").setAttribute('value', col1);
        
        var productList = document.getElementById("prdid_s");
        for (var i = 0; i < productList.options.length; i++) {
            if (productList.options[i].text === col2) {
//                window.alert(productList.options[i].text);
//                productList.options[i].selected = true;
//                productList.options[i].setAttribute("selected", "selected");
//                productList.options[i].defaultSelected = true;
//                productList.value = i;
                $('#prdid_s').val(i.toString()).change();
            }
        };

        document.getElementById("date_s").setAttribute('value', col3);
        document.getElementById("price_s").setAttribute('value', col4);
        document.getElementById("decrepsion_s").setAttribute('value', col5);

        document.getElementById("id_span").removeAttribute('hidden');
        document.getElementById("submitForm").setAttribute('action', 'Edit');
    });

    $("#insert").on('click', function () {
        document.getElementById("id_span").setAttribute('hidden', 'true');
        document.getElementById("submitForm").setAttribute('action', 'Insert');

        document.getElementById("FID").setAttribute('value', '');
        document.getElementById("name").setAttribute('value', '');
        document.getElementById("purchase_date").setAttribute('value', '');
        document.getElementById("sale_date").setAttribute('value', '');
    });
});