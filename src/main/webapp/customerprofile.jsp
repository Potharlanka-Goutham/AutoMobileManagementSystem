<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        * {
    margin: 0;
    padding: 0
}

body {
    background-image: url('images/userbackground.jpg'); /* Replace 'your-background-image.jpg' with your image file path */
    background-size: 100% auto; /* This will make the image cover the entire body */
    background-position: center; /* This centers the image */
    background-repeat: no-repeat; /* Prevents repeating the image */
}

.card {
    width: 350px;
    background-color: #efefef;
    border: none;
    cursor: pointer;
    transition: all 0.5s;
}

.image img {
    transition: all 0.5s
}

.card:hover .image img {
    transform: scale(1.5)
}

.btn {
    height: 140px;
    width: 140px;
    border-radius: 50%
}

.name {
    font-size: 22px;
    font-weight: bold
}

.idd {
    font-size: 14px;
    font-weight: 600
}

.idd1 {
    font-size: 12px
}

.number {
    font-size: 22px;
    font-weight: bold
}

.follow {
    font-size: 12px;
    font-weight: 500;
    color: #444444
}

.btn1 {
    height: 40px;
    width: 150px;
    border: none;
    background-color: #000;
    color: #aeaeae;
    font-size: 15px
}

.text span {
    font-size: 13px;
    color: #545454;
    font-weight: 500
}

.icons i {
    font-size: 19px
}

hr .new1 {
    border: 1px solid
}

.join {
    font-size: 14px;
    color: #a0a0a0;
    font-weight: bold
}

.date {
    background-color: #ccc
}
    </style>
</head>
<body>

<%@ include file="customernavbar.jsp" %>

<br>
<br>
<br>

<span class="blink">

<h3 align=center style="color:red">${message} </h3>

</span>

    <div class="container mt-4 mb-4" style="align-content: center">
        <div class="card  p-4 mx-auto">
            <div class="image text-center">
                <button class="btn btn-secondary">
                
 <c:choose>
    <c:when test="${not empty c.profilepic}">
        <img src='displayprofilepic?id=${c.id}' width="100%" height="100%">
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${c.gender == 'Male'}">
                <img src="images/dpboy.png" height="100" width="100" />
            </c:when>
            <c:when test="${c.gender == 'Female'}">
                <img src="images/dpgirl.png" height="100" width="100" />
            </c:when>
        </c:choose>
    </c:otherwise>
</c:choose>

                </button>
                <h3 class="name mt-3">${c.fullname}</h3>
                <p class="idd">@${c.username}</p>
                
                
                <div class="text mt-2">
                    <p> <b>Email:  </b>  ${c.email}</p>
                    <p><b>Contact number:  </b>${c.phonenumber}</p>
                </div>
                <div class="d-flex justify-content-center mt-3">
    <a href="/updateprofile" class="btn1 btn-dark">Edit Profile</a>
                    </div>
                <div class="gap-3 mt-3 icons d-flex flex-row justify-content-center align-items-center">
                    <span><i class="fa fa-twitter"></i></span>
                    <span><i class="fa fa-facebook-f"></i></span>
                    <span><i class="fa fa-instagram"></i></span>
                    <span><i class="fa fa-linkedin"></i></span>
                </div>
                <div class="px-2 rounded mt-4 date text-center">
                    <p class="join">Joined May, 2021</p>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
</body>
</html>
