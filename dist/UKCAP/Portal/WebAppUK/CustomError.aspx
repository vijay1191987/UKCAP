<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomError.aspx.cs" Inherits="CitizenPortal.WebAppUK.CustomError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>404 Custom Error</title>
    <script src="~/WebAppUK/HomeV3/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="~/WebAppUK/HomeV3/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="~/WebAppUK/HomeV3/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="~/WebAppUK/HomeV3/css/homestyle.css" type="text/css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="innerheader_bg">
                <div class="tophead_container">
                    <div class="tophead">
                        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
                            <div class="row toplink">
                                <a href="#skiptocontent">Skip to Main Content</a> | <a href="#skipnav">Skip to Navigation</a> <span class="dcrsefnt"><a href="#" class="fntadjust" id="decreasetxt">A-</a></span>
                                <span class="nrmlfnt" style=""><a href="#" class="fntadjust" id="normaltxt">A</a></span>
                                <span class="incrsefnt"><a href="#" class="fntadjust" id="increasetxt">A+</a></span>
                            </div>
                            <div class="row">
                                <div class="inline-block">
                                    <img src="/WebAppUK/HomeV3/img/uttarakhand_logo.png" alt="" class="img-responsive" style="width: 85px;" />
                                </div>
                                <div class="inline-block logo_txt">
                                    UTTARAKHAND
                                    <span>(COMMON APPLICATION PORTAL)</span>
                                    <span>(An initiative of Uttarakhand Govt.)</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-6 col-lg-6">
                           <%-- <div class="row top_loginbtn">
                                <a href="/Account/Login" class="login_btn"><i class="fa fa-unlock-alt fa-fw"></i>LOGIN</a>
                               <a href="/Account/Login" class="cscconnect_btn"><i class="fa fa-user fa-fw"></i>CSC LOGIN</a>
                            </div>--%>
                            <div class="row">
                                <div class="cm_box">
                                    <div class="inline-block cm_txt"><span class="cm_designation">Hon’ble Chief Minister </span><span class="cm_name">Shri Trivendra Singh Rawat</span></div>
                                    <div class="inline-block">
                                        <img src="/WebAppUK/HomeV3/img/uttarakhand_cm.png" class="img-responsive" alt="Shri Trivendra Singh Rawat" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </header>
        <section class="under_devlp">
        <div class="underdevlp_txt">
            <h1>We are Under Development.
                <span style="display:block;">Will we back with more information soon...</span>
                <a href="/WebAppUK/HomeV3/index.aspx" class="gohome_btn">Go to Home</a>
            </h1>
        </div>

        </section>
        <footer>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom_nav">
                <ul>
                    <li><a href="#">Disclaimer and Policies</a></li>
                    <li><a href="#">Sitemap</a></li>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Terms and Conditions </a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <div class="clearfix"></div>
                <div class="total_visitor"><span class="visitor_txt">TOTAL VISITORS</span><span class="visitor_count">14872</span></div>
                <div class="today_visitor"><span class="visitor_txt">TODAY VISITORS</span><span class="visitor_count">264</span></div>
                <div class="clearfix"></div>
                <p class="ptop15" style="color:#fff;">© All rights reserved CSC, SPVC.</p>
            </div>
           
        </footer>
    </form>
</body>
</html>
