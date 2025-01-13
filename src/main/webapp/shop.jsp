<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home page</title>

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
         <a href="orders.jsp">orders</a>
         <a href="about.jsp">about</a>
         <a href="contact.jsp">contact</a>
      </nav>
      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
         <a href="search_page.jsp" class="fas fa-search"></a>
         <a href="wishlist.jsp"><i class="fas fa-heart"></i><span id="wishlist-count">(0)</span></a>
         <a href="cart.jsp"><i class="fas fa-shopping-cart"></i><span id="cart-count">(0)</span></a>
      </div>
      <div class="profile">
         <img src="uploaded_img" alt="">
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

<main>
   <section class="products">
      <h1 class="title">LATEST PRODUCTS</h1>

<%--      Category Of Spices Provided--%>
      <div class="filter-buttons">
         <button class="filter-btn active" data-category="all">All</button>
         <button class="filter-btn" data-category="spices">Aromatic Spices</button>
         <button class="filter-btn" data-category="nutty">Sweet and Nutty</button>
         <button class="filter-btn" data-category="spicy">Hot and Spicy</button>
         <button class="filter-btn" data-category="herbal">Herbal</button>
      </div>

      <div class="box-container">
         <!-- Product 1 -->
         <div class="box" data-category="spices">
            <div class="price">RM<span>5</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="kunyit"></button>
            <img src="project%20images/kunyit.png" alt="Kunyit (Turmeric)">
            <div class="name">Kunyit (Turmeric)</div>
            <label>
               <input type="number" min="1" value="1" class="qty">
            </label>
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 2 -->
         <div class="box" data-category="spices">
            <div class="price">RM<span>5</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="lawang"></button>
            <img src="project%20images/bunga_lawang.png" alt="Bunga Lawang">
            <div class="name">Bunga Lawang (Star Anise)</div>
            <label>
               <input type="number" min="1" value="1" class="qty">
            </label>
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 3 -->
         <div class="box" data-category="spices">
            <div class="price">RM<span>5</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="cengkih"></button>
            <img src="project%20images/bunga_cengkih.png" alt="Bunga Cengkih">
            <div class="name">Bunga Cengkih (Cloves)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 4 -->
         <div class="box" data-category="nutty">
            <div class="price">RM<span>6</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="pili"></button>
            <img src="project%20images/buah_pili.png" alt="Buah Pili">
            <div class="name">Buah Pili (Pili Nuts)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 5 -->
         <div class="box" data-category="nutty">
            <div class="price">RM<span>6</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="keras"></button>
            <img src="project%20images/buah_keras.png" alt="Buah Keras">
            <div class="name">Buah Keras (Candlenuts)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 6 -->
         <div class="box" data-category="nutty">
            <div class="price">RM<span>6</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="gajus"></button>
            <img src="project%20images/buah_gajus.png" alt="Buah Gajus">
            <div class="name">Buah Gajus (Cashews)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 7 -->
         <div class="box" data-category="spicy">
            <div class="price">RM<span>7</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="halia"></button>
            <img src="project%20images/halia.png" alt="Halia">
            <div class="name">Halia (Ginger)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 8 -->
         <div class="box" data-category="spicy">
            <div class="price">RM<span>7</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="asam"></button>
            <img src="project%20images/asam_jawa.png" alt="Asam Jawa">
            <div class="name">Asam Jawa (Tamarind)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 9 -->
         <div class="box" data-category="spicy">
            <div class="price">RM<span>7</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="pepper"></button>
            <img src="project%20images/blackpepper.png" alt="Black Pepper">
            <div class="name">Lada Hitam (Black Pepper)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 10  -->
         <div class="box" data-category="herbal">
            <div class="price">RM<span>8</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="pandan"></button>
            <img src="project%20images/pandan.png" alt="Daun Pandan">
            <div class="name">Daun Pandan (Pandan Leaves)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 11 -->
         <div class="box" data-category="herbal">
            <div class="price">RM<span>8</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="serai"></button>
            <img src="project%20images/serai.png" alt="Lemongrass">
            <div class="name">Serai (Lemongrass)</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
         <!-- Product 12 -->
         <div class="box" data-category="herbal">
            <div class="price">RM<span>8</span>/-</div>
            <button class="fas fa-eye quick-view-btn" data-product="limau"></button>
            <img src="project%20images/daun_limau_purut.png" alt="Daun Limau Purut">
            <div class="name">Daun Limau Purut</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>

      </div>
   </section>
</main>

<!-- Quick View Modal -->
<div class="quick-view">
   <div class="quick-view-content">
      <button class="close-btn">&times;</button>
      <div class="product-details">
         <img src="" alt="" class="modal-img">
         <h3 class="modal-name"></h3>
         <p class="modal-price"></p>
         <p class="modal-origin"></p>
         <p class="modal-description"></p>
         <input type="number" min="1" value="1" class="qty">
         <div class="modal-buttons">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
         </div>
      </div>
   </div>
</div>

<footer class="footer">
   <section class="box-container">
      <div class="box">
         <h3>quick links</h3>
         <a href="home.jsp"> <i class="fas fa-angle-right"></i> home</a>
         <a href="shop.jsp"> <i class="fas fa-angle-right"></i> shop</a>
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

<script>
   // Product data
   const products = {
      kunyit: {
         name: "Kunyit (Tumeric)",
         price: "RM5/-",
         image: "project%20images/kunyit.png",
         origin: "Origin: Kuala Kangsar, Perak",
         description: "Turmeric is a bright yellow root widely used in Malaysian curries, marinades, and traditional medicine. Its earthy aroma and slight bitterness add depth to dishes like rendang and laksa."
      },
      lawang: {
         name: "Bunga Lawang (Star Anise)",
         price: "RM5/-",
         image: "project%20images/bunga_lawang.png",
         origin: "Origin: Muar, Johor",
         description: "Star anise has a sweet, licorice-like flavor and is a key ingredient in Malaysian dishes like beef rendang and herbal soups, adding depth and complexity to the flavor."
      },
      cengkih: {
         name: "Bunga Cengkih (Cloves)",
         price: "RM5/-",
         image: "project%20images/bunga_cengkih.png",
         origin: "Origin: Balik Pulau, Penang",
         description: "Cloves are aromatic flower buds used in curries, rice dishes like nasi briyani, and spiced teas. They offer a warm, sweet, and pungent flavor profile."
      },
      halia: {
         name: "Halia (Ginger)",
         price: "RM7/-",
         image: "project%20images/halia.png",
         origin: "Origin: Bentong, Pahang",
         description: "Bentong ginger is famous for its strong aroma and spiciness. It's widely used in Malaysian cuisine and traditional medicine. Our ginger is carefully selected from premium farms in Bentong."
      },
      asam: {
         name: "Asam Jawa (Tamarind)",
         price: "RM7/-",
         image: "project%20images/asam_jawa.png",
         origin: "Origin: Alor Gajah, Malacca",
         description: "Tamarind is used to add a tangy and mildly spicy kick to dishes like asam laksa and asam pedas, balancing heat with sourness."
      },
      pepper: {
         name: "Lada Hitam (Black Pepper)",
         price: "RM7/-",
         image: "project%20images/blackpepper.png",
         origin: "Origin: Kuching, Sarawak",
         description: "Sarawak black pepper is renowned for its rich, aromatic flavor and heat. It’s widely used in meat marinades, soups, and stir-fries."
      },
      pili: {
         name: "Buah Pili (Pili Nuts)",
         price: "RM6/-",
         image: "project%20images/buah_pili.png",
         origin: "Origin: Ranau, Sabah",
         description: "Grown in small quantities, pili nuts have a rich, buttery flavor and are often roasted and eaten as a snack or used in confectionery."
      },
      keras: {
         name: "Buah Keras (Candlenuts)",
         price: "RM6/-",
         image: "project%20images/buah_keras.png",
         origin: "Origin: Pontian, Johor",
         description: "Candlenuts are often used as a thickening agent in Malaysian dishes like rendang and curries. They have a rich, creamy texture when ground."
      },
      gajus: {
         name: "Buah Gajus (Cashews)",
         price: "RM6/-",
         image: "project%20images/buah_gajus.png",
         origin: "Origin: Langkawi, Kedah",
         description: "Cashew trees are cultivated on a small scale, with nuts used as snacks, in stir-fries, or as garnishes in Malaysian dishes."
      },
      pandan: {
         name: "Daun Pandan (Pandan Leaves)",
         price: "RM8/-",
         image: "project%20images/pandan.png",
         origin: "Origin: Ipoh, Perak",
         description: "Known for their sweet and fragrant aroma, pandan leaves are used in desserts, rice dishes like nasi lemak, and drinks for a unique herbal flavor."
      },
      serai: {
         name: "Serai (Lemongrass)",
         price: "RM8/-",
         image: "project%20images/serai.png",
         origin: "Origin: Langkawi, Kedah",
         description: "Lemongrass adds a citrusy, herbal aroma to dishes like tom yum, curries, and marinades, making it an essential ingredient in Malaysian cuisine."
      },
      limau: {
         name: "Daun Limau Purut",
         price: "RM8/-",
         image: "project%20images/daun_limau_purut.png",
         origin: "Origin: Kuala Terengganu, Terengganu",
         description: "These aromatic leaves are used in curries, soups, and sambals, imparting a distinctive citrusy and herbal flavor."
      }

   };

   document.addEventListener('DOMContentLoaded', function() {
      const filterButtons = document.querySelectorAll('.filter-btn');
      const products = document.querySelectorAll('.box');

      filterButtons.forEach(button => {
         button.addEventListener('click', () => {
            // Remove active class from all buttons
            filterButtons.forEach(btn => btn.classList.remove('active'));

            // Add active class to clicked button
            button.classList.add('active');

            // Get selected category
            const category = button.getAttribute('data-category');

            // Filter products
            products.forEach(product => {
               if (category === 'all' || product.getAttribute('data-category') === category) {
                  product.style.display = '';
               } else {
                  product.style.display = 'none';
               }
            });
         });
      });
   });

   // Quick View Functionality
   document.addEventListener('DOMContentLoaded', function() {
      const quickView = document.querySelector('.quick-view');
      const closeBtn = document.querySelector('.close-btn');
      const quickViewBtns = document.querySelectorAll('.quick-view-btn');

      // Open quick view
      quickViewBtns.forEach(btn => {
         btn.addEventListener('click', function () {
            const productId = this.getAttribute('data-product');
            const product = products[productId];

            // Update modal content
            document.querySelector('.modal-img').src = product.image;
            document.querySelector('.modal-img').alt = product.name;
            document.querySelector('.modal-name').textContent = product.name;
            document.querySelector('.modal-price').textContent = product.price;
            document.querySelector('.modal-origin').textContent = product.origin;
            document.querySelector('.modal-description').textContent = product.description;

            // Show modal
            quickView.classList.add('active');
         });
      });

      // Close quick view
      closeBtn.addEventListener('click', () => {
         quickView.classList.remove('active');
      });

      // Close on outside click
      quickView.addEventListener('click', (e) => {
         if (e.target === quickView) {
            quickView.classList.remove('active');
         }
      });

      // Close on escape key
      document.addEventListener('keydown', (e) => {
         if (e.key === 'Escape' && quickView.classList.contains('active')) {
            quickView.classList.remove('active');
         }
      });
   });

   // Add event listeners to all cart and wishlist buttons
   document.querySelectorAll('.cart-btn').forEach(btn => {
      btn.addEventListener('click', function() {
         const productId = this.getAttribute('data-product');
         const quantity = parseInt(this.closest('.box').querySelector('.qty').value);
         sendRequest('addToCart', productId, quantity);
      });
   });

   document.querySelectorAll('.wishlist-btn').forEach(btn => {
      btn.addEventListener('click', function() {
         const productId = this.getAttribute('data-product');
         sendRequest('addToWishlist', productId, 1);
      });
   });
</script>
<%--<script src="js/script.js"></script>--%>
</body>
</html>
