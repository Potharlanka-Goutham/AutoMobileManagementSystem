<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .card {
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            max-width: 300px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
        }

        .card img {
            max-width: 100%;
            height: auto;
        }

        .description {
            padding: 10px;
            color: white; /* Set text color to white */
        }
    </style>
</head>
<body>
    <%@ include file="technicianNavbar.jsp" %>
    
    <br>

    <div class="card">
        <img src="displaytechnicianprofilepic?id=${sessionScope.tid}" alt="Technician Image">
        <div class="description">
            <h3 style="color: white;">Technician Name:  ${tname}</h3>
            <p style="color: white;">Technician Description or Details   ${sessionScope.tid}</p>
        </div>
    </div>
</body>
</html>
