<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AMS</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
        /* Define variables */
        :root {
            --main-color: #4eb6ac;
        }

        /* Global styling */
        * {
            box-sizing: border-box;
        }

        /* Body and demo section */
        body {
            height: 100%;
            width: 100%;
            background: black;
            font-family: 'PT Sans', sans-serif;
        }

        .demo {
            width: 100%;
            height: 100%;
        }

        /* .penName */
        .penName {
            text-align: center;
            font-size: 36px;
        }

        /* .mainCard */
        .mainCard {
            text-align: center;
            display: block;
            margin: 60px auto;
            background-color: white;
            box-shadow: 0 5px 40px rgba(0, 0, 0, 0.2);
            width: 90%;
            animation-name: mainCard;
            animation-duration: 1s;
            animation-delay: 0s;
            animation-fill-mode: both;
        }

        @keyframes mainCard {
            0% {
                transform: scale(0);
            }
        }

        /* .mainCardHeader */
        .mainCardHeader {
            background-color: aquamarine;
            height: 100px;
            width: 100%;
            animation-name: mainCardHeader;
            animation-duration: 0.4s;
            animation-delay: 0.5s;
            animation-fill-mode: both;
        }

        @keyframes mainCardHeader {
            0% {
                transform: scaleY(0);
            }
        }

        /* .mainCardContent */
        .mainCardContent {
            margin: 0 auto;
            text-align: center;
            position: relative;
            top: -50px;
            height: 100%;
            width: 90%;
        }

        /* .miniCard */
        .miniCard {
            display: inline-block;
            width: 250px;
            height: 350px;
            margin: 0 20px 20px 0;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            animation-name: miniCard;
            animation-duration: 1s;
            animation-delay: 0.8s;
            animation-fill-mode: both;
        }

        @keyframes miniCard {
            0% {
                transform: scale(0);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }

        .miniCard img {
            width: 100%;
            height: auto;
            max-height: 200px;
            overflow: hidden;
        }

        .miniCard .description {
            max-height: 100px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .miniCard a {
            display: block;
            text-align: center;
            background-color: #4eb6ac;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .miniCard a:hover {
            background-color: #37a99d;
        }

        .search-container {
            width: 100%;
            text-align: center;
            margin-bottom: 20px;
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
            border-color: #007BFF;
        }
    </style>
</head>
<body>

<c:if test="${not empty sessionScope.cid}">
    <%@ include file="customernavbar.jsp" %>
</c:if>

<div class="demo">
   
   <br>
   <br>

    <div style="text-align: center;">
        <div class="search-container">
            <!-- Update the search input field -->
            <input type="text" id="searchInput" placeholder="Search by Product Name...">
            <i class="fa fa-search" style="font-size:32px;color:red"></i>
        </div>
    </div>

    <div class="mainCard">
        <div class="mainCardHeader"></div>
        <div class="mainCardContent">
            <c:forEach items="${productlist}" var="p">
                <!-- Update the miniCard to include a data-name attribute -->
               <div class="miniCard" data-name="<c:out value='${p.name}'></c:out>">

                    <img src='displayprdouctimage1?id=${p.id}' alt="Product Image">
                    <p><c:out value="${p.name}"></c:out></p>
                    <p class="description"><c:out value="${p.description}"></c:out></p>
                    <p>$<c:out value="${p.cost}"></c:out></p>
                    <a href="<c:url value="viewproductbyid?id=${p.id}"></c:url>">View Product</a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    function searchProducts() {
        var input, filter, cards, card, productName, i;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        cards = document.getElementsByClassName("miniCard");

        for (i = 0; i < cards.length; i++) {
            card = cards[i];
            productName = card.getAttribute("data-name").toUpperCase();

            // Check if the product name contains the search filter
            if (productName.indexOf(filter) > -1) {
                card.style.display = "";
            } else {
                card.style.display = "none";
            }
        }
    }

    // Attach the searchProducts function to the input field
    document.getElementById("searchInput").addEventListener("keyup", searchProducts);
</script>
</body>
</html>
