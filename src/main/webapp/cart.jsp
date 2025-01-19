<%--
  Created by IntelliJ IDEA.
  User: joanneloi
  Date: 19/01/2025
  Time: 2:02 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>shopping cart</title>

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
      <img src="<%= session.getAttribute("userImage") != null ? session.getAttribute("userImage") : "../uploaded_img/default.png" %>" alt="User Image">
      <p><%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "Guest" %></p>
      <a href="user_profile_update.jsp" class="btn">update profile</a>
      <a href="login.jsp" class="delete-btn">logout</a>
      <div class="flex-btn">
        <a href="login.jsp" class="option-btn">login</a>
        <a href="register.jsp" class="option-btn">register</a>
      </div>
    </div>
  </div>
</header>

<!-- ADD TO CART ITEM -->
<section class="shopping-cart">
  <h1 class="title">products added</h1>
  <div class="box-container">
    <!-- if nothing added into cart -->
    <p class="empty">your cart is empty</p>
  </div>

  <div class="cart-total">
    <!-- Function for calculate total -->
    <p>grand total : <span>RM0/-</span></p>
    <a href="shop-servlet" class="option-btn">continue shopping</a>
    <!-- if have item than delete button can function -->
    <a href="#" class="delete-btn disabled">delete all</a>
    <a href="checkout.html" class="option-btn">proceed to checkout</a>
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
