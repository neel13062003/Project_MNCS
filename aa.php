<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Sum Total for Column in jQuery </title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
	<script>
        $(document).ready(function() {
            $('table thead th').each(function(i) {
                calculateColumn(i);
            });
        });

        function calculateColumn(index) {
            var total = 0;
            $('table tr').each(function() {
                var value = parseInt($('td', this).eq(index).text());
                if (!isNaN(value)) {
                    total += value;
                }
            });
            $('table tfoot td').eq(index).text('Total: ' + total);
        }
    </script>
</head>
<body>
    <table id="" width="300" border="1">
        <thead>
            <tr>
                <th>Apple</th>
                <th>Orange</th>
                <th>Watermelon</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td>Total:</td>
                <td>Total:</td>
                <td>Total:</td>
            </tr>
        </tfoot>
    </table>
</body>
</html>