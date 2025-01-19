<%--
  Created by IntelliJ IDEA.
  User: joanneloi
  Date: 19/01/2025
  Time: 2:41 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${category} - Jom Makan</title>

  <!-- font awesome cdn link  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

  <!-- custom css file link  -->
  <link rel="stylesheet" href="css/style.css">

</head>
<body>

<header class="header">
  <div class="flex">
    <a href="admin_page.html" class="logo">Jom Makan<span>.</span></a>
    <nav class="navbar">
      <a href="home-servlet">home</a>
      <a href="shop-servlet">shop</a>
      <a href="orders.html">orders</a>
      <a href="about.jsp">about</a>
      <a href="contact.html">contact</a>
    </nav>
    <div class="icons">
      <div id="menu-btn" class="fas fa-bars"></div>
      <div id="user-btn" class="fas fa-user"></div>
      <a href="search_page.html" class="fas fa-search"></a>
      <a href="wishlist.jsp"><i class="fas fa-heart"></i><span>(0)</span></a>
      <a href="cart.jsp"><i class="fas fa-shopping-cart"></i><span>(0)</span></a>
    </div>
    <div class="profile">
      <img src="uploaded_img/default.png" alt="Default Image">
      <p>Guest</p>
      <a href="user_profile_update.jsp" class="btn">update profile</a>
      <a href="login.jsp" class="delete-btn">logout</a>
      <div class="flex-btn">
        <a href="login.jsp" class="option-btn">login</a>
        <a href="register.jsp" class="option-btn">register</a>
      </div>
    </div>
  </div>
</header>

<section class="products">
  <h1 class="title">${category} Products</h1>
  <div class="box-container">
    <c:forEach var="product" items="${categoryProducts}">
      <div class="box" data-category="${product.category}">
        <div class="price">RM<span>${product.price}</span>/-</div>
        <button class="fas fa-eye quick-view-btn" data-product="${product.description}"></button>
        <img src="${product.image}" alt="${product.name}">
        <div class="name">${product.name}</div>
        <label>
          <input type="number" min="1" value="1" class="qty">
        </label>
        <a href="addToCartServlet?id=${product.id}&quantity=${param.qty}" class="btn">Add to Cart</a>
      </div>
    </c:forEach>
    <c:if test="${empty categoryProducts}">
      <p>No products available in this category.</p>
    </c:if>
  </div>
</section>

<footer class="footer">
  <section class="box-container">
    <div class="box">
      <h3>quick links</h3>
      <a href="home-servlet"> <i class="fas fa-angle-right"></i> home</a>
      <a href="shop-servlet"> <i class="fas fa-angle-right"></i> shop</a>
      <a href="about.jsp"> <i class="fas fa-angle-right"></i> about</a>
      <a href="contact.html"> <i class="fas fa-angle-right"></i> contact</a>
    </div>
    <div class="box">
      <h3>extra links</h3>
      <a href="cart.jsp"> <i class="fas fa-angle-right"></i> cart</a>
      <a href="wishlist.jsp"> <i class="fas fa-angle-right"></i> wishlist</a>
      <a href="login.jsp"> <i class="fas fa-angle-right"></i> login</a>
      <a href="register.jsp"> <i class="fas fa-angle-right"></i> register</a>
    </div>
    <div class="box">
      <h3>contact info</h3>
      <p> <i class="fas fa-phone"></i> +03-111-2222 </p>
      <p> <i class="fas fa-phone"></i> +03-222-3333 </p>
      <p> <i class="fas fa-envelope"></i> jommakan@gmail.com </p>
      <p> <i class="fas fa-map-marker-alt"></i> Penang, Malaysia - 10150 </p>
    </div>
    <div class="box">
      <h3>follow us</h3>
      <a href="#"> <i class="fab fa-facebook-f"></i> facebook </a>
      <a href="#"> <i class="fab fa-twitter"></i> twitter </a>
      <a href="#"> <i class="fab fa-instagram"></i> instagram </a>
      <a href="#"> <i class="fab fa-tiktok"></i> tiktok </a>
    </div>
  </section>
  <p class="credit"> &copy; CAT201 Project 2024 by <span>Team YumYum</span> | Jom Makan </p>
</footer>

<script src="js/script.js"></script>

</body>
</html>
