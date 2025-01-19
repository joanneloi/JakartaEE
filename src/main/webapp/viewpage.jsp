<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.example.project.ProductProfileManager" %>
<%@ page import="org.example.project.ProductProfile" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Product</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<header class="header">
    <!-- Header content (unchanged) -->
</header>


<section class="view-product">
    <h1 class="title">Product Details</h1>

    <%
        String productId = request.getParameter("id");
        ProductProfile product = null;
        if (productId != null && !productId.isEmpty()) {
            product = ProductProfileManager.getProductById(productId);
        }
    %>
aass
    
    <c:if test="${not empty product}">
        <div class="box-container">
            <div class="box" data-category="${product.category}">
                <div class="price">RM<span>5</span>/-</div>
                <a href="viewpage.jsp?id=${product.id}" class="fas fa-eye"></a>
                <img src="${product.image}" alt="${product.name}">
                <div class="name">${product.name}</div>
                <p class="origin"><strong>Origin:</strong> ${product.origin}</p>
                <p class="description">${product.description}</p>
                <label>
                    <input type="number" min="1" value="1" class="qty">
                </label>
                <a href="addToCartServlet?id=${product.id}" class="btn">Add to Cart</a>
            </div>
        </div>
    </c:if>
    <c:if test="${empty product}">
        <p>No Product is available!</p>
    </c:if>
</section>

<footer class="footer">
    <!-- Footer content (unchanged) -->
</footer>

<script src="js/script.js"></script>

<style>
    /* CSS styles (unchanged) */
</style>

</body>
</html>