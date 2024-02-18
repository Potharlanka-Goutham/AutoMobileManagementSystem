<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Bookings with Customer Details</title>
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>

  body {
    background-image: url('images/list.jpg'); /* Replace 'your-background-image.jpg' with your image file path */
    background-size: 100% auto; /* This will make the image cover the entire body */
    background-position: center; /* This centers the image */
    background-repeat: no-repeat; /* Prevents repeating the image */
  }
  
  .search-container {
    width: 100%;
    text-align: center; /* Center the input horizontally */
    margin-bottom: 20px; /* Add space below the search input */
}

#searchInput {
    width: 50%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: border-color 0.2s;
}

#searchInput:focus {
    outline: none;
    border-color: #007BFF; /* Change to your desired focus color */
}
  
  
</style>

<body>

<%@ include file="adminNavbar.jsp" %>
<br>
<section>
    <h1>View All Bookings with Customer Details</h1>
    
    
     <div style="text-align: center;">
 
<div class="search-container">
    <input type="text" name="search" id="searchInput" placeholder="Search..." onkeyup="searchBookings()">
    <i class="fa fa-search" style="font-size:32px;color:red"></i>
    

</div>
    
    
    <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup Location</th>
                    <th>Drop-Off Location</th>
                    <th>Customer Name</th>
                    <th>Customer Phonenumber</th>
                    <th>Booking Time</th>
                    
                    <!-- Add more columns for other booking details -->
                </tr>
            </thead>
        </table>
    </div>
    <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
            <tbody>
                <c:forEach items="${bookingDetailsList}" var="bookingDetails">
                    <tr>
                        <td><c:out value="${bookingDetails.booking.id}" /></td>
                        <td><c:out value="${bookingDetails.booking.pickupLocation}" /></td>
                        <td><c:out value="${bookingDetails.booking.dropOffLocation}" /></td>
                        <td><c:out value="${bookingDetails.customer.fullname}" /></td>
                        <td><c:out value="${bookingDetails.customer.phonenumber}" /></td>
                        <td><c:out value="${bookingDetails.booking.timestamp}" /></td>
                        
                        <!-- Add more cells for other booking details -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>

<script>
    function searchBookings() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementsByClassName("tbl-content")[0];
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[3]; // Change index to match the column you want to search (e.g., 2 for Pickup Location)
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>


</body>
</html>
