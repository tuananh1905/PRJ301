$(document).ready(function () {
    $("#myTable").on('click', '#edit', function () {
        var currentRow = $(this).closest("tr");
        var col1 = currentRow.find("td:eq(0)").text();
        var col2 = currentRow.find("td:eq(1)").text();
        var col3 = currentRow.find("td:eq(2)").text();
        var col4 = currentRow.find("td:eq(3)").text();

        document.getElementById("FID_span").innerHTML = col1;
        document.getElementById("FID").setAttribute('value', col1);
        document.getElementById("name").setAttribute('value', col2);
        document.getElementById("purchase_date").setAttribute('value', col3);
        document.getElementById("sale_date").setAttribute('value', col4);

        document.getElementById("id_span").removeAttribute('hidden');
        document.getElementById("submitForm").setAttribute('action', 'Edit');
    });
//                $("#myTable").on('click', '#delete', function () {
//                    var currentRow = $(this).closest("tr");
//                    var col1 = currentRow.find("td:eq(0)").text();
//                    document.getElementById("FIDdelete_span").innerHTML = col1;
//                    document.getElementById("FIDdelete").setAttribute('value', col1);
//                });
    $("#insert").on('click', function () {
        document.getElementById("id_span").setAttribute('hidden', 'true');
        document.getElementById("submitForm").setAttribute('action', 'Insert');

        document.getElementById("FID").setAttribute('value', '');
        document.getElementById("name").setAttribute('value', '');
        document.getElementById("purchase_date").setAttribute('value', '');
        document.getElementById("sale_date").setAttribute('value', '');
    });

});