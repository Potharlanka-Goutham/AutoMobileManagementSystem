
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
    <title>Assigned Vehicles</title>
</head>
<body>
    <h1>Assigned Vehicles for Technician: ${technician.firstName} ${technician.lastName}</h1>
    <table>
        <tr>
            <th>Vehicle ID</th>
            <th>Vehicle Name</th>
            <th>Other Vehicle Details</th>
        </tr>
        <c:forEach items="${technician.assignedVehicles}" var="vehicle">
            <tr>
                <td>${vehicle.id}</td>
                <td>${vehicle.name}</td>
                <td>${vehicle.otherDetails}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
