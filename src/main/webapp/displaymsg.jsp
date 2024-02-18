<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>404 Page</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Ubuntu">
  <style>
    /* CSS Variables */
    :root {
      --purple: #28254C;
      --l-purple: #332F63;
      --t-purple: #8C8AA7;
      --pink: #FF5E65;
      --white: #fff;
    }

    /* CSS Styles */
    html, body {
      background: var(--purple);
      font-family: 'Ubuntu';
    }

    * {
      box-sizing: border-box;
    }

    .box {
      width: 350px;
      height: 100%;
      max-height: 600px;
      min-height: 450px;
      background: var(--l-purple);
      border-radius: 20px;
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      padding: 30px 50px;
    }

    .box__ghost {
      padding: 15px 25px 25px;
      position: absolute;
      left: 50%;
      top: 30%;
      transform: translate(-50%, -30%);
    }

    .box__ghost .symbol:nth-child(1) {
      opacity: 0.2;
      animation: shine 4s ease-in-out 3s infinite;
    }

    .box__ghost .symbol:nth-child(1):before,
    .box__ghost .symbol:nth-child(1):after {
      content: '';
      width: 12px;
      height: 4px;
      background: var(--white);
      position: absolute;
      border-radius: 5px;
      bottom: 65px;
      left: 0;
    }

    .box__ghost .symbol:nth-child(1):before {
      transform: rotate(45deg);
    }

    .box__ghost .symbol:nth-child(1):after {
      transform: rotate(-45deg);
    }

    .box__ghost .symbol:nth-child(2) {
      position: absolute;
      left: -5px;
      top: 30px;
      height: 18px;
      width: 18px;
      border: 4px solid;
      border-radius: 50%;
      border-color: var(--white);
      opacity: 0.2;
      animation: shine 4s ease-in-out 1.3s infinite;
    }

    .box__ghost .symbol:nth-child(3) {
      opacity: 0.2;
      animation: shine 3s ease-in-out 0.5s infinite;
    }

    .box__ghost .symbol:nth-child(3):before,
    .box__ghost .symbol:nth-child(3):after {
      content: '';
      width: 12px;
      height: 4px;
      background: var(--white);
      position: absolute;
      border-radius: 5px;
      top: 5px;
      left: 40px;
    }

    .box__ghost .symbol:nth-child(3):before {
      transform: rotate(90deg);
    }

    .box__ghost .symbol:nth-child(3):after {
      transform: rotate(180deg);
    }

    .box__ghost .symbol:nth-child(4) {
      opacity: 0.2;
      animation: shine 6s ease-in-out 1.6s infinite;
    }

    .box__ghost .symbol:nth-child(4):before,
    .box__ghost .symbol:nth-child(4):after {
      content: '';
      width: 15px;
      height: 4px;
      background: var(--white);
      position: absolute;
      border-radius: 5px;
      top: 10px;
      right: 30px;
    }

    .box__ghost .symbol:nth-child(4):before {
      transform: rotate(45deg);
    }

    .box__ghost .symbol:nth-child(4):after {
      transform: rotate(-45deg);
    }

    .box__ghost .symbol:nth-child(5) {
      position: absolute;
      right: 5px;
      top: 40px;
      height: 12px;
      width: 12px;
      border: 3px solid;
      border-radius: 50%;
      border-color: var(--white);
      opacity: 0.2;
      animation: shine 1.7s ease-in-out 7s infinite;
    }

    .box__ghost .symbol:nth-child(6) {
      opacity: 0.2;
      animation: shine 2s ease-in-out 6s infinite;
    }

    .box__ghost .symbol:nth-child(6):before,
    .box__ghost .symbol:nth-child(6):after {
      content: '';
      width: 15px;
      height: 4px;
      background: var(--white);
      position: absolute;
      border-radius: 5px;
      bottom: 65px;
      right: -5px;
    }

    .box__ghost .symbol:nth-child(6):before {
      transform: rotate(90deg);
    }

    .box__ghost .symbol:nth-child(6):after {
      transform: rotate(180deg);
    }

    .box__ghost-container {
      background: var(--white);
      width: 100px;
      height: 100px;
      border-radius: 100px 100px 0 0;
      position: relative;
      margin: 0 auto;
      animation: upndown 3s ease-in-out infinite;
    }

    .box__ghost-eyes {
      position: absolute;
      left: 50%;
      top: 45%;
    }

    .box__ghost-eyes .box__eye-left {
      width: 12px;
      height: 12px;
      background: var(--l-purple);
      border-radius: 50%;
      margin: 0 10px;
      position: absolute;
      left: 0;
    }

    .box__ghost-eyes .box__eye-right {
      width: 12px;
      height: 12px;
      background: var(--l-purple);
      border-radius: 50%;
      margin: 0 10px;
      position: absolute;
      right: 0;
    }

    .box__ghost-bottom {
      display: flex;
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
    }

    .box__ghost-bottom div {
      flex-grow: 1;
      position: relative;
      top: -10px;
      height: 20px;
      border-radius: 100%;
      background-color: var(--white);
    }

    .box__ghost-bottom div:nth-child(2n) {
      top: -12px;
      margin: 0 -0px;
      border-top: 15px solid var(--l-purple);
      background: transparent;
    }

    .box__ghost-shadow {
      height: 20px;
      box-shadow: 0 50px 15px 5px #3B3769;
      border-radius: 50%;
      margin: 0 auto;
      animation: smallnbig 3s ease-in-out infinite;
    }

    .box__description {
      position: absolute;
      bottom: 30px;
      left: 50%;
      transform: translateX(-50%);
    }

    .box__description-container {
      color: var(--white);
      text-align: center;
      width: 200px;
      font-size: 16px;
      margin: 0 auto;
    }

    .box__description-title {
      font-size: 24px;
      letter-spacing: 0.5px;
    }

    .box__description-text {
      color: var(--t-purple);
      line-height: 20px;
      margin-top: 20px;
    }

    .box__button {
      display: block;
      position: relative;
      background: var(--pink);
      border: 1px solid transparent;
      border-radius: 50px;
      height: 50px;
      text-align: center;
      text-decoration: none;
      color: var(--white);
      line-height: 50px;
      font-size: 18px;
      padding: 0 70px;
      white-space: nowrap;
      margin-top: 25px;
      transition: background 0.5s ease;
      overflow: hidden;
    }

    .box__button:before {
      content: '';
      position: absolute;
      width: 20px;
      height: 100px;
      background: var(--white);
      bottom: -25px;
      left: 0;
      border: 2px solid var(--white);
      transform: translateX(-50px) rotate(45deg);
      transition: transform 0.5s ease;
    }

    .box__button:hover {
      background: transparent;
      border-color: var(--white);
    }

    .box__button:before {
      transform: translateX(250px) rotate(45deg);
    }
  </style>
</head>
<body>
  <div class="box">
    <div class="box__ghost">
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>
      <div class="symbol"></div>
      
      <div class="box__ghost-container">
        <div class="box__ghost-eyes">
          <div class="box__eye-left"></div>
          <div class="box__eye-right"></div>
        </div>
        <div class="box__ghost-bottom">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
      <div class="box__ghost-shadow"></div>
    </div>
    
    <div class="box__description">
      <div class="box__description-container">
        <div class="box__description-title">Whoops!</div>
        <div class="box__description-text">${message}</div>
      </div>
      
      <a href="${goback}" target="_blank" class="box__button">Go back</a>
      
    </div>
  </div>

  <script>
    var pageX = $(document).width();
    var pageY = $(document).height();
    var mouseY = 0;
    var mouseX = 0;

    $(document).mousemove(function(event) {
      //verticalAxis
      mouseY = event.pageY;
      yAxis = (pageY / 2 - mouseY) / pageY * 300;
      //horizontalAxis
      mouseX = event.pageX / -pageX;
      xAxis = -mouseX * 100 - 100;

      $('.box__ghost-eyes').css({ 'transform': 'translate(' + xAxis + '%,-' + yAxis + '%)' });
    });
  </script>
</body>
</html>
