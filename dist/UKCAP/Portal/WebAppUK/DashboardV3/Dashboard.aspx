<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CitizenPortal.WebAppUK.DashboardV3.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - Uttarakhand Application Portal</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WebAppUK/DashboardV3/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="/WebAppUK/DashboardV3/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/WebAppUK/DashboardV3/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/WebAppUK/DashboardV3/css/navpanel.css" type="text/css" rel="stylesheet" />
    <link href="/WebAppUK/DashboardV3/css/dashboardstyle.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#RevenueDeptServvices").hide();
            $("#RevenueDept").click(function ()
            {
                $("#RevenueDeptServvices").slideToggle(600);
                $(this).toggleClass("active");
            });

            $(".set > a").on("click", function ()
            {
                if ($(this).hasClass("active"))
                {
                    $(this).removeClass("active");
                    $(this)
                        .siblings(".content")
                        .slideUp(200);
                    $(".set > a i")
                        .removeClass("fa-minus")
                        .addClass("fa-plus");
                } else
                {
                    $(".set > a i")
                        .removeClass("fa-minus")
                        .addClass("fa-plus");
                    $(this)
                        .find("i")
                        .removeClass("fa-plus")
                        .addClass("fa-minus");
                    $(".set > a").removeClass("active");
                    $(this).addClass("active");
                    $(".content").slideUp(200);
                    $(this)
                        .siblings(".content")
                        .slideDown(200);
                }
            });

            $("#btnClose").click(function ()
            {
                $("#costumModal2").hide();
            });
        });

        function getUrlVars(p_URL)
        {
            var vars = [], hash;
            //var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            var hashes = p_URL.slice(p_URL.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++)
            {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }

        $(function ()
        {
            $('[data-toggle="tooltip"]').tooltip();
            $(".side-nav .collapse").on("hide.bs.collapse", function ()
            {
                $(this).prev().find(".fa").eq(1).removeClass("fa-angle-right").addClass("fa-angle-down");
            });
            $('.side-nav .collapse').on("show.bs.collapse", function ()
            {
                $(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");
            });
        });

        function RedirectToService(p_URL)
        {
            var qs = getUrlVars(p_URL);
            var SvcID = qs["SvcID"]; //or var SvcID = getUrlVars()["SvcID"];
            if (SvcID != "508")
            {
                getDocumentList(SvcID);
            }
            else
            {
                return window.location.href = p_URL + "&UID=" + $("#HFUID").val();
            }
            $("#btnInstruction").bind("click", function (e)
            {
                var chkdeclaration = 0;
                if ($('#chkDeclaration').is(":checked"))
                {
                    // it is checked
                    chkdeclaration = 1;
                }
                if (chkdeclaration == 0)
                {
                    alert("Please check Declaration. ");
                    return false;
                }
                return window.location.href = p_URL + "&UID=" + $("#HFUID").val();
            });
            return false;
        }

        function getDocumentList(SvcID)
        {
            var SelState = $('#drpStateName').val();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebAppUK/DashboardV3/Dashboard.aspx/GetDocumentList",
                data: '{"ServiceID":"' + SvcID + '"}',
                dataType: "json",
                success: function (data)
                {
                    $('#instruction').empty();
                    $('#instruction').append(data.d);
                    $('#costumModal2').show();
                }
            });
        }
    </script>

    <style>
        .table {
            font-size: 1.3em;
        }

            .table th {
                background: #5d6d7e !important;
                color: #fff;
                font-weight: normal;
                padding: 10px;
            }

        .user_img {
            border-radius: 200px;
            height: 100px;
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="costumModal2" class="modal" data-easein="flipXIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" id="btnClose" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                        <h3 class="modal-title" style="font-weight: bold;">Required Documents for the Services</h3>
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-12 instruction_txt" id="instruction" runat="server">
                            <%--<ol>
                                <li>Aadhaar Card </li>
                                <li>Pan Card </li>
                                <li>ID Card </li>
                                <li>Driving License</li>
                                <li>10th/12th Marksheet </li>
                                <li>Treasury Invoice</li>
                                <li>Imitation of Khatoni</li>
                                <li>Copy of Birth Certificate </li>
                                <li>Assessment of Receipt / Property of the Municipality</li>
                                <li>Copy of Family Register</li>
                                <li>Certified Copy of Bank Passbook</li>
                                <li>Certified Copy of Ration Card</li>
                                <li>Certified from ward Member and Executive Officer</li>
                                <li>Certified Copy of Education Marksheet </li>
                                <li>Property Related Documents</li>
                                <li>Service Provider's Certificate</li>
                            </ol>--%>
                        </div>
                        <div class="col-lg-12 text-center ptop10">
                            <p style="font-size: 1.5em; font-weight: bold;">
                                <label class="mychckbx">
                                    <input type="checkbox" runat="server" id="chkDeclaration" />
                                    <span class="checkmark"></span>
                                </label>
                                I have read all the terms & conditions
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" id="btnInstruction" class="btn btn-primary" value="Proceed" title="Proceed to Service" />
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div id="throbber" style="display: none; min-height: 120px;"></div>
            <div id="noty-holder"></div>
            <div id="wrapper">
                <!-- Navigation -->
                <nav class="navbar navbar-inverse navbar-fixed-top toppanel_box" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">
                            <img src="/WebAppUK/DashboardV3/img/dashborad_logo.png" class="img-responsive" />
                            Uttrakhand Common Application Portal
                        </a>
                    </div>
                    <!-- Top Menu Items -->
                    <ul class="nav navbar-right top-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user fa-fw"></i><span id="lblName" runat="server"></span><b class="fa fa-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <asp:LinkButton runat="server" ID="LinkButton3" OnClick="btnProfile_Click"><i class="fa fa-fw fa-user"></i>Edit Profile</asp:LinkButton></li>
                                <li class="divider"></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="LinkButton2" OnClick="btnChgPass_Click"><i class="fa fa-fw fa-cog"></i>Change Password</asp:LinkButton></li>
                                <li class="divider"></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="LinkButton1" OnClick="btnLogout_Click"><i class="fa fa-fw fa-power-off"></i>Logout</asp:LinkButton></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav new_leftnav" style="background-color: #32468B; background-image: url(img/leftpanel_bg.jpg); background-repeat: no-repeat; background-size: cover;">
                            <li class="userdtlbox text-center">
                                <img src="/WebAppUK/DashboardV3/img/dummy_userpic.png" class="img-responsive user_img" id="userImg" runat="server" />
                                <span class="wlcmemsg">Welcome</span> <span class="usernmetxt" id="lblUserName" runat="server"></span><span class="useremailid" id="lblEmailID" runat="server"><i class="fa fa-fw fa-envelope"></i></span></li>
                            <li>
                                <asp:LinkButton runat="server" ID="btnDashboard" OnClick="btnDashboard_Click"><i class="fa fa fa-bank fa-fw"></i>DEPARTMENT SERVICES</asp:LinkButton>
                            </li>
                            <%--<li>
                                <a href="#" data-toggle="collapse" data-target="#submenu-1" class="" aria-expanded="true"><i class="fa fa-fw fa-dashboard"></i>DASHBOARD<i class="fa fa-fw fa-angle-down pull-right"></i></a>
                                <ul id="submenu-1" class="collapse">

                                </ul>
                            </li>--%>
                            <li>
                                <asp:LinkButton runat="server" ID="btnTransDetail" OnClick="btnTransDetail_Click"><i class="fa fa-book fa-fw"></i>TRANSACTION DETAIL</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton runat="server" ID="btnProfile" OnClick="btnProfile_Click"><i class="fa fa-fw fa-user"></i>EDIT PROFILE</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton runat="server" ID="btnChgPass" OnClick="btnChgPass_Click"><i class="fa fa-fw fa-cog"></i>CHANGE PASSWORD</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton runat="server" ID="btnBriefcase" OnClick="btnBriefcase_Click"><i class="fa fa-briefcase fa-fw"></i>DOCUMENT BRIEFCASE</asp:LinkButton>
                            </li>
                            <li>
                                <%--<a href="faq"><i class="fa fa-fw fa-lock"></i>LOGOUT</a>--%>
                                <asp:LinkButton runat="server" ID="btnLogout" OnClick="btnLogout_Click"><i class="fa fa-fw fa-lock"></i>LOGOUT</asp:LinkButton>
                            </li>
                            <li style="color: #fff; padding-top: 40%; padding-left: 5%;">© All rights reserved CSC, SPV.</li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
                <div id="page-wrapper">
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="row" id="main">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <h4 style="color: #fff; background-color: #383D5A; border-color: #555A8A; padding: 13px;">Department & Services</h4>
                                <div class="accordion-container">
                                    <asp:Panel ID="pnlServices" runat="server"></asp:Panel>
                                </div>
                                <!-- panel -->
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->
        <asp:HiddenField ID="HFServiceID" runat="server" />
        <asp:HiddenField ID="HFUID" runat="server" />
        <script src="/WebAppUK/DashboardV3/js/velocity.min.js"> </script>
        <script src="/WebAppUK/DashboardV3/js/velocity.ui.min.js"></script>
        <script src="/WebAppUK/DashboardV3/js/modaleffect.js"></script>
    </form>
</body>
</html>