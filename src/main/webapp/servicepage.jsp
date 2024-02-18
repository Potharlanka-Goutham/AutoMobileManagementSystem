<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Services</title>
   
    <link type="text/css" rel="stylesheet" href="css/cards.css">
    
    <style >
    
      body {
    background-image: url('images/serviceback.jpg'); /* Replace 'your-background-image.jpg' with your image file path */
    background-size: 100% auto; /* This will make the image cover the entire body */
    background-position: center; /* This centers the image */
    background-repeat: no-repeat; /* Prevents repeating the image */
  }
    
    </style>
   
</head>
<body>

<div class="card-container">

  <div class="card-hover">
    <div class="card-hover__content">
      <h3 class="card-hover__title">
        We provide <span>Vehicle</span> Diagnostics
      </h3>
      <p class="card-hover__text">Vehicle diagnostics refers to the process of using onboard sensors and computer systems to monitor and assess the health and performance of a vehicle.</p>
      <a href="<c:choose><c:when test="${not empty cid}">#</c:when><c:otherwise>userloginform</c:otherwise></c:choose>" class="card-hover__link">
        <span>Learn How</span>
        <svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>        
      </a>
    </div>
    <div class="card-hover__extra">
      <h4>Learn <span>now</span> and get <span>40%</span> discount!</h4>
    </div>
    <img src="images/vehicled.jpg" alt="">
    
  </div>
 <!-- ************************************************************************* --> 
  <div class="card-hover">
    <div class="card-hover__content">
      <h3 class="card-hover__title">
        Scheduled Maintenance of  <span>your</span> vehicle
      </h3>
      <p class="card-hover__text">Scheduled maintenance, also known as routine or preventive maintenance, is a planned and regular series of automotive services performed on a vehicle according to the manufacturer's recommendations.</p>
      <a href="<c:choose><c:when test="${not empty cid}">#</c:when><c:otherwise>userloginform</c:otherwise></c:choose>" class="card-hover__link">
        <span>Learn How</span>
        <svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>        
      </a>
    </div>
    <div class="card-hover__extra">
      <h4>Learn <span>now</span> and get <span>40%</span> discount!</h4>
    </div>
    <img src="images/repair.jpg" alt="car1">
  </div>
  
   <!-- ************************************************************************* --> 
  
  <div class="card-hover">
    <div class="card-hover__content">
      <h3 class="card-hover__title">
        Make your <span>vehicle</span>look clean
      </h3>
      <p class="card-hover__text">A car wash is a service where a vehicle is cleaned and, in some cases, detailed to remove dirt, dust, grime, and contaminants from both the interior and exterior.</p>
      <a href="<c:choose><c:when test="${not empty cid}">booking</c:when><c:otherwise>userloginform</c:otherwise></c:choose>" class="card-hover__link">
        <span>Book service</span>
        <svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>        
      </a>
    </div>
    <div class="card-hover__extra">
      <h4>Learn <span>now</span> and get <span>40%</span> discount!</h4>
    </div>
    <img src="images/carwash1.jpg" alt="car1">
  </div>
  
   <!-- ************************************************************************* --> 
  
  </div>

</body>
</html>
