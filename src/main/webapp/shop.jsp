<%--@elvariable id="product" type="jakarta"--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Shop</title>

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
         <a href="orders.html">orders</a>
         <a href="about.jsp">about</a>
         <a href="contact.html">contact</a>
      </nav>
      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
         <a href="search_page.html" class="fas fa-search"></a>
         <a href="wishlist.jsp"><i class="fas fa-heart"></i><span id="wishlist-count">(0)</span></a>
         <a href="cart.html"><i class="fas fa-shopping-cart"></i><span id="cart-count">(0)</span></a>
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

      <div class="filter-buttons">
         <!-- Buttons will be dynamically loaded -->
      </div>

      <div class="box-container" id="product-container">
         <!-- Products will be loaded dynamically here -->
      </div>
   </section>
</main>

<!-- Quick View Modal -->
<div class="quick-view">
   <div class="quick-view-content">
      <button class="close-btn">&times;</button>
      <div class="product-details">
         <img class="modal-img" src="" alt="">
         <h2 class="modal-name"></h2>
         <p class="modal-price"></p>
         <p class="modal-origin"></p>
         <p class="modal-description"></p>
         <label>
            <input type="number" min="1" value="1" class="qty">
         </label>
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
   async function fetchProductData() {
      try {
         console.log('Fetching product data...');
         const response = await fetch('products'); // Ensure the URL is correct
         if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
         }
         const data = await response.json();
         console.log('Received products:', data);
         return data;
      } catch (error) {
         console.error('Error fetching product data:', error);
         const container = document.getElementById('product-container');
         container.innerHTML = '<p>Error loading products. Please try again later.</p>';
         return [];
      }
   }

   function displayProducts(products) {
      console.log('Displaying products:', products);
      const container = document.getElementById('product-container');

      if (!container) {
         console.error('Product container not found!');
         return;
      }

      if (!products || products.length === 0) {
         container.innerHTML = '<p>No products available</p>';
         return;
      }

      container.innerHTML = products.map(product => `
        <div class="box" data-category="${product.category}">
            <<div class="price">${product.price}</div>
            <button class="fas fa-eye quick-view-btn" data-product="${product.id}"></button>
            <div class="image-container">
                <img src="${product.image}"
                     alt="${product.name}"
                     onerror="this.src='project_images/placeholder.jpg'"
                     class="product-image">
            </div>
            <div class="name">${product.name}</div>
            <div class="description">${product.description}</div>
            <input type="number" min="1" value="1" class="qty">
            <button class="btn wishlist-btn">Add To Wishlist</button>
            <button class="btn cart-btn">Add To Cart</button>
        </div>
    `).join('');
   }

   // Initialize when the page loads
   document.addEventListener('DOMContentLoaded', async () => {
      console.log('Page loaded, initializing...');
      const products = await fetchProductData();
      displayProducts(products);
      updateCategoryButtons(products);
   });

   // Add this at the top of your script to get the context path
   const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf('/', 1));


   function initializeQuickView(products) {
      const quickView = document.querySelector('.quick-view');
      const closeBtn = document.querySelector('.close-btn');
      const quickViewBtns = document.querySelectorAll('.quick-view-btn');

      // Open Quick View
      quickViewBtns.forEach(btn => {
         btn.addEventListener('click', function() {
            const productId = this.getAttribute('data-product');
            const product = products.find(p => p.id === productId);

            if (!product) {
               console.error('Product not found:', productId);
               return;
            }

            // Populate modal content
            document.querySelector('.modal-img').src = product.image;
            document.querySelector('.modal-img').alt = product.name;
            document.querySelector('.modal-name').textContent = product.name;
            document.querySelector('.modal-price').textContent = `RM${product.price}/-`;
            document.querySelector('.modal-origin').textContent = `Origin: ${product.origin}`;
            document.querySelector('.modal-description').textContent = product.description;

            // Show modal
            quickView.classList.add('active');
         });
      });

      closeBtn.addEventListener('click', () => {
         quickView.classList.remove('active');
      });
   }

   function updateCategoryButtons(products) {
      const categories = new Set(products.map(product => product.category));
      categories.add('all'); // Add 'all' category

      const filterButtonsContainer = document.querySelector('.filter-buttons');
      filterButtonsContainer.innerHTML = '';

      Array.from(categories).sort().forEach(category => {
         const button = document.createElement('button');
         button.className = 'filter-btn';
         button.dataset.category = category.toLowerCase();
         button.textContent = category === 'all' ? 'All' : category;
         if (category === 'all') button.classList.add('active');
         filterButtonsContainer.appendChild(button);
      });

      const filterBtns = document.querySelectorAll('.filter-btn');
      filterBtns.forEach(btn => {
         btn.addEventListener('click', () => {
            filterProducts(products, btn.dataset.category);
            filterBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
         });
      });
   }

   function filterProducts(products, category) {
      const filteredProducts = category === 'all' ? products : products.filter(product => product.category.toLowerCase() === category);
      displayProducts(filteredProducts);
   }


   async function init() {
      const products = await fetchProductData();
      displayProducts(products);
      initializeQuickView(products);
      updateCategoryButtons(products);
   }

   init();
</script>

</body>
</html>