
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
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
    <h1 style="color: wheat">Confirmation Form</h1>
    <form action="/sms_confirm" method="post">
    <div class="main-agileinfo">
        <div class="agileits-top">
                <input class="text password" type="password" name="confirmsmscode" style="text-align: center" placeholder="SMS Confirmation Code" required="">
                <div class="wthree-text"><br>
                    <label class="anim">
                        <input type="checkbox" class="checkbox" required="">
                        <span>I Agree To The Terms & Conditions</span>
                    </label>
                    <div class="clear"> </div>
                </div>

                <input type="submit"  value="Click Here">
        </div>
    </div>
    </form>

    <div class="colorlibcopy-agile">
        <p>@ 2020 All user Signup Form. All rights Deserved| Design by <b style="color: khaki">ZHAKUNI TEAM</b></p>
    </div>

</div>
</body>
</html>