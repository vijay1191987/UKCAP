<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="CitizenPortal.WebAppUK.controls.header" %>
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
                                <li><asp:LinkButton runat="server" ID="home" class="active" OnClick="home_Click"><span class="topnav_icon home_icon"></span>Home</asp:LinkButton></li>
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
