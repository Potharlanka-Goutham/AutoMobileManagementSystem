<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

 
<!DOCTYPE html>
<html>
<head>

  <style>
 @import url(https://fonts.googleapis.com/css?family=Raleway:400,300,500,700);

* {
  box-sizing: border-box;
}

body {
  background: #aedaa6;
  font-family: "Raleway";
  background-image: url("images/reg.jpg");
  background-size: cover; 
}

.card {
  width: 750px;
  position: absolute;
  background: white;
  margin: 0 auto;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  transition: all 0.3s;
}

.card:hover {
  box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.card nav {
  width: 100%;
  color: #727272;
  text-transform: uppercase;
  padding: 20px;
  border-bottom: 2px solid #efefef;
  font-size: 12px;
}

.card nav .heart {
  height: 24px;
  width: 24px;
  float: right;
  margin-top: -3px;
  transition: all 0.3s ease;
  cursor: pointer;
}

.card nav .heart:hover {
  fill: red;
}

.card nav .arrow {
  float: left;
  height: 15px;
  width: 15px;
  margin-right: 10px;
}

.card .photo {
  padding: 30px;
  width: 45%;
  text-align: center;
  float: left;
}

.card .photo img {
  max-height: 540px;
}

.card .description {
  padding: 30px;
  float: left;
  width: 55%;
  border-left: 2px solid #efefef;
}

.card .description h1 {
  color: #515151;
  font-weight: 300;
  padding-top: 15px;
  margin: 0;
  font-size: 30px;
  font-weight: 300;
}

.card .description h2 {
  color: #515151;
  margin: 0;
  text-transform: uppercase;
  font-weight: 500;
}

.card .description h4 {
  margin: 0;
  color: #727272;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 12px;
}

.card .description p {
  font-size: 12px;
  line-height: 20px;
  color: #727272;
  padding: 20px 0;
  margin: 0;
}

.card .description button {
  outline: 0;
  border: 0;
  background: none;
  border: 1px solid #d9d9d9;
  padding: 8px 0px;
  margin-bottom: 30px;
  color: #515151;
  text-transform: uppercase;
  width: 125px;
  font-family: inherit;
  margin-right: 5px;
  transition: all 0.3s ease;
  font-weight: 500;
}

.card .description button:hover {
  border: 1px solid #aedaa6;
  color: #aedaa6;
  cursor: pointer;
}

.card a {
            display: block;
            text-align: center;
            background-color: #4eb6ac; /* Change to your desired button color */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .card a:hover {
            background-color: #37a99d; /* Change to the hover color */
        }




  </style>
</head>
<body>

<body>



 <div class="card">
  <nav>
  <span id="backToPlants">
    <svg class="arrow" version="1.1" viewBox="0 0 512 512" width="512px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><polygon points="352,115.4 331.3,96 160,256 331.3,416 352,396.7 201.5,256 " stroke="#727272"/></svg>
    Back to View all Products</span>
    
  </nav>
  <div class="photo">
    <img src='displayprdouctimage1?id=${product.id}' width="100%" height="100%">
  </div>
  <div class="description">
    <h2>${product.name}</h2>
    <h4>${product.companyname}</h4>
    <h1>$ ${product.cost}</h1>
    <p>${product.description}</p>
    <a href="<c:url value="updateproduct?id=${product.id}"></c:url>">Edit Product Details</a>
    <a href='<c:url value="deleteproduct/${product.id}"></c:url>'>Delete Product</a>
  </div>
</div>


<script type="text/javascript">

document.getElementById('backToPlants').addEventListener('click', function() {
   
    window.location.href = 'adminviewallproducts';
});



</script>


</body>
</html>
