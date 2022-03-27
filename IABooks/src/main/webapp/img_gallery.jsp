<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
/* .prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
} */

.prev {
  cursor: pointer;
  position: absolute;
  top: 40%;
  left: 0;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  right: 500px;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}






/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

.mySlides {
	border: solid 10px lime;
	}
	
</style>


</head>
<body>
<h3 style="text-align:center">상품미리보기</h3>

<!-- 상세보기 상단 그림영역(detail_top_img) 시작 -->
<div class="detail_top_img col-lg-6" style="border: solid 10px red; width: 500px; height: 800px;">
	<!-- 상세보기 메인이미지(detail_img_display) 시작 -->
	<div class="detail_img_display" style="border: solid 10px cyan;">
	
	
		<div class="mySlides">
		  <div class="numbertext">1 / 6</div>
		  <img src="images/book.jpg" style="height:500px;">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext">2 / 6</div>
		  <img src="images/book2.jpg" style="height:500px;">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext">3 / 6</div>
		  <img src="images/book3.jpg" style="height:500px;">
		</div>
		  
		<div class="mySlides">
		  <div class="numbertext">4 / 6</div>
		  <img src="images/book.jpg" style="height:500px;">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext">5 / 6</div>
		  <img src="images/book2.jpg" style="height:500px;">
		</div>
		  
		<div class="mySlides">
		  <div class="numbertext">6 / 6</div>
		  <img src="images/book3.jpg" style="height:500px;">
		</div>

	</div>
</div>
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>

  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <div class="row">
    <div class="column">
      <img class="demo cursor" src="images/book.jpg" style="height:100px;" onclick="currentSlide(1)">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/book2.jpg" style="height:100px;" onclick="currentSlide(2)">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/book3.jpg" style="height:100px;" onclick="currentSlide(3)">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/book.jpg" style="height:100px;" onclick="currentSlide(4)">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/book2.jpg" style="height:100px;" onclick="currentSlide(5)">
    </div>    
    <div class="column">
      <img class="demo cursor" src="images/book3.jpg" style="height:100px;" onclick="currentSlide(6)">
    </div>
  </div>
</div>




<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}

</script>





</body>
</html>