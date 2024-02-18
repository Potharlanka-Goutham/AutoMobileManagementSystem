<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assigned Vehicles</title>
    <style>
        .vehicle-card {
            display: inline-block; /* Display cards inline */
            vertical-align: top; /* Align to the top */
            width: calc(33.33% - 20px); /* Adjust card width as needed */
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
            background-color: #444; /* Card background color */
            padding: 10px;
        }

        .vehicle-card img {
            max-width: 100%;
            height: auto;
        }

        .vehicle-description {
            padding: 10px;
        }

        h3, p {
            color: white;
        }
    </style>
</head>
<body>

<%@ include file="technicianNavbar.jsp" %>
    
    <br>

    <h2>Assigned Vehicles</h2>
    
   
        <c:forEach items="${vehicles}" var="vehicle">
            <div class="vehicle-card">
                <img src="displayvehicleimage?id=${vehicle.id}" alt="Vehicle Image">
                <div class="vehicle-description">
                    <h3 style="color: white;">Make: ${vehicle.make}</h3>
                    <p style="color: white;">Model: ${vehicle.model}</p>
                    <p style="color: white;">Year: ${vehicle.year}</p>
                    <p style="color: white;">VIN: ${vehicle.vin}</p>
                    <p style="color: white;">Color: ${vehicle.color}</p>
                    <p style="color: white;">Mileage: ${vehicle.mileage}</p>
                </div>
            </div>
        </c:forEach>
    
    
</body>
</html>
