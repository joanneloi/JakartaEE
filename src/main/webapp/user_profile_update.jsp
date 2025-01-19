<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>update user profile</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>

<header class="header">
   <div class="flex">
      <a href="html/admin_page.html" class="logo">Jom Makan<span>.</span></a>
      <nav class="navbar">
        <a href="home-servlet">home</a>
        <a href="html/shop.html">shop</a>
        <a href="html/orders.html">orders</a>
        <a href="about.jsp">about</a>
        <a href="html/contact.html">contact</a>
      </nav>
      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
         <a href="html/search_page.html" class="fas fa-search"></a>
         <a href="html/wishlist.html"><i class="fas fa-heart"></i><span>(0)</span></a>
         <a href="html/cart.html"><i class="fas fa-shopping-cart"></i><span>(0)</span></a>
      </div>
      <div class="profile">
         <img src="uploaded_img/default.png" alt="">
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

   <!-- USER UPDATE THEIR PROFILE -->
<section class="update-profile">
   <h1 class="title">update profile</h1>
   <form action="#" method="POST" enctype="multipart/form-data">
      <img src="uploaded_img/default.png" alt="">
      <div class="flex">
         <div class="inputBox">
            <span>username :</span>
            <input type="text" name="name" placeholder="update username" required class="box">
            <span>email :</span>
            <input type="email" name="email" placeholder="update email" required class="box">
            <span>update pic :</span>
            <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box">
         </div>
         <div class="inputBox">
            <span>old password :</span>
            <input type="password" name="update_pass" placeholder="enter previous password" class="box">
            <span>new password :</span>
            <input type="password" name="new_pass" placeholder="enter new password" class="box">
            <span>confirm password :</span>
            <input type="password" name="confirm_pass" placeholder="confirm new password" class="box">
         </div>
      </div>
      <div class="flex-btn">
         <input type="submit" class="btn" value="update profile" name="update_profile">
         <a href="home-servlet" class="option-btn">go back</a>
      </div>
   </form>

</section>

<footer class="footer">
    <section class="box-container">
       <div class="box">
          <h3>quick links</h3>
          <a href="home-servlet"> <i class="fas fa-angle-right"></i> home</a>
          <a href="html/shop.html"> <i class="fas fa-angle-right"></i> shop</a>
          <a href="about.jsp"> <i class="fas fa-angle-right"></i> about</a>
          <a href="html/contact.html"> <i class="fas fa-angle-right"></i> contact</a>
       </div>
       <div class="box">
          <h3>extra links</h3>
          <a href="html/cart.html"> <i class="fas fa-angle-right"></i> cart</a>
          <a href="html/wishlist.html"> <i class="fas fa-angle-right"></i> wishlist</a>
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
