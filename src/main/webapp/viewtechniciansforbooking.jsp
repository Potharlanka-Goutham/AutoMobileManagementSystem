<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            background: rgb(0, 212, 255);
            background: linear-gradient(45deg, rgba(0, 212, 255, 1) 0%, rgba(11, 3, 45, 1) 100%);
            background-image: url(https://images.unsplash.com/photo-1619204715997-1367fe5812f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1889&q=80);
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            width: 300px; /* Set a fixed width for the cards */
            backdrop-filter: blur(16px) saturate(180%);
            -webkit-backdrop-filter: blur(16px) saturate(180%);
            background-color: rgba(17, 25, 40, 0.25);
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.125);
            padding: 10px;
            filter: drop-shadow(0 30px 10px rgba(0, 0, 0, 0.125));
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 400px; /* Set a fixed height for the cards */
            margin: 10px; /* Add margin to create a gap between cards */
        }

        .wrapper {
            width: 100%;
            height: 100%;
        }

        .banner-image { 
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.255);
        }

        h1 {
            font-family: 'Righteous', sans-serif;
            color: rgba(255, 255, 255, 0.98);
            text-transform: uppercase;
            font-size: 1.6rem; /* Adjust the font size as needed */
            overflow: hidden;
            text-overflow: ellipsis; /* Add ellipsis for long text */
            white-space: nowrap;
        }

        p {
            color: #fff;
            font-family: 'Lato', sans-serif;
            text-align: center;
            font-size: 0.8rem;
            line-height: 150%;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .button-wrapper {
            margin-top: 18px;
        }

        .btn {
            border: none;
            padding: 12px 24px;
            border-radius: 24px;
            font-size: 12px;
            font-size: 0.8rem;
            letter-spacing: 2px;
            cursor: pointer;
        }

        .btn + .btn {
            margin-left: 10px;
        }

        .outline {
            background: transparent;
            color: rgba(0, 212, 255, 0.9);
            border: 1px solid rgba(0, 212, 255, 0.6);
            transition: all .3s ease;
        }

        .outline:hover {
            transform: scale(1.125);
            color: rgba(255, 255, 255, 0.9);
            border-color: rgba(255, 255, 255, 0.9);
            transition: all .3s ease;
        }

        .fill {
            background: rgba(0, 212, 255, 0.9);
            color: rgba(255, 255, 255, 0.95);
            filter: drop-shadow(0);
            font-weight: bold;
            transition: all .3s ease;
        }

        .fill:hover {
            transform: scale(1.125);
            border-color: rgba(255, 255, 255, 0.9);
            filter: drop-shadow(0 10px 5px rgba(0, 0, 0, 0.125));
            transition: all .3s ease;
        }
    </style>
</head>
<body>

<%@ include file="customernavbar.jsp" %>

<c:forEach items="${technicians}" var="technician">
   <div class="container">
    <div class="wrapper">
        <div class="banner-image">
            <img src="displaytechnicianprofilepic?id=${technician.id}" alt="Banner Image Description" width="200" height="200">
        </div>
        <h1><c:out value="${technician.firstName} ${technician.lastName}" /></h1>
        <p><c:out value="${technician.specializations}" /></p>
    </div>
    <div class="button-wrapper">
    <form action="<c:url value='/booktechnicians' />" method="GET">
        <input type="hidden" name="technicianId" value="${technician.id}" />
        <input type="hidden" name="vehicleId" value="${carid}" />
        <button class="btn fill" type="submit">Book Technician</button>
    </form>
</div>

    </div>
</c:forEach>
</body>
</html>
