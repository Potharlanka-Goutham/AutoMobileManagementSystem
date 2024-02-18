<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Success</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Use 100% of the viewport height for vertical centering */
            background-color: #333; /* Set background color */
        }

        h1 {
            color: white;
        }
    </style>
</head>
<body>

<%@ include file="customernavbar.jsp" %>

<h1>${message}</h1>

</body>
</html>

</html>