<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    <title>About Us</title>
    <link rel = "icon" href ="img/logoneel.jpeg" type = "image/x-icon">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

  </head>
  <body>
  <?php include 'partials/_dbconnect.php';?>
  <?php include 'partials/_nav3.php';?>
  
      <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide 1 -->
          <div class="carousel-item active">
            <div class="carousel-background"><img src="assets/img/slide/slide-1.jpg" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">Welcome to <br><span><a href="https://mcprice.in/"><b>MC</b>Price</span></h2>
                <a href="index.php" class="btn-get-started animate__animated animate__fadeInUp scrollto">Get Started</a>
              </div>
            </div>
          </div>
          <!-- Slide 2 -->
          <div class="carousel-item"><!assets/img/slide/slide-2.jpg>
            <div class="carousel-background"><img src="img/bg.jpg" alt="" ></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown mb-0">Our Mission</h2>
                <p class="animate__animated animate__fadeInUp">To solve probelm & keep work so Easy</p>
                <a href="index.php" class="btn-get-started animate__animated animate__fadeInUp scrollto">Get Started</a>
              </div>
            </div>
          </div>
          <!-- Slide 3 -->
          <div class="carousel-item">
            <div class="carousel-background"><img src="assets/img/slide/slide-3.jpg" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown mb-0">Meet Our Team for Your <br>Problem Or Great Idea</h2><p><a href="https://neel.com" target="_blank">@NeelNsoni</a></p>
                <a href="index.php" class="btn-get-started animate__animated animate__fadeInUp scrollto">Get Started</a>
              </div>
            </div>
          </div>
        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon icofont-thin-double-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon icofont-thin-double-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>

      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>About Us</h2>
        </div>

        <div class="row">
          <div class="col-lg-6">
            <h3>Welcome to <strong>MCPrice</strong></h3>
            <h3><strong>MCPrice</strong></h3>
            <p class="font-italic">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 content">
            <div class="skills-content">
              <p><b>Rating: </b></p>
              <div class="progress">
                <span class="skill">5 star <i class="val">93%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="93" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">4 star <i class="val">90%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">3 star <i class="val">30%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">2 star <i class="val">5%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">1 star <i class="val">0%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section><!-- End About Us Section -->

    <!-- ======= Counts Section ======= -->
    <section class="counts section-bg">
      <div class="container">

        <div class="row no-gutters">

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
            <div class="count-box">
              <i class="icofont-simple-smile"></i>
              <span data-toggle="counter-up">1000</span><span style="text-align:right; margin-top:-25px;margin-right:45px;">+</span>
              <p><strong>Happy Customers</strong></p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
            <div class="count-box">
              <i class="icofont-document-folder"></i>
              <span data-toggle="counter-up">600</span><span style="text-align:right; margin-top:-25px;margin-right:50px;">+</span>
              <p><strong>Items</strong></p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
            <div class="count-box">
              <i class="icofont-live-support"></i>
		
              <span data-toggle="counter-up" >24</span> <span style="text-align:right; margin-top:-25px;margin-right:50px;">* 7</span>
			
              <p><strong>Hours Of Support</strong></p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
            <div class="count-box">
              <i class="icofont-users-alt-5"></i>
              <span data-toggle="counter-up">4</span>
              <p><strong>Team Members</strong></p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Counts Section -->

    <!-- ======= Our Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>Our Team & Special Thanks</h2>
        </div>

      
        


        <!div class="row" style="text-align:center;">
		<!div class="row" style="text-align:center;">
		 
		
		
		
          <!col-xl-3 col-lg-3 col-md-5>
          <div class="" data-wow-delay="0.1s">
            <div class="member">
              <img src="img/neel.jpeg" class="img-fluid" alt="" style="object-fit:cover;width:22rem;height:27rem;">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Soni Neel (Founder)</h4>
                  <h4>(Owner of this Products)</h4>
                </div>
                <div class="social">
                  <a href="https://twitter.com/" target="_blank"><i class="icofont-twitter"></i></a>
                  <a href="https://github.com/" target="_blank"><i class="fab fa-github"></i></a>
                  <a href="https://www.linkedin.com/in/" target="_blank"><i class="icofont-linkedin" target="_blank"></i></a>
                </div>
              </div>
            </div>
          </div> 
		  
		  <!1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp>
		  
		  <div class="" data-wow-delay="0.1s">
            <div class="member">
              <img src="img/vrajb.jpeg" class="img-fluid" alt="" style="object-fit:cover;width:22rem;height:27rem;">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Patel Vraj </h4>
                  <h4>( Advisors Of Coding & Algorithm )</h4>
                </div>
                <div class="social">
                  <a href="https://twitter.com/" target="_blank"><i class="icofont-twitter"></i></a>
                  <a href="https://github.com/" target="_blank"><i class="fab fa-github"></i></a>
                  <a href="https://www.linkedin.com/in/" target="_blank"><i class="icofont-linkedin" target="_blank"></i></a>
                </div>
              </div>
            </div>
          </div> 
		  
		 
		  
		  
		  <div class="" data-wow-delay="0.1s">
            <div class="member">
              <img src="img/jay.jpeg" class="img-fluid" alt="" style="object-fit:cover;width:22rem;height:27rem;">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Devariya Jay </h4>
                  <h4>( App Developer )</h4>
                </div>
                <div class="social">
                  <a href="https://twitter.com/" target="_blank"><i class="icofont-twitter"></i></a>
                  <a href="https://github.com/" target="_blank"><i class="fab fa-github"></i></a>
                  <a href="https://www.linkedin.com/in/" target="_blank"><i class="icofont-linkedin" target="_blank"></i></a>
                </div>
              </div>
            </div>
          </div> 
		  
		  

          
          
		  <div class="" data-wow-delay="0.1s">
            <div class="member">
              <img src="img/darshan.jpeg" class="img-fluid" alt="" style="object-fit:cover;width:22rem;height:27rem;">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Darshan Parmar</h4>
                  <h4>( Website Developer )</h4>
                </div>
                <div class="social">
                  <a href="https://twitter.com/" target="_blank"><i class="icofont-twitter"></i></a>
                  <a href="https://github.com/" target="_blank"><i class="fab fa-github"></i></a>
                  <a href="https://www.linkedin.com/in/" target="_blank"><i class="icofont-linkedin" target="_blank"></i></a>
                </div>
              </div>
            </div>
          </div>

         
		  <div class="" data-wow-delay="0.1s">
            <div class="member">
              <img src="img/dimplenikunj.jpeg" class="img-fluid" alt="" style="object-fit:cover;width:22rem;height:27rem;">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Dr.Dimple-Nikunj Soni</h4>
                  <h4>(Advisors & Planner Of this whole project)</h4>
                  <h4>Modicare (DP Owner + Platinum Director)</h4>
                </div>
                <div class="social">
                  <a href="https://twitter.com/" target="_blank"><i class="icofont-twitter"></i></a>
                  <a href="https://github.com/" target="_blank"><i class="fab fa-github"></i></a>
                  <a href="https://www.linkedin.com/in/" target="_blank"><i class="icofont-linkedin" target="_blank"></i></a>
                </div>
              </div>
            </div>
          </div>
		  
		 
          <div class="" data-wow-delay="0.1s">
            <div class="member">
              <img src="img/mansi.jpeg" class="img-fluid" alt="" style="object-fit:cover;height:27rem;width:22rem; ">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Mansi-Jay Parikh </h4>
                  <h4>(Advsior/Supporter)</h4>
                </div>
                <div class="social">
                  <a href="https://twitter.com/" target="_blank"><i class="icofont-twitter"></i></a>
                  <a href="https://github.com/" target="_blank"><i class="fab fa-github"></i></a>
                  <a href="https://www.linkedin.com/in/" target="_blank"><i class="icofont-linkedin" target="_blank"></i></a>
                </div>
              </div>
            </div>
          </div>		  
          		
       
          				

        <!/div>
		
      </div>
	  
    </section><!-- End Our Team Section -->
  </main>

  <?php include 'partials/_footer.php';?> 

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>         
    <script src="https://unpkg.com/bootstrap-show-password@1.2.1/dist/bootstrap-show-password.min.js"></script>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
    <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="assets/vendor/counterup/counterup.min.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>


  </body>
</html>