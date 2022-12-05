

<!DOCTYPE html>
<html>
<head>
    <title>Creative Colorlib SignUp Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
            }, false);
        function hideURLbar(){
        window.scrollTo(0,1); }
    </script>

   <%@include file="link.jsp"%>

</head>
<body>

<div class="main-w3layouts wrapper">
    <h1>Creative SignUp Form</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">
            <form action="process.jsp" method="post">
                <input class="text" type="text" name="username" placeholder="Username " required="">
                <input class="text email" type="email" name="email" placeholder="Email" required="">
                <input class="text" type="text" name="gender" placeholder="Gender" required=""><br>
                <input class="text" type="password" name="password" placeholder="Password" required=""><br>
                <%--<input class="text w3lpass" type="password" name="newpassword" placeholder="Confirm Password" required="">--%>
                <%--<b style="color: #721c24">Country:</b>--%>
                <%--<select name="userCountry" class="title">--%>
                    <%--<option>Select.</option>--%>
                    <%--<option>Bangladesh</option>--%>
                    <%--<option>Pakistan</option>--%>
                    <%--<option>America</option>--%>
                    <%--<option>England</option>--%>
                    <%--<option>Australia</option>--%>
                    <%--<option>other</option>--%>
                <%--</select><br><br>--%>
                <div class="wthree-text">
                    <label class="anim">
                        <input type="checkbox" class="checkbox" required="">
                        <span>I Agree To The Terms & Conditions</span>
                    </label>
                    <div class="clear"> </div>
                </div>
                <input type="submit" value="SIGNUP" >
            </form>
            <p>Don't have an Account? <a href="Signin.jsp"> Login Now!</a></p>
        </div>
    </div>

    <div class="colorlibcopy-agile">
        <p>@ 2020 All user Signup Form. All rights Deserved| Design by <b style="color: khaki">ZHAKUNI TEAM</b></p>
    </div>

    <ul class="colorlib-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
</body>
</html>