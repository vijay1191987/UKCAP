<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CitizenPortal.WebAppUK.HomeV3.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Common Application Portal - Uttarakhand</title>
    <!--Basic Javascript START Here-->
    <script src="/WebAppUK/HomeV3/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="/WebAppUK/HomeV3/js/bootstrap.min.js" type="text/javascript"></script>
    <!--Basic StyleSheet START Here-->
    <link href="/WebAppUK/HomeV3/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/WebAppUK/HomeV3/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/WebAppUK/HomeV3/css/homestyle.css" type="text/css" rel="stylesheet" />

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/WebAppUK/HomeV3/ForIEOnly/ie10-viewport-bug-workaround.css" type="text/css" rel="stylesheet" />
    <script src="/WebAppUK/HomeV3/ForIEOnly/ie-emulation-modes-warning.js" type="text/javascript"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="/WebAppUK/HomeV3/ForIEOnly/js/html5shiv.min.js" type="text/javascript"></script>
      <script src="/WebAppUK/HomeV3/ForIEOnly/js/respond.min.js" type="text/javascript"></script>
      <link href="/WebAppUK/HomeV3/ForIEOnly/ForIEOnly.css" type="text/css" rel="stylesheet" />
    <![endif]-->
    <script type="text/javascript">
        $(document).ready(function () {
            $('.count').each(function () {
                $(this).prop('Counter', 0).animate({
                    Counter: $(this).text()
                }, {
                    duration: 4000,
                    easing: 'swing',
                    step: function (now) {
                        $(this).text(Math.ceil(now));
                    }
                });
            });

            $("#decreasetxt").click(function (event) {
                event.preventDefault();
                $("#bodytxt").animate({ "font-size": "11px" });


            });

            $("#normaltxt").click(function (event) {
                event.preventDefault();
                $("#bodytxt").animate({ "font-size": "14px" });

            });

            $("#increasetxt").click(function (event) {
                event.preventDefault();
                $("#bodytxt").animate({ "font-size": "16px" });

            });

            $("a").click(function () {
                $("a").removeClass("selected");
                $(this).addClass("selected");

            });
        });
        function getLogin(Type) {
            window.location.href = '/Account/Login?id=' + Type;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="header_hold">

                <div id="myCarousel1" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel1" data-slide-to="0" class=""></li>
                        <li data-target="#myCarousel1" data-slide-to="1" class=""></li>
                        <li data-target="#myCarousel1" data-slide-to="2" class=""></li>
                        <li data-target="#myCarousel1" data-slide-to="3" class=""></li>
                        <li data-target="#myCarousel1" data-slide-to="4" class=""></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="/WebAppUK/HomeV3/img/slider_img_1.jpg" alt="" class="imgslide img-responsive" />
                        </div>

                        <div class="item">
                            <img src="/WebAppUK/HomeV3/img/slider_img_2.jpg" alt="" class="imgslide img-responsive" />
                        </div>

                        <div class="item">
                            <img src="/WebAppUK/HomeV3/img/slider_img_3.jpg" alt="" class="imgslide img-responsive" />
                        </div>

                        <div class="item">
                            <img src="/WebAppUK/HomeV3/img/slider_img_4.jpg" alt="" class="imgslide img-responsive" />
                        </div>
                        <div class="item">
                            <img src="/WebAppUK/HomeV3/img/slider_img_5.jpg" alt="" class="imgslide img-responsive" />
                        </div>
                        <%-- <div class="item">
                        <img src="/WebAppUK/HomeV3/img/slider_img_6.jpg" alt="" class="imgslide img-responsive"/>
                    </div>--%>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="tophead_container pstn_abslte">
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
                            <%--<div class="row top_loginbtn">
                                <a href="/Account/Login" class="login_btn"><i class="fa fa-unlock-alt fa-fw"></i>LOGIN</a>
                                <a href="/Account/Login" class="cscconnect_btn" style="display: none;"><i class="fa fa-user fa-fw"></i>CSC LOGIN</a>
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
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 topmenu_container">
                    <div class="topnavigation">
                        <div class="dsplt_tble" style="text-align: center; margin: 0 auto;">
                            <nav class="navbar navbar-static-top mbtm0">
                                <div class="navbar-header">
                                    <span class="menu_txtvsble">MENU</span>
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <!--<a class="navbar-brand" href="#"></a>-->
                                </div>
                                <div id="navbar" class="navbar-collapse rspnsvenav collapse" aria-expanded="false" style="height: 1px;">
                                    <ul class="nav navbar-nav">
                                        <li>
                                            <asp:LinkButton runat="server" ID="home" class="active" OnClick="home_Click"><span class="topnav_icon home_icon"></span>Home</asp:LinkButton></li>
                                        <li><a href="/WebAppUK/whos_who.aspx"><span class="topnav_icon whos_icon"></span>Who's Who</a></li>
                                        <li><a href="/WebAppUK/state_profile.aspx"><span class="topnav_icon stateprofile_icon"></span>State Profile</a></li>
                                        <li><a href="/WebAppUK/apex_bodies.aspx"><span class="topnav_icon apexbodies_icon"></span>Apex Bodies</a></li>
                                        <li><a href="/WebAppUK/divisions_mandal.aspx"><span class="topnav_icon division_icon"></span>Divisions</a></li>
                                        <li><a href="/WebAppUK/districts_administration.aspx"><span class="topnav_icon district_icon"></span>Districts</a></li>
                                        <li><a href="/WebAppUK/acts.aspx"><span class="topnav_icon act_icon"></span>Acts</a></li>
                                        <li><a href="/WebAppUK/goi_websites.aspx"><span class="topnav_icon goi_icon"></span>GOI Websites</a></li>
                                        <li><a href="/WebAppUK/CustomError.aspx"><span class="topnav_icon grivance_icon"></span>Online Grievance</a></li>
                                        <li><a href="/Account/Login" style="background-color: #D30201;"><span class="topnav_icon login_icon"></span>Login</a></li>
                                    </ul>
                                </div>
                                <!--/.nav-collapse -->
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <section class="main_content">
            <div class="col-lg-12 pleft0 pright0">
                <a name="skipnav"></a>
                <div id="count">
                    <div class="container-fluid counters">
                        <div class="well" style="background-color: transparent; border: none;">
                            <div class="carousel slide" id="myCarousel">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="row-fluid">
                                            <div class="col-xs-12 col-sm-4 col-md-4 text-center count-div-brd">
                                                <div class="count-div">
                                                    <p>No. of Departments</p>
                                                    <p class="org"><span class="count" runat="server" id="DepCount">3</span> </p>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-4 col-md-4 text-center count-div-brd">
                                                <div class="count-div">
                                                    <p>Citizen Services</p>
                                                    <p class="green"><span class="count" runat="server" id="servicecount">17</span> </p>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-4 col-md-4 text-center">
                                                <div class="count-div">
                                                    <p>Citizen Transaction</p>
                                                    <p class="blu"><span class="count" runat="server" id="transcount" >0</span> </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%--<div class="item">
                                        <div class="row-fluid">
                                            <div class="col-xs-12 col-sm-4 col-md-4 text-center count-div-brd">
                                                <div class="count-div">
                                                    <p>Total CSC</p>
                                                    <p class="org"><span class="count">7000</span> +</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                                <a class="left carousel-control" data-slide="prev" href="#myCarousel">‹</a> <a class="right carousel-control" data-slide="next" href="#myCarousel">›</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wlcme_txt">
                    <a name="skiptocontent"></a>
                    <h2>Welcome to
                        <br />
                        Uttarakhand Common Application Portal</h2>
                    <p>
                        Uttarakhand was formed on 9th November 2000 as the 27th State of India, when it was carved out of northern
Uttar Pradesh. Located at the foothills of the Himalayan mountain ranges, it is largely a hilly State, having international boundaries with China (Tibet) in the north and Nepal in the east.
                    </p>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center services_container" style="display: none;">
                <h2 class="pbtm20">Available Online Services for Citizen</h2>

                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <div class="service_holder">
                        <a href="/Account/Login">
                            <div class="service_icon">
                                <img src="/WebAppUK/HomeV3/img/citizen_services_icon.png" class="img-responsive" />
                            </div>
                            <div class="service_txt">
                                <span class="apply">Apply For</span>
                                <span class="service_name">Citizen Services</span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <div class="service_holder">
                        <a href="http://5.79.69.86:7270/Citizen/Forms/Index.aspx" target="_blank">
                            <div class="service_icon jim_corbett">
                                <img src="/WebAppUK/HomeV3/img/jim_corbett_icon.png" class="img-responsive" />
                            </div>
                            <div class="service_txt jim_corbetttxt">
                                <span class="apply">Booking For</span>
                                <span class="service_name">Jim Corbett<br />
                                    National Park</span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <div class="service_holder">
                        <a href="http://5.79.69.86:8010/charDhaam/index.aspx" target="_blank">
                            <div class="service_icon char_dham">
                                <img src="/WebAppUK/HomeV3/img/char_dham_icon.png" class="img-responsive" />
                            </div>
                            <div class="service_txt char_dhamtxt">
                                <span class="apply">UID Registration For</span>
                                <span class="service_name">Char Dham Yatra</span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <div class="service_holder">
                        <a href="/Account/Login">
                            <div class="service_icon grievance">
                                <img src="/WebAppUK/HomeV3/img/grievnace_icon.png" class="img-responsive" />
                            </div>
                            <div class="service_txt grievancetxt">
                                <span class="apply">Apply for Online</span>
                                <span class="service_name">Grievance</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center associate_prtnr">
                <ul>
                    <li class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <img src="/WebAppUK/HomeV3/img/digitalindia_logo.png" alt="Digital India Logo" style="vertical-align:top; height:90px;" /></li>

                    <li class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <img src="/WebAppUK/HomeV3/img/uttarakhand_logo.png" alt="Uttarakhand State Logo" style="vertical-align:top; height:90px;"/></li>
                    <li class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <img src="/WebAppUK/HomeV3/img/itda_logo.png" alt="ITDA Logo" style="vertical-align:top; height:90px;"/></li>
                    <li class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <img src="/WebAppUK/HomeV3/img/csc_logo.png" alt="CSC Logo" style="vertical-align:top; height:90px;"/></li>

                </ul>
            </div>
            <%--<div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pleft0">
                    <h4 class="unicode" style="font-size:23px; background: #425F9B; color: #fff; padding: 10px 0;">Facebook</h4>

                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-center pright0">
                    <h4 class="unicode" style="font-size: 23px; background: #21A1F0; color: #fff; padding: 10px 0;">Twitter</h4>
                </div>
            </div>--%>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 quicklink_box">
                    <h4>QUICK LINKS</h4>
                    <ul>
                        <li><a href="#">Novak Djokovic crashes out of Australian Open</a></li>
                        <li><a href="#">PM Modi meets Swiss President Alain Berset in Davos</a></li>
                        <li><a href="#">SC to hear PILs on CBI judge Loya’s death</a></li>
                        <li><a href="#">India means business: PM Modi tells global CEOs at Davos meet</a></li>
                        <li><a href="#">New Delhi: Full dress rehearsal of R-Day Parade to be held at Rajpath today</a></li>
                        <li><a href="#">Om Prakash Rawat to take over as new chief election commissioner</a></li>
                        <li><a href="#">WEF annual meet begins in Davos</a></li>
                        <li><a href="#">India to become fastest growing large economy in 2018</a></li>
                        <li><a href="#">Assam CM urges medical professionals to work with utmost earnestness</a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ukglance_box">
                    <h4>UTTARAKHAND AT A GLANCE<img src="/WebAppUK/HomeV3/img/uttarakhand_map.png" class="img-responsive" align="right" alt="Uttarakhand Map" style="width: 250px;" /></h4>
                    <p><b>Area:</b> 53,483 sq.km.</p>
                    <p><b>Population:</b> 100.86 lakh</p>
                    <p><b>Capital:</b> Dehradun(Temporary)</p>
                    <p><b>Districts:</b> 13</p>
                    <p><b>Literacy Rate:</b> 78.80%</p>
                    <p><b>Latitude:</b> 28°43’ N to 31°27’ N</p>
                </div>
            </div>
            <div class="clearfix"></div>

        </section>
        <footer>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bottom_nav">
                <ul>
                    <li><a href="/WebAppUK/disclaimer.aspx">Disclaimer and Policies</a></li>
                    <li><a href="#">Sitemap</a></li>
                    <li><a href="/WebAppUK/help.aspx">Help</a></li>
                    <li><a href="/WebAppUK/terms_conditions.aspx">Terms and Conditions </a></li>
                    <li><a href="/WebAppUK/contact_us.aspx">Contact</a></li>
                </ul>
                <div class="clearfix"></div>
                <div class="total_visitor"><span class="visitor_txt">TOTAL VISITORS</span><span class="visitor_count">14872</span></div>
                <div class="today_visitor"><span class="visitor_txt">TODAY VISITORS</span><span class="visitor_count">264</span></div>
                <div class="col-lg-12 text-center wthree-social">
                    <ul>
                        <li class="w3_facebook"><a onclick="window.open('https://www.facebook.com/UttarakhandDIPR');"><i class="fa fa-facebook"></i>Facebook</a></li>
                        <li class="w3_twitter"><a onclick="window.open('https://twitter.com/Dipr_uk');"><i class="fa fa-twitter"></i>Twitter </a></li>
                        <li class="w3_dribbble"><a onclick="window.open('https://www.youtube.com/channel/UCmpGVCWt-yGZHI5LTzNhsDQ');"><i class="fa fa-youtube"></i>Youtube</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
                <p class="ptop15" style="color: #fff;">© All rights reserved CSC, SPV.</p>
            </div>
        </footer>
    </form>
</body>
</html>
