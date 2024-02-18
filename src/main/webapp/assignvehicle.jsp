<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Assign Vehicle to Technician</title>
    
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
    }

    form {
        width: 50%;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }

    select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        display: block;
        width: 100%;
        background-color: #007BFF;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    p {
        text-align: center;
        color: #007BFF;
    }
</style>

    
    
</head>
<body>

<%@ include file="adminNavbar.jsp" %>

    <h2>Assign Vehicle to Technician</h2>
    <form action="addassignedvehicle" method="post">
        <select name="technicianId">
            <c:forEach items="${technicians}" var="technician">
                <option value="${technician.id}">${technician.firstName} ${technician.lastName}</option>
            </c:forEach>
        </select>
        <select name="vehicleId">
            <c:forEach items="${vehicles}" var="vehicle">
                <option value="${vehicle.id}">${vehicle.make} ${vehicle.model} - ${vehicle.customer.fullname} </option>
            </c:forEach>
        </select>
        <input type="submit" value="Assign Vehicle">
    </form>
    <p>${result}</p>
</body>
</html>
