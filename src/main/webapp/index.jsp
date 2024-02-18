<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home-Automobiles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" /> 
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato"> 
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link type="text/css" rel="stylesheet" href="css/section2.css">
    
      
    
    
</head>

<style>
    body {
        font-family: "Lato", sans-serif
    }

    .container {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        margin: 40px 0;
        max-width: 100%;
    }

    .container .card {
        position: relative;
        width: 300px;
        height: 400px;
        margin: 20px;
        overflow: hidden;
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        border-radius: 15px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container .card .content {
        position: absolute;
        bottom: -160px;
        width: 100%;
        height: 160px;
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 10;
        flex-direction: column;
        backdrop-filter: blur(15px);
        box-shadow: 0 -10px 10px rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 15px;
        transition: bottom 0.5s;
        transition-delay: 0.65s;
    }

    .container .card:hover .content {
        bottom: 0;
        transition-delay: 0s;
    }

    .container .card .content .contentBx h3 {
        text-transform: uppercase;
        color: #fff;
        letter-spacing: 2px;
        font-weight: 500;
        font-size: 18px;
        text-align: center;
        margin: 20px 0 15px;
        line-height: 1.1em;
        transition: 0.5s;
        transition-delay: 0.6s;
        opacity: 0;
        transform: translateY(-20px);
    }

    .container .card:hover .content .contentBx h3 {
        opacity: 1;
        transform: translateY(0);
    }

    .container .card .content .contentBx h3 span {
        font-size: 12px;
        font-weight: 300;
        text-transform: initial;
    }

    .container .card .content .sci {
        position: relative;
        bottom: 10px;
        display: flex;
    }

    .container .card .content .sci li {
        list-style: none;
        margin: 0 10px;
        transform: translateY(40px);
        transition: 0.5s;
        opacity: 0;
        transition-delay: calc(0.2s * var(--i));
    }

    .container .card:hover .content .sci li {
        transform: translateY(0);
        opacity: 1;
    }

    .container .card .content .sci li a {
        color: white;
        font-size: 24px;
    }

    .container .card .imgBx {
        width: 100%;
        height: 100%;
        /* You can adjust this value as needed */
        overflow: hidden;
    }

    .container .card .imgBx img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        /* This ensures the image fits within the container while maintaining aspect ratio */
    }
</style>

<body>
    <nav>
        <a href="/" style="text-decoration: none;">Home</a>
        <a href="logininterface" style="text-decoration: none;">Login</a>
        <a href="customerregistration" style="text-decoration: none;">Register</a>
        <a href="servicepage.jsp" style="text-decoration: none;">Services</a>
        <a href="#" style="text-decoration: none;">Showroom</a>
        <a href="viewallproducts" style="text-decoration: none;">Parts and Accessories</a>
        <a href="#about" id="about-link" style="text-decoration: none;">Team Members</a>
        <a href="#" id="about-link" style="text-decoration: none;">Contact Us</a>

    </nav>

    <!-- First Section - Video Background -->
    <section class="parallax" style="background-image: url('images/index.png');">

        <div class="section text-light px-15 mx-15">
          <!--    <h1 style="stroke: black;">Autombile management system</h1>
            <p>The Automobile Management System is a comprehensive web-based application designed to efficiently manage
                various aspects of an automobile dealership or service centre. It serves as a centralized platform where
                administrators, sales representatives, and service technicians can handle vehicle inventory, sales,
                customer data, and service requests. The system aims to streamline automobile operations, enhance
                customer experience, and optimize service and sales processes.</p> -->
        </div>
    </section>

    <section class="parallax bg-dark" style="background-image: url('images/layered-waves-haikei.svg');">
  <div class="card-container">

  <div class="card-hover">
    <div class="card-hover__content">
      <h3 class="card-hover__title">
        We provide <span>Vehicle</span> Diagnostics
      </h3>
      <p class="card-hover__text">Vehicle diagnostics refers to the process of using onboard sensors and computer systems to monitor and assess the health and performance of a vehicle.</p>
      <a href="#" class="card-hover__link">
        <span>Learn How</span>
        <svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>        
      </a>
    </div>
    <div class="card-hover__extra">
      <h4>Learn <span>now</span> and get <span>40%</span> discount!</h4>
    </div>
    <img src="images/vehicled.jpg" alt="" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; object-position: center;">

    
  </div>
 <!-- ************************************************************************* --> 
  <div class="card-hover">
    <div class="card-hover__content">
      <h3 class="card-hover__title">
        Scheduled Maintenance of  <span>your</span> vehicle
      </h3>
      <p class="card-hover__text">Scheduled maintenance, also known as routine or preventive maintenance, is a planned and regular series of automotive services performed on a vehicle according to the manufacturer's recommendations.</p>
      <a href="#" class="card-hover__link">
        <span>Learn How</span>
        <svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>        
      </a>
    </div>
    <div class="card-hover__extra">
      <h4>Learn <span>now</span> and get <span>40%</span> discount!</h4>
    </div>
    <img src="images/repair.jpg" alt="car1" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; object-position: center;">
  </div>
  
   <!-- ************************************************************************* --> 
  
  <div class="card-hover">
    <div class="card-hover__content">
      <h3 class="card-hover__title">
        Make your <span>vehicle</span>look clean
      </h3>
      <p class="card-hover__text">A car wash is a service where a vehicle is cleaned and, in some cases, detailed to remove dirt, dust, grime, and contaminants from both the interior and exterior.</p>
      <a href="#" class="card-hover__link">
        <span>Learn How</span>
        <svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
        </svg>        
      </a>
    </div>
    <div class="card-hover__extra">
      <h4>Learn <span>now</span> and get <span>40%</span> discount!</h4>
    </div>
    <img src="images/carwash1.jpg" alt="car1" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; object-position: center;">
  </div>
  
   <!-- ************************************************************************* --> 
    </section>

    <!-- Third Section - Creators' Details -->
    <section class="section parallax" id="about" style="background-image: url('blob-scene-haikei.svg');">
       
        <div class="container">
            <div class="row">
                <div class="col col-4">
                    <div class="card">
                        <div class="imgBx">
                            <img src="images/vinaych.jpg" alt="" />
   
                        </div>
                        <div class="content">
                            <div class="contentBx">
                                <h3>VINAY CHINDUKURI <br /><span>Developer & UI/UX Designer</span></h3>
                            </div>
                            <ul class="sci pr-5">
                                <li style="--i: 1">
                                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                </li>
                                <li style="--i: 2">
                                    <a href="#"><i class="fa fa-github" aria-hidden="true"></i></a>
                                </li>
                                <li style="--i: 3">
                                    <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col col-4">
                    <div class="card">
                        <div class="imgBx">
                            <img src="images/goutham.jpg" alt="" />
                        </div>
                        <div class="content">
                            <div class="contentBx">
                                <h3>GOUTHAM POTHARLANKA <br /><span>Full Stack Developer</span></h3>
                            </div>
                            <ul class="sci pr-5">
                                <li style="--i: 1">
                                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                </li>
                                <li style="--i: 2">
                                    <a href="https://github.com/Potharlanka-Goutham"><i class="fa fa-github"
                                            aria-hidden="true"></i></a>
                                </li>
                                <li style="--i: 3">
                                    <a href="https://www.linkedin.com/in/goutham-potharlanka-904027226/"><i
                                            class="fa fa-linkedin" aria-hidden="true"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col col-4">
                    <div class="card">
                        <div class="imgBx">
                            <img src="images/gayathriimg.jpg" alt="" />
                        </div>
                        <div class="content">
                            <div class="contentBx">
                                <h3>GAYATHRI THOTAKURA <br /><span>Developer & Content Writer</span></h3>
                            </div>
                            <ul class="sci pr-5">
                                <li style="--i: 1">
                                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                </li>
                                <li style="--i: 2">
                                    <a href="#"><i class="fa fa-github" aria-hidden="true"></i></a>
                                </li>
                                <li style="--i: 3">
                                    <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 
    <script>
        $(document).ready(function () {

            // Smooth scrolling for other anchor links
            $("nav a:not(#about-link)").on("click", function (event) {
                if (this.hash !== "") {
                    event.preventDefault();
                    const hash = this.hash;
                    $("html, body").animate(
                        {
                            scrollTop: $(hash).offset().top
                        },
                        800
                    );
                }
            });
        });

    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>

</html>