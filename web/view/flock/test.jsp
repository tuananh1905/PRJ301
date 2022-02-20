<%-- 
    Document   : test
    Created on : 19-02-2022, 16:47:42
    Author     : TuanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function submitForm(x) {
                if (x.id == 'b1') {
                    document.getElementById('hid1').value = 'button1action';
                } else if (x.id == 'b2') {
                    document.getElementById('hid1').value = 'button2action';
                } else {
                    document.getElementById('hid1').value = 'button3action';
                }
                alert(document.getElementById('hid1').value);
                document.forms[0].submit();
            }
        </script>
    </head>
    <body>
        <form method="GET">
            <tr> 
                <!--                <th><input type="button" id=b1 value="Submit" name="button" onClick='submitForm(this)'/></th> 
                                <th><input type="button" id=b2 value="Update" name="button" onClick='submitForm(this)'/></th> 
                                <th><input type="button" id=b3 value="Delete" name="button" onClick='submitForm(this)'/></th> -->
            <button type="submit" formaction="/Search">First action</button>
            <button type="submit" formaction="/Insert">Second action</button>
        </tr>
        <input type='hidden' id='hid1'  name='hid1'>
    </form>
</body>
</html>
