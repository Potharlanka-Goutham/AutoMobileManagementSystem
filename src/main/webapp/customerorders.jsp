<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    
</head>
<body>

<%@ include file="customernavbar.jsp" %>

<div class="container">
    <section class="pt-5 pb-5">
        <div class="card">
            <h3 class="card-header display-5 text-center">Shopping Cart</h3>
            <div class="card-body">
                <p class="mb-5 text-center">
                    <i class="text-info font-weight-bold">${orders.size()}</i> items in your cart
                </p>
                <table class="table table-condensed table-responsive">
                    <thead>
                        <tr>
                            <th style="width:60%">Product</th>
                            <th style="width:12%">Price</th>
                            <th style="width:10%">Quantity</th>
                            <th style="width:16%">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${orders}">
                            <tr>
                                <td data-th="Product">
                                    <div class="row">
                                        <div class="col-md-3 text-left">
                                            <img src="displayprdouctimage1?id=${item.product.id}" alt="${item.product.name}"
     style="width: 100%; height: 100%; max-width: 100%; max-height: 100%; border-radius: 0.25rem; margin-bottom: 0.5rem; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);"
     class="img-fluid d-none d-md-block">

                                        </div>
                                        <div class="col-md-9 text-left mt-sm-2">
                                            <h4>${item.product.name}</h4>
                                            <p class="font-weight-light">${item.product.description}</p>
                                        </div>
                                    </div>
                                </td>
                                <td data-th="Price">$${item.product.cost}</td>
                                <td data-th="Quantity">
                                    <input type="number" class="form-control form-control-lg text-center" value="${item.quantity}">
                                </td>
                                <td data-th="Subtotal">
                                    $${item.product.cost * item.quantity}
                                </td>
                                <td data-th="Subtotal">
                                   <a href='<c:url value="delete/${item.id}"></c:url>' style="color: blue; text-decoration: none;">
                                    <i class="fas fa-trash"></i>
                                     </a>
                                   
                                </td>
                            </tr>
                         </c:forEach>
                    </tbody>
                </table>
                <div class="float-right text-right">
                    <h4>Total</h4>
                    <h1>$${totalcost}</h1> 
                </div>
            </div>
        </div>
    </section>
    
   
</div>

<div class="container mt-4">
    <div class="row d-flex align-items-center">
        <div class="col-sm-6 text-left">
            <a href="viewallproducts" class="btn btn-primary btn-lg">Continue Shopping</a>
        </div>
        <div class="col-sm-6 text-right">
            <a href="#" class="btn btn-primary btn-lg">Checkout</a>
        </div>
    </div>
</div>

</body>
</html>
