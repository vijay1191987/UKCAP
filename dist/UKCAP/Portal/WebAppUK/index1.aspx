<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index1.aspx.cs" Inherits="CitizenPortal.WebAppUK.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New UK Portal Page</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <script src="/WebAppUK/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="/WebAppUK/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/WebAppUK/css/common.css" type="text/css" rel="stylesheet" />
    <link href="/WebAppUK/css/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="/WebAppUK/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="css/newhomepage.css" type="text/css" rel="stylesheet" />
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
    <style>
        .mright5 { margin-right:5px !important;
        }
    </style>
</head>
<body id="bodytxt">
    <form id="form1" runat="server">
        <div class="containerw100">
            <header>
                <div class="row topband pbottom0">
                    <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12">
                        <div class="inline-block">
                            <img src="/WebAppUK/img/uttarakhand_state_logo.png" alt="" class="img-responsive" style="width: 105px;" />
                        </div>
                    <div class="inline-block logo_txt">
                        UTTARAKHAND 
                         <span>(COMMON APPLICATION PORTAL)</span>
                        <span>(An initiative of Uttarakhand Govt.)</span>
                    </div>
                    </div>
                    <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 text-right ptop10 toplink">
                        <span><a href="#" class="skipnav">Skip to Navigation</a>  |  <a href="#" class="content">Skip to Content</a></span>
                        <span class="dcrsefnt"><a href="#" class="fntadjust" id="decreasetxt">A-</a></span>
                        <span class="nrmlfnt" style=""><a href="#" class="fntadjust" id="normaltxt">A</a></span>
                        <span class="incrsefnt"><a href="#" class="fntadjust" id="increasetxt">A+</a></span>
                        <div class="clearfix"></div>
                        <div>
                            <span id="demo"></span>
                            <img src="/WebAppUK/img/digitalindia_logo.png" alt="Ditigal India" class="img-responsive pull-right mtop10" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div style="display: table; text-align: center; margin: 0 auto;">
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
                            <div id="navbar" class="navbar-collapse collapse rspnsvenav" aria-expanded="false" style="height: 1px;">
                                <ul class="nav navbar-nav">
                                    <li><a href="/WebAppUK/HomeV3/index.aspx" id="home" class="active"><i class="fa fa-home fa-fw mright5"></i>Home</a></li>
                                    <li><a href="/WebAppUK/whos_who.aspx" id="about"><i class="fa fa-users fa-fw mright5"></i>Who’s Who </a></li>
                                    <li><a href="/WebAppUK/state_profile.aspx"><i class="glyphicon glyphicon-flag fa-fw mright5"></i>State Profile </a></li>
                                    <li><a href="/WebAppUK/apex_bodies.aspx"><i class="fa fa-handshake-o fa-fw mright5"></i>Apex Bodies</a></li>
                                    <li><a href="/WebAppUK/divisions_mandal.aspx"><i class="fa fa-th-large fa-fw mright5"></i>Divisions</a></li>
                                    <li><a href="/WebAppUK/districts_administration.aspx"><i class="fa fa-arrows fa-fw mright5"></i>Districts </a></li>
                                    <li><a href="/WebAppUK/acts.aspx"><i class="fa fa-gavel fa-fw mright5"></i>Acts</a></li>
                                    <li><a href="/WebAppUK/goi_websites.aspx"><i class="glyphicon glyphicon-random fa-fw mright5"></i>GOI Websites</a></li>
                                </ul>
                            </div>
                            <!--/.nav-collapse -->
                        </nav>
                    </div>
                </div>

            </header>
            <div class="clearfix"></div>
            <section>

                <div class="col-lg-9 newsliderbg">
                    <h3>Welcome to Uttarakhand</h3>
                    <p>
                        Uttarakhand was formed on 9th November 2000 as the 27th State of India, when it was carved out of northern
Uttar Pradesh. Located at the foothills of the Himalayan mountain ranges, it is largely a hilly State, having international boundaries with China (Tibet) in the north and Nepal in the east.
                    </p>

                </div>
                <div class="col-lg-3 rightpnl">
                    <a href="/Account/Login" class="citizenlogin_btn"><i class="fa fa-lock fa-fw"></i>CITIZEN LOGIN</a>
                    <a href="/Account/Login" class="csclogin_btn"><i class="fa fa-user fa-fw"></i>CSC LOGIN</a>
                    <p class="col-lg-12 ptop10">
                        Create your profile with this 
portal to apply online for notified services
                    </p>
                    <a href="../WebApp/Registration/CitizenRegistration.aspx?SvcID=995" class="newreg_btn">New User? Register Here</a>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 pleft0 pright0">
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

                                                        <p class="org"><span class="count">3</span> +</p>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 text-center count-div-brd">
                                                    <div class="count-div">
                                                        <p>Citizen Services</p>

                                                        <p class="gree"><span class="count">80</span> +</p>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 text-center">
                                                    <div class="count-div">
                                                        <p>Citizen Transaction</p>

                                                        <p class="blu"><span class="count">1000</span> +</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="item">
                                            <div class="row-fluid">
                                                <div class="col-xs-12 col-sm-4 col-md-4 text-center count-div-brd">
                                                    <div class="count-div">
                                                        <p>Total CSC</p>

                                                        <p class="org"><span class="count">890</span> +</p>
                                                    </div>
                                                </div>

                                                <%--   <div class="col-xs-12 col-sm-4 col-md-4 text-center ">
                                                    <div class="count-div">
                                                        <p>Digital Signed Certificate</p>

                                                        <p class="gree"><span class="count">80,78,225</span> +</p>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4 col-md-4 text-center count-div-brd">
                                                    <div class="count-div">
                                                        <p>SMS sent to Citizen</p>

                                                        <p class="blu"><span class="count">10,73,77,876</span> +</p>
                                                    </div>
                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left carousel-control" data-slide="prev" href="#myCarousel">‹</a> <a class="right carousel-control" data-slide="next" href="#myCarousel">›</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 all_service_hold text-center pbtm50">
                    <h1>Available Online Services for Citizens</h1>
                    <div class="clearfix"></div>
                    <div class="col-lg-1 services_link"></div>
                    <div class="col-lg-2 services_link">
                        <a href="/Account/Login" class="">
                            <div class="birth_box">
                                <i class="fa fa-university fa-4x inline-block"></i>
                                <%--<img src="img/birth_icon.png" alt="" class="img-responsive inline-block" />--%>
                                <p>
                                    Apply for <span>Citizen Services</span>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 services_link">
                        <a href="http://5.79.69.86:7301/" class="" target="_blank">
                            <div class="domicile_box" style="padding-top:40px !important;">
                                
                                <img src="img/gmvn_logo.jpg" class="img-responsive inline-block" alt="GMVN" />

                                <p>
                                    Book for <span>Garwal Mandal<br /> Vikas Nigam</span>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 services_link">
                        <a href="http://5.79.69.86:7270/Citizen/Forms/Index.aspx" class="" target="_blank">
                            <div class="income_box">
                                <i class="fa fa fa-paw fa-4x inline-block"></i>


                                <p>
                                    Book for <span>Jim Corbett Park</span>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 services_link">
                        <a href="http://104.211.245.85/charDhaam/index.aspx" target="_blank" class="">
                            <div class="oldage_box">
                                <img src="img/aadhaar_icon.png" alt="" class="img-responsive inline-block" />
                                <p>
                                    UID Registration For <span>Char Dham Yatra</span>
                                </p>
                            </div>
                        </a>
                    </div>

                    <%--<div class="col-lg-2 services_link">
            <a href="#" class="">
                <div class="income_box">
                    <i class="fa fa fa-street-view fa-4x inline-block"></i>
                   
                    <img src="img/income_icon.png" alt="" class="img-responsive inline-block" />
                    <p>
                        Track <span>Application</span>
                    </p>
                </div>
            </a>
                </div>--%>
                    <%--<div class="col-lg-2 services_link">
                        <a href="DomicileCertificate/DomicileForm.aspx" class="">
                            <div class="domicile_box">
                                <i class="fa fa fa-map-marker fa-4x inline-block"></i>
                                <img src="img/domicile_icon.png" alt="" class="img-responsive inline-block" />
                                <p>
                                    Locate <span>CSC Center</span>
                                </p>
                            </div>
                        </a>
                    </div>--%>
                    <div class="col-lg-2 services_link">
                        <a href="#" class="">
                            <div class="death_box">
                                <i class="fa fa fa-list fa-4x inline-block"></i>
                                <%--<img src="img/death_icon.png" alt="" class="img-responsive inline-block" />--%>
                                <p>
                                    Online <span>Grievance</span>
                                </p>
                            </div>
                        </a>
                    </div>
                </div>
            </section>
            <div class="clearfix"></div>
            <div class="row">
                <footer class="footer_bg">
                    <p>© All rights reserved CSC, SPV.</p>
                </footer>
            </div>

        </div>
    </form>
</body>
</html>
