
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
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
    <h1 style="color: wheat">Creative Forgot Password Form</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">
            <form action="forgot" method="post">

                <input class="text email" type="email" name="email" placeholder="Email" required="">

                <input class="text" type="password" name="password" placeholder="New Password" required=""><br>
                <input class="text" type="password" name="cpassword" placeholder="Confirm Password" required=""><br>
                <div class="wthree-text">
                    <label class="anim">
                        <input type="checkbox" class="checkbox" required="">
                        <span>I Agree To The Terms & Conditions</span>
                    </label>
                    <div class="clear"> </div>
                </div>
                <input type="submit" value="Click Here" >
            </form>
        </div>
    </div>

    <div class="colorlibcopy-agile">
        <p>@ 2020 All user Forgot Password Form. All rights Deserved| Design by <b style="color: khaki">ZHAKUNI TEAM</b></p>
    </div>

</div>
</body>
</html>