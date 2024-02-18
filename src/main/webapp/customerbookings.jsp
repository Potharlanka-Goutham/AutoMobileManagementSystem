<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customers</title>
    <link rel="stylesheet" type="text/css" href="css/table.css">

    <style>
        body {
            background-image: url('images/list.jpg'); /* Replace 'your-background-image.jpg' with your image file path */
            background-size: 100% auto; /* This will make the image cover the entire body */
            background-position: center; /* This centers the image */
            background-repeat: no-repeat; /* Prevents repeating the image */
        }
    </style>
</head>
<body>

<%@ include file="customernavbar.jsp" %>

<br>
<br>
<br>

<section>
    <h1>Your Bookings</h1>
    <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup Location</th>
                    <th>Drop-off Location</th>
                    <th>Pickup Date</th>
                    <th>Drop-off Date</th>
                    
                </tr>
            </thead>
        </table>
    </div>
    <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
            <tbody>
                <c:if test="${not empty bookings}">
                    <c:forEach items="${bookings}" var="booking">
                        <tr>
                            <td><c:out value="${booking.id}" /></td>
                            <td><c:out value="${booking.pickupLocation}" /></td>
                            <td><c:out value="${booking.dropOffLocation}" /></td>
                            <td><c:out value="${booking.pickupDate}" /></td>
                            <td><c:out value="${booking.dropOffDate}" /></td>
                            <!-- Add more columns as needed -->
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty bookings}">
                    <tr>
                        <td colspan="3">No bookings found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</section>

</body>
</html>
