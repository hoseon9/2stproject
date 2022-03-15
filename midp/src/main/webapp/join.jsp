<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">

#white {

 color :white ;
}
@import url("https://fonts.googleapis.com/css?family=Sacramento&display=swap");


table { color: white;}
h1 {
  font-size: calc(20px + 18vh);
  line-height: calc(20px + 20vh);
/*   text-shadow: 0 0 5px #f562ff, 0 0 15px #f562ff, 0 0 25px #f562ff,
    0 0 20px #f562ff, 0 0 30px #890092, 0 0 80px #890092, 0 0 80px #890092;
  color: #fccaff; */
  text-shadow: 0 0 5px #ffa500, 0 0 15px #ffa500, 0 0 20px #ffa500, 0 0 40px #ffa500, 0 0 60px #ff0000, 0 0 10px #ff8d00, 0 0 98px #ff0000;
    color: #fff6a9;
  font-family: "Sacramento", cursive;
  text-align: center;
  animation: blink 12s infinite;
  -webkit-animation: blink 12s infinite;
}

body {
  padding: 2vw;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: #222;
  background-image: repeating-linear-gradient(
    to bottom,
    transparent 7px,
    rgba(0, 0, 0, 0.8) 9px,
    rgba(0, 0, 0, 0.8) 13px,
    transparent 13px
  );
}

@-webkit-keyframes blink {
  20%,
  24%,
  55% {
    color: #111;
    text-shadow: none;
  }

  0%,
  19%,
  21%,
  23%,
  25%,
  54%,
  56%,
  100% {
/*     color: #fccaff;
    text-shadow: 0 0 5px #f562ff, 0 0 15px #f562ff, 0 0 25px #f562ff,
      0 0 20px #f562ff, 0 0 30px #890092, 0 0 80px #890092, 0 0 80px #890092; */
  text-shadow: 0 0 5px #ffa500, 0 0 15px #ffa500, 0 0 20px #ffa500, 0 0 40px #ffa500, 0 0 60px #ff0000, 0 0 10px #ff8d00, 0 0 98px #ff0000;
    color: #fff6a9;
  }
}

@keyframes blink {
  20%,
  24%,
  55% {
    color: #111;
    text-shadow: none;
  }

  0%,
  19%,
  21%,
  23%,
  25%,
  54%,
  56%,
  100% {
/*     color: #fccaff;
    text-shadow: 0 0 5px #f562ff, 0 0 15px #f562ff, 0 0 25px #f562ff,
      0 0 20px #f562ff, 0 0 30px #890092, 0 0 80px #890092, 0 0 80px #890092; */
  text-shadow: 0 0 5px #ffa500, 0 0 15px #ffa500, 0 0 20px #ffa500, 0 0 40px #ffa500, 0 0 60px #ff0000, 0 0 10px #ff8d00, 0 0 98px #ff0000;
    color: #fff6a9;
  }
}

</style>
	

</style>
</head>
<body>
<h1>JOIN</h1>
<hr>
<form action="joinProc.jsp" method="post">
<table border="1">

	<tr><th>ID</th><td><input type="text" name="id"></td></tr>
	<tr><th>PW</th><td><input type="text" name="password"></td></tr>
	<tr><th>NAME</th><td><input type="text" name="name"></td></tr>
	<tr><th>ROLE</th><td>	

	USER : <input type="radio" name="role" value="User" checked="checked">
	ADMIN : <input type="radio" name="role" value="Admin">
	</td></tr>
	<tr><th>SUBMIT</th><td>
	<input type="submit" value="JOIN">
	<input type="button" value="Cancel" onclick="location.href='index.jsp';">	
	</td></tr>
</table>
</form>
</body>
</html>