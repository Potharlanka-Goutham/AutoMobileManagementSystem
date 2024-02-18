<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cars</title>

    <style>
        /* Reset some default styles and provide a background color */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        /* Style the header navigation */
        header {
            background-color: #1a1a1a;
            color: white;
            padding: 10px 0;
        }

        nav ul {
            list-style: none;
            padding: 0;
            text-align: center;
        }

        nav ul li {
            display: inline;
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
        }

        /* Style the car details section */
        .car-details {
            display: flex;
            background-color: white;
            margin: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .car-details:hover {
            transform: scale(1.02);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .car-image {
            flex: 1;
            padding: 20px;
        }

        .car-image img {
            width: 100%;
            max-width: 400px;
            display: block;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .car-info {
            flex: 1;
            padding: 20px;
        }

        .car-info h1 {
            font-size: 36px;
            margin: 0;
            color: #1a1a1a;
            transition: color 0.3s;
        }

        .car-details:hover .car-info h1 {
            color: #007BFF;
        }

        .car-info p {
            font-size: 18px;
            margin: 5px 0;
        }

        .year {
            font-weight: bold;
        }

        .price {
            color: #ff5733; /* Stylish color for the price */
        }

        /* Style the footer */
        footer {
            text-align: center;
            padding: 10px;
            background-color: #1a1a1a;
            color: white;
        }
    </style>
</head>

<body>

<%@ include file="customernavbar.jsp" %>
<br>
<br>
<br>

<c:choose>
    <c:when test="${empty vehicles}">
        <div style="text-align: center;">
            <p style="color: #007BFF; font-size: 18px; animation: bounce 2s infinite;">
                You didn't add any cars. Please add cars.
            </p>
            <a href="vehicle" style="display: inline-block; padding: 10px 20px; background-color: #007BFF; color: #fff; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s;">
                Add a Car
            </a>
        </div>
    </c:when>
    <c:otherwise>
        <c:forEach items="${vehicles}" var="v">
            <section class="car-details">
                <div class="car-image">
                    <img src='displayvehicleimage?id=${v.id}' alt="No image uploaded">
                </div>
                <div class="car-info">
                    <h1>${v.model}</h1>
                    <p class="year">Year: ${v.year}</p>
                    <p>Make: ${v.make}</p>
                    <p>Model: ${v.model}</p>
                    <p>Color: ${v.color}</p>
                    <p>Mileage: ${v.mileage}</p>
                    <p>Vehicle Identification Number: ${v.vin}</p>
                    
                    <div style="text-align: center;">
        <a href="booktechnician?carid=${v.id}" style="display: inline-block; padding: 10px 20px; background-color: #007BFF; color: #fff; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s;">
            Book Car diagnostics 
        </a>
    </div>
                    
                </div>
            </section>
        </c:forEach>
    </c:otherwise>
</c:choose>

<c:if test="${!empty vehicles}">
    <div style="text-align: center;">
        <a href="vehicle" style="display: inline-block; padding: 10px 20px; background-color: #007BFF; color: #fff; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s;">
            Add another Car
        </a>
    </div>
</c:if>

</body>
</html>
