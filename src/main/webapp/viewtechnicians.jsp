<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
    .alignRow {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
    }

    .imageColumn {
        flex-basis: calc(33.33% - 20px); /* Adjust the width as needed */
        margin: 10px;
    }

    .card {
        width: 100%;
        max-width: 18rem;
        border: 1px solid #ccc; /* Add a 1px solid border with a color of your choice */
        border-radius: 5px; /* Add rounded corners */
    }
</style>


</head>
<body>
    <div class="alignRow">
        <c:forEach items="${technicians}" var="technician">
            <div class="imageColumn">
                <div class="card">
                    <img src='<c:out value="" />' class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${technician.firstName}" /></h5>
                        <div style="background: #00FF00; width: 20px; height: 20px; margin-left: 10px; border-radius: 50%;"></div>
                        <p class="card-text"><c:out value="${technician.specializations}" /></p>
                        <a href="#" class="btn btn-primary">click here</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
