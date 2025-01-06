<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>shop</title>

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
         <a href="home.jsp">home</a>
         <a href="shop.jsp">shop</a>
         <a href="html/orders.html">orders</a>
         <a href="html/about.html">about</a>
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
         <img src="uploaded_img/" alt="">
         <p>Guest</p>
         <a href="html/user_profile_update.html" class="btn">update profile</a>
         <a href="login.jsp" class="delete-btn">logout</a>
         <div class="flex-btn">
            <a href="login.jsp" class="option-btn">login</a>
            <a href="register.jsp" class="option-btn">register</a>
         </div>
      </div>
   </div>
</header>

   <!-- SHOW THE PRODUCT BY CATEGORY -->
<section class="p-category">
   <a href="html/category.html?category=spices">Aromatic Spices</a>
   <a href="html/category.html?category=nutty">Sweet and Nutty</a>
   <a href="html/category.html?category=herbal">Herbal</a>
   <a href="html/category.html?category=spicy">Hot and Spicy</a>
</section>

   <!-- SHOWING PRODUCT -->
<section class="products">
   <h1 class="title">LATEST PRODUCTS</h1>
   <!-- EXAMPLE PRODUCT 1 -->
   <div class="box-container">
      <form action="org.example.jakartaee/ShopServlet" method="post" class="box">
         <input type="hidden" name="pid" value="1">
         <span class="price">RM<span>5</span>/-</span>
         <a href="html/view_page.html?pid=1" class="fa-eye"><i class="fas fa-eye"></i></a>
         <img src="project%20images/daun_limau_purut.png" alt="Daun Limau Purut">
         <div class="name">Daun Limau Purut</div>
         <label for="qty" class="sr-only">Quantity</label>
         <input type="number" min="1" max="99" value="1" class="qty" name="qty" id="qty">
         <input type="submit" value="Add To Wishlist" class="option-btn" name="action">
         <input type="submit" value="Add To Cart" class="btn" name="action">
      </form>

      <!-- EXAMPLE PRODUCT 2 -->
      <form action="org.example.jakartaee/ShopServlet" method="post" class="box">
         <input type="hidden" name="pid" value="2">
         <span class="price">RM<span>5</span>/-</span>
         <a href="html/view_page.html?pid=1" class="fa-eye"><i class="fas fa-eye"></i></a>
         <img src="project%20images/daun_kari.png" alt="Daun Curry">
         <div class="name">Daun Curry</div>
         <label for="qty" class="sr-only">Quantity</label>
         <input type="number" min="1" max="99" value="1" class="qty" name="qty">
         <input type="submit" value="Add To Wishlist" class="option-btn" name="action">
         <input type="submit" value="Add To Cart" class="btn" name="action">
      </form>

      <!-- EXAMPLE PRODUCT 3 -->
      <form action="org.example.jakartaee/ShopServlet" method="post" class="box">
         <input type="hidden" name="pid" value="3">
         <span class="price">RM<span>3</span>/-</span>
         <a href="html/view_page.html?pid=3" class="fa-eye"><i class="fas fa-eye"></i></a>
         <img src="project%20images/halia.png" alt="Halia">
         <div class="name">Halia</div>
         <label for="qty" class="sr-only">Quantity</label>
         <input type="number" min="1" max="99" value="1" class="qty" name="qty" id="qty">
         <input type="submit" value="Add To Wishlist" class="option-btn" name="action">
         <input type="submit" value="Add To Cart" class="btn" name="action">
      </form>
   </div>
</section>

   <%-- FOOTER --%>
<footer class="footer">
   <section class="box-container">
      <div class="box">
         <h3>quick links</h3>
         <a href="home.jsp"> <i class="fas fa-angle-right"></i> home</a>
         <a href="shop.jsp"> <i class="fas fa-angle-right"></i> shop</a>
         <a href="html/about.html"> <i class="fas fa-angle-right"></i> about</a>
         <a href="html/contact.html"> <i class="fas fa-angle-right"></i> contact</a>
      </div>
      <div class="box">
         <h3>extra links</h3>
         <a href="html/cart.html"> <i class="fas fa-angle-right"></i> cart</a>
         <a href="html/wishlist.html"> <i class="fas fa-angle-right"></i> wishlist</a>
         <a href="html/login.html"> <i class="fas fa-angle-right"></i> login</a>
         <a href="html/register.html"> <i class="fas fa-angle-right"></i> register</a>
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
