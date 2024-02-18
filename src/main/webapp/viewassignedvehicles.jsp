<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assigned Vehicles</title>
    
    
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007BFF;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #cce0ff;
    }
</style>
    
    
    
</head>
<body>

<%@ include file="adminNavbar.jsp" %>

    <h1>Assigned Vehicles</h1>
    
    <table>
        <tr>
            <th>Technician ID</th>
            <th>Technician Name</th>
            <th>Assigned Vehicle</th>
            <th>Customer Name</th>
            
        </tr>
        <c:forEach items="${technicians}" var="technician">
            <tr>
                <td>${technician.technician.id}</td>
                <td>${technician.technician.firstName} ${technician.technician.lastName}</td>
                <td>${technician.vehicle.model}</td>
                <td>${technician.vehicle.customer.fullname}</td>
               
                
            </tr>
        </c:forEach>
    </table>
</body>
</html>
