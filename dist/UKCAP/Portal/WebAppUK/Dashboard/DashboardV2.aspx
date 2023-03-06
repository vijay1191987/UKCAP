<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardV2.aspx.cs" Inherits="CitizenPortal.WebAppUK.Dashboard.DashboardV2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>UK Common Application Portal</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="css/navpanel.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#RevenueDeptServvices").hide();
            $("#TransactionDtlTble").hide();
            $("#ViewTranactionDtl").click(function () {
                $("#TransactionDtlTble").show();
            });
            $("#RevenueDept").click(function () {
                $("#RevenueDeptServvices").slideToggle(600);
                $(this).toggleClass("active");
            });            
        });
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
            $(".side-nav .collapse").on("hide.bs.collapse", function () {
                $(this).prev().find(".fa").eq(1).removeClass("fa-angle-right").addClass("fa-angle-down");
            });
            $('.side-nav .collapse').on("show.bs.collapse", function () {
                $(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");
            });
        })

        function showonlyone(id) {
            debugger;
            var divid = 'RevenueDeptServvices' + id;
            var anchtag = '#anch' + id;
            $('.deptservices_box').each(function (index) {
                debugger;
                if ($(this).attr("id") == divid) {
                    $(this).show(200);                   
                }
                else {
                    $(this).hide(600);                   
                }
            });
            $("a.selectedDept").removeClass("selectedDept");
            $(anchtag).addClass("selectedDept");
            return false;
        }
        function RedirectToService(p_URL) {
            debugger;

            window.location.href = p_URL + "&UID=" + $("#HFUID").val();
            //alert(p_URL + "&UID=" + $("#HFUID").val());
            return false;
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
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
                            <img src="img/dashborad_logo.png" class="img-responsive" />
                            Welcome to Dashboard
                        </a>
                    </div>
                    <!-- Top Menu Items -->
                    <ul class="nav navbar-right top-nav">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user fa-fw"></i>Mohan Kumar <b class="fa fa-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="fa fa-fw fa-user"></i>Edit Profile</a></li>
                                <li><a href="#"><i class="fa fa-fw fa-cog"></i>Change Password</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-fw fa-power-off"></i>Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav new_leftnav" style="background-color: #32468B; background-image: url(img/leftpanel_bg.jpg); background-repeat: no-repeat; background-size: cover;">
                            <li class="userdtlbox text-center">
                                <img src="img/dummy_userpic.png" class="img-responsive" />
                                <span class="wlcmemsg">Welcome</span> <span class="usernmetxt">Mohan Kumar</span> <span class="useremailid"><i class="fa fa-fw fa-envelope"></i>mohan.kumar@gmail.com</span></li>
                            <li>
                                <a href="faq"><i class="fa fa-fw fa-dashboard"></i>DASHBOARD</a>
                            </li>

                            <li>
                                <a href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-fw fa-user"></i>PROFILE <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                                <ul id="submenu-1" class="collapse">
                                    <li><a href="#"><i class="fa fa-angle-double-right fa-fw"></i>Edit Profile</a></li>
                                    <li><a href="#"><i class="fa fa-angle-double-right fa-fw"></i>Change Password</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="small btn-block">Permanent Address</span>PRAMOD JHA, HJGJHG, 
876876, 876876, JHGJH
GHJ, 07, 090, 00432, 65
4654</a>
                            </li>
                            <li>
                                <a href="#"><span class="small btn-block">Present Address</span>PRAMOD JHA, HJGJHG, 
876876, 876876, JHGJH
GHJ, 07, 090, 00432, 65
4654</a>
                            </li>
                            <li>
                                <a href="faq"><i class="fa fa-fw fa-lock"></i>LOGOUT</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>

                <div id="page-wrapper">
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="row" id="main">
                            <div class="col-sm-6 col-md-6">
                                <h1>Welcome Admin!</h1>
                            </div>
                            <div class="col-sm-6 col-md-6" style="margin-top: 20px;">
                                <a href="#" class="btn btn-success pull-right" id="ViewTranactionDtl">VIEW TRANSACTION</a>
                            </div>
                            <div class="col-sm-12 col-md-12">
                                <h4 style="color: #fff; background-color: #383D5A; border-color: #555A8A; padding: 13px; border-top-left-radius: 2px; border-top-right-radius: 2px;">Department & Services</h4>
                                 <asp:Panel ID="pnlServices" runat="server" />

                           <%--     <div class="panel-body">
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt">
                                            <div class="deptbox">Commissioner of Police Uttarakhand</div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt">
                                            <div class="deptbox">Social Security and Empowerment</div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt">
                                            <div class="deptbox">Agriculture Department</div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt" id="RevenueDept">
                                            <div class="deptbox">Revenue Department</div>
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="deptservices_box" id="RevenueDeptServvices">
                                        <div class="col-lg-3 style_prevu_kit">
                                            <a href="#">
                                                <div class="servicesholder">
                                                    <div class="serviceicon">
                                                        <img src="img/birth_icon.png" />
                                                    </div>
                                                    <div class="servicetxt">Birth Certificate</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 style_prevu_kit">
                                            <a href="#">
                                                <div class="servicesholder">
                                                    <div class="serviceicon">
                                                        <img src="img/death_icon.png" />
                                                    </div>
                                                    <div class="servicetxt">Death Certificate</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 style_prevu_kit">
                                            <a href="#">
                                                <div class="servicesholder">
                                                    <div class="serviceicon">
                                                        <img src="img/domicile_icon.png" />
                                                    </div>
                                                    <div class="servicetxt">Domicile Certificate</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 style_prevu_kit">
                                            <a href="#">
                                                <div class="servicesholder">
                                                    <div class="serviceicon">
                                                        <img src="img/houserent_icon.png" />
                                                    </div>
                                                    <div class="servicetxt">House Rent Agreement</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 style_prevu_kit">
                                            <a href="#">
                                                <div class="servicesholder">
                                                    <div class="serviceicon">
                                                        <img src="img/incomecertificate_icon.png" />
                                                    </div>
                                                    <div class="servicetxt">Income Certificate</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 style_prevu_kit">
                                            <a href="#">
                                                <div class="servicesholder">
                                                    <div class="serviceicon">
                                                        <img src="img/salehouse_icon.png" />
                                                    </div>
                                                    <div class="servicetxt">Sale of a House</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 style_prevu_kit">
                                            <a href="#">
                                                <div class="servicesholder">
                                                    <div class="serviceicon">
                                                        <img src="img/seniorcitizen_icon.png" />
                                                    </div>
                                                    <div class="servicetxt">Senior Citizen</div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="mtop10"></div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt">
                                            <div class="deptbox">Public Health Department</div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt">
                                            <div class="deptbox">General Administrator</div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt">
                                            <div class="deptbox">Home Department</div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt" id="RevenueDept2">
                                            <div class="deptbox">UK Public Service Commission</div>
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="mtop10"></div>
                                    <div class="col-lg-3">
                                        <a href="#" class="deptnametxt" id="RevenueDept3">
                                            <div class="deptbox">Housing & Urban Development</div>
                                        </a>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mtop10"></div>
                        <div class="row" id="TransactionDtlTble">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color:#383D5A;">
                                        <div class="row">
                                            <div class="col-lg-8" style="color:#fff; font-size:16px; padding-top:10px;">
                                                <i class="fa fa-tasks fa-fw"></i>Transaction Details
                                            </div>
                                            <div class="col-lg-4 text-right">
                                                <div class="dataTables_filter" id="dataTables-example_filter">
                                                    <input aria-controls="dataTables-example" placeholder="Search" class="form-control input-sm" type="search"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <div class="dataTable_wrapper">
                                            <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
                                                <div class="">
                                                    <div class="" style="overflow: scroll; height: 200px;">
                                                        <div>
                                                            <table class="table table-striped table-bordered" cellspacing="0" rules="all" border="1" id="gridview" style="border-collapse: collapse;">
                                                                <tbody>
                                                                    <tr>
                                                                        <th scope="col" style="display: none">SvcID</th>
                                                                        <th scope="col" style="display: none">PaymentStatus</th>
                                                                        <th scope="col">Application ID</th>
                                                                        <th scope="col">Application Date</th>
                                                                        <th scope="col">Service</th>
                                                                        <th scope="col">Applicant Name</th>
                                                                        <th scope="col">Status</th>
                                                                        <th scope="col">View</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001757</td>
                                                                        <td>23/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_0" onclick="TakeAction('418', '999000001757', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001742</td>
                                                                        <td>23/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_1" onclick="TakeAction('418', '999000001742', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001735</td>
                                                                        <td>23/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_2" onclick="TakeAction('418', '999000001735', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001726</td>
                                                                        <td>23/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_3" onclick="TakeAction('418', '999000001726', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001719</td>
                                                                        <td>23/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_4" onclick="TakeAction('418', '999000001719', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001703</td>
                                                                        <td>23/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_5" onclick="TakeAction('418', '999000001703', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001695</td>
                                                                        <td>23/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_6" onclick="TakeAction('418', '999000001695', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001682</td>
                                                                        <td>22/01/2018 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_7" onclick="TakeAction('415', '999000001682', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001676</td>
                                                                        <td>22/01/2018 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_8" onclick="TakeAction('417', '999000001676', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001669</td>
                                                                        <td>22/01/2018 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_9" onclick="TakeAction('416', '999000001669', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001653</td>
                                                                        <td>22/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_10" onclick="TakeAction('418', '999000001653', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001648</td>
                                                                        <td>22/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_11" onclick="TakeAction('418', '999000001648', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001630</td>
                                                                        <td>22/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_12" onclick="TakeAction('418', '999000001630', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">463</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001624</td>
                                                                        <td>20/01/2018 </td>
                                                                        <td>Lost &amp; Found</td>
                                                                        <td>bnnvb</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_13" onclick="TakeAction('463', '999000001624', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">424</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001607</td>
                                                                        <td>16/01/2018 </td>
                                                                        <td>Senior Citizen Identity Card</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_14" onclick="TakeAction('424', '999000001607', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">463</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001598</td>
                                                                        <td>16/01/2018 </td>
                                                                        <td>Lost &amp; Found</td>
                                                                        <td>sdsdsd</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_15" onclick="TakeAction('463', '999000001598', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">106</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001496</td>
                                                                        <td>11/01/2018 </td>
                                                                        <td>Madhu Babu Pension Yojana (MBPY)</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_16" onclick="TakeAction('106', '999000001496', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001289</td>
                                                                        <td>03/01/2018 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_17" onclick="TakeAction('416', '999000001289', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001270</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_18" onclick="TakeAction('417', '999000001270', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001258</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_19" onclick="TakeAction('415', '999000001258', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001243</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_20" onclick="TakeAction('418', '999000001243', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001236</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_21" onclick="TakeAction('418', '999000001236', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001227</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_22" onclick="TakeAction('418', '999000001227', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001215</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_23" onclick="TakeAction('418', '999000001215', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001204</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_24" onclick="TakeAction('416', '999000001204', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001197</td>
                                                                        <td>02/01/2018 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_25" onclick="TakeAction('416', '999000001197', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000001184</td>
                                                                        <td>30/12/2017 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_26" onclick="TakeAction('416', '999000001184', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000466</td>
                                                                        <td>02/06/2017 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_27" onclick="TakeAction('418', '999000000466', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000450</td>
                                                                        <td>02/06/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_28" onclick="TakeAction('415', '999000000450', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">105</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000409</td>
                                                                        <td>01/06/2017 </td>
                                                                        <td>National Family Benefit Scheme (NFBS)</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_29" onclick="TakeAction('105', '999000000409', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000237</td>
                                                                        <td>01/06/2017 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_30" onclick="TakeAction('417', '999000000237', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">106</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000179</td>
                                                                        <td>01/06/2017 </td>
                                                                        <td>Madhu Babu Pension Yojana (MBPY)</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_31" onclick="TakeAction('106', '999000000179', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">105</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000167</td>
                                                                        <td>01/06/2017 </td>
                                                                        <td>National Family Benefit Scheme (NFBS)</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_32" onclick="TakeAction('105', '999000000167', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000114</td>
                                                                        <td>31/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_33" onclick="TakeAction('415', '999000000114', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000105</td>
                                                                        <td>31/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_34" onclick="TakeAction('415', '999000000105', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>999000000095</td>
                                                                        <td>31/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_35" onclick="TakeAction('415', '999000000095', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000764</td>
                                                                        <td>25/05/2017 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_36" onclick="TakeAction('418', '407000000764', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000755</td>
                                                                        <td>25/05/2017 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_37" onclick="TakeAction('416', '407000000755', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000740</td>
                                                                        <td>25/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_38" onclick="TakeAction('415', '407000000740', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000738</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_39" onclick="TakeAction('415', '407000000738', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000729</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_40" onclick="TakeAction('415', '407000000729', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000717</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_41" onclick="TakeAction('415', '407000000717', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000701</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_42" onclick="TakeAction('415', '407000000701', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000698</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_43" onclick="TakeAction('415', '407000000698', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000680</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_44" onclick="TakeAction('415', '407000000680', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000679</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_45" onclick="TakeAction('415', '407000000679', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000667</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_46" onclick="TakeAction('415', '407000000667', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000651</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_47" onclick="TakeAction('415', '407000000651', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000646</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_48" onclick="TakeAction('415', '407000000646', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000633</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_49" onclick="TakeAction('415', '407000000633', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000622</td>
                                                                        <td>22/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_50" onclick="TakeAction('415', '407000000622', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000614</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_51" onclick="TakeAction('415', '407000000614', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000605</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_52" onclick="TakeAction('415', '407000000605', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000596</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_53" onclick="TakeAction('415', '407000000596', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000583</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_54" onclick="TakeAction('415', '407000000583', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000577</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_55" onclick="TakeAction('415', '407000000577', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000565</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_56" onclick="TakeAction('415', '407000000565', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000554</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_57" onclick="TakeAction('415', '407000000554', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000549</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_58" onclick="TakeAction('415', '407000000549', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000531</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_59" onclick="TakeAction('415', '407000000531', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000520</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_60" onclick="TakeAction('415', '407000000520', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000512</td>
                                                                        <td>21/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_61" onclick="TakeAction('415', '407000000512', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000508</td>
                                                                        <td>20/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_62" onclick="TakeAction('415', '407000000508', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000362</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_63" onclick="TakeAction('415', '407000000362', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000358</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_64" onclick="TakeAction('417', '407000000358', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000343</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_65" onclick="TakeAction('417', '407000000343', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000336</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_66" onclick="TakeAction('415', '407000000336', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000327</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_67" onclick="TakeAction('417', '407000000327', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000315</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_68" onclick="TakeAction('416', '407000000315', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000304</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_69" onclick="TakeAction('417', '407000000304', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000294</td>
                                                                        <td>18/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_70" onclick="TakeAction('415', '407000000294', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000287</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_71" onclick="TakeAction('415', '407000000287', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000273</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_72" onclick="TakeAction('415', '407000000273', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000260</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_73" onclick="TakeAction('415', '407000000260', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000256</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_74" onclick="TakeAction('415', '407000000256', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000241</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_75" onclick="TakeAction('415', '407000000241', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000239</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_76" onclick="TakeAction('415', '407000000239', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000225</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_77" onclick="TakeAction('415', '407000000225', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000218</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_78" onclick="TakeAction('415', '407000000218', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000202</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_79" onclick="TakeAction('415', '407000000202', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000195</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_80" onclick="TakeAction('415', '407000000195', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000182</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_81" onclick="TakeAction('415', '407000000182', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000176</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_82" onclick="TakeAction('415', '407000000176', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000169</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_83" onclick="TakeAction('415', '407000000169', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000153</td>
                                                                        <td>17/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_84" onclick="TakeAction('415', '407000000153', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000148</td>
                                                                        <td>16/05/2017 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_85" onclick="TakeAction('416', '407000000148', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000130</td>
                                                                        <td>16/05/2017 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_86" onclick="TakeAction('416', '407000000130', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000124</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_87" onclick="TakeAction('415', '407000000124', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000111</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_88" onclick="TakeAction('418', '407000000111', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000107</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_89" onclick="TakeAction('416', '407000000107', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000097</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_90" onclick="TakeAction('415', '407000000097', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000084</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_91" onclick="TakeAction('415', '407000000084', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">418</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000078</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Death Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_92" onclick="TakeAction('418', '407000000078', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">416</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000066</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Birth Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_93" onclick="TakeAction('416', '407000000066', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">417</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000050</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Domicile Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_94" onclick="TakeAction('417', '407000000050', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="display: none">415</td>
                                                                        <td style="display: none">UnPaid</td>
                                                                        <td>407000000045</td>
                                                                        <td>15/05/2017 </td>
                                                                        <td>Income Certificate</td>
                                                                        <td>moni</td>
                                                                        <td>UnPaid</td>
                                                                        <td title="View" style="cursor: Pointer;"><a id="TakeAction_95" onclick="TakeAction('415', '407000000045', 'U', '')" style="cursor: pointer; font-size: 10pt; font-family: Arial; color: Firebrick; text-decoration: none;">View</a></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="display: none;">
                                                    <div class="col-sm-6">
                                                        <div aria-live="polite" role="status" id="dataTables-example_info" class="dataTables_info">Showing 1 to 10 of 57 entries</div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div id="dataTables-example_paginate" class="dataTables_paginate paging_simple_numbers">
                                                            <ul class="pagination">
                                                                <li id="dataTables-example_previous" tabindex="0" aria-controls="dataTables-example" class="paginate_button previous disabled"><a href="#">Previous</a></li>
                                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button active"><a href="#">1</a></li>
                                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">2</a></li>
                                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">3</a></li>
                                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">4</a></li>
                                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">5</a></li>
                                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">6</a></li>
                                                                <li id="dataTables-example_next" tabindex="0" aria-controls="dataTables-example" class="paginate_button next"><a href="#">Next</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.table-responsive -->
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /#page-wrapper -->
            </div>
            <!-- /#wrapper -->
        </div>
    </form>
</body>
</html>
