<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  body {
    background-image: url('images/userbackground.jpg');
    background-size: 100% auto;
    background-position: center;
    background-repeat: no-repeat;
    margin: 0;
  }

  .glowing-text {
    text-align: center;
    font-size: 4em;
    color: #00ff00;
    animation: glow 1s ease-in-out infinite alternate;
  }

  @keyframes glow {
    0% {
      color: #00ff00;
    }
    100% {
      color: #33ff33;
    }
  }

  .link {
    position: relative;
    display: inline-block;
    padding: 0;
    line-height: 1em;
    margin: 0;
  }

  .link--top {
    position: absolute;
    top: 0;
    display: inline-block;
    transform: translateY(-50%) rotateX(90deg);
    transition: transform 0.6s ease;
     text-align: center;
    font-size: 3em;
    color: #00ff00;
  }

  .link--front {
    display: inline-block;
    transform: translateZ(0.5em);
    transition: transform 0.6s ease;
    text-decoration: underline;
    text-align: center;
    font-size: 3em;
    color: #00ff00;
  }

  .link:hover .link--top {
    transform: translateZ(0.5em);
    color: black;
  }

  .link:hover .link--front {
    transform: translateY(50%) rotateX(-90deg);
  }
</style>
</head>
<body>

<%@ include file="customernavbar.jsp" %>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div>
  <a class="link" target="_blank" rel="noreferrer" href="#">
    <span class="link--top" style="font-size: 2em; color: white">Have nice day </span>
    <span class="link--front" style="font-size: 2em; text-decoration: none; color: white">Welcome to our website    ${cname}</span>
  </a>
</div>

<br>
<br>
<br><br>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<br>




</body>
</html>
