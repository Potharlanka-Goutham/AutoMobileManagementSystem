<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="css/Adminlogin.css"> <!-- Add the path to your stylesheet -->
    
    <style>
    body{
    background-image: url('images/adminlogin.jpg'); /* Replace 'your-background-image.jpg' with your image file path */
    background-size: 100% auto; /* This will make the image cover the entire body */
    background-position: center; /* This centers the image */
    background-repeat: no-repeat; /* Prevents repeating the image */
    }
    </style>
    
</head>
<body>
    <div class="container">
        <div class="screen">
            <div class="screen__content">
                <form method="post" action="checkadminlogin" class="login">
                    <div class="login__field">
                        <i class="login__icon fas fa-user"></i>
                        <input type="text"  name="auname" class="login__input" placeholder="User name / Email">
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-lock"></i>
                        <input name="apwd" type="password" class="login__input" placeholder="Password">
                    </div>
                    <button type="submit" class="button login__submit">
                        <span class="button__text">Log In Now</span>
                        <i class="button__icon fas fa-chevron-right"></i>
                    </button>				
                </form>
               
            </div>
            <div class="screen__background">
                <span class="screen__background__shape screen__background__shape4"></span>
                <span class="screen__background__shape screen__background__shape3"></span>		
                <span class="screen__background__shape screen__background__shape2"></span>
                <span class="screen__background__shape screen__background__shape1"></span>
            </div>		
        </div>
    </div>
</body>
</html>
