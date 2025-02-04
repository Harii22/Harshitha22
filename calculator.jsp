<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basic Calculator</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function appendValue(value) {
            document.getElementById("display").value += value;
        }

        function clearDisplay() {
            document.getElementById("display").value = "";
        }

        function calculateResult() {
            try {
                let result = eval(document.getElementById("display").value);
                if (!isFinite(result)) throw "Error";
                document.getElementById("display").value = result;
            } catch (e) {
                document.getElementById("display").value = "Error";
            }
        }
    </script>
</head>
<body>
    <div class="calculator">
        <input type="text" id="display" readonly>
        <div class="buttons">
            <% String[] buttons = {"7","8","9","/","4","5","6","*","1","2","3","-","0",".","=","+"}; 
               for(String btn : buttons) { %>
                <button onclick="<%= btn.equals("=") ? "calculateResult()" : "appendValue('" + btn + "')" %>"><%= btn %></button>
            <% } %>
            <button class="clear" onclick="clearDisplay()">C</button>
        </div>
    </div>
</body>
</html>
