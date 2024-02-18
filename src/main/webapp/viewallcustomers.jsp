
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customers</title>
    
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
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
    

</head>
<body>

<%@ include file="adminNavbar.jsp" %>

<br>

    <section>
        
        <h1>View All Customers</h1>
        
        <div style="text-align: center;">
 
<div class="search-container">
    <input type="text" name="search" id="searchInput" placeholder="Search using full name.........!!!!!" onkeyup="searchCustomers()">
    <i class="fa fa-search" style="font-size:32px;color:red"></i>

</div>

</div>
        
        
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User photo</th>
                        <th>FullName</th>
                        <th>Gender</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>   </th>
                        <th>Contact No</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                 <c:forEach items="${cdata}" var="c">
                    <tr>
                        <td><c:out value="${c.id}" /></td>
                        <td><img src='displayprofilepic?id=${c.id}' width="60%" height="60%"></td>
                         
                        <td><c:out value="${c.fullname}" /></td>
                         <td><c:out value="${c.gender}" /></td>
                         <td><c:out value="${c.username}" /></td>
                         <td><c:out value="${c.email}" /></td>
                         <td>                               </td>
                         <td><c:out value="${c.phonenumber}" /></td>
                    </tr>
                    </c:forEach>
                    <!-- Add more data rows as needed -->
                </tbody>
            </table>
        </div>
    </section>
    
    
    <script>
    function searchCustomers() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementsByClassName("tbl-content")[0]; // Use getElementsByClassName to select the table content
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2]; // Change index to match the column you want to search (e.g., 2 for FullName)
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
