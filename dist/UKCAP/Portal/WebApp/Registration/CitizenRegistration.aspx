<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CitizenRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Registration.CitizenRegistration" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.2.3.min.js" type="text/javascript"></script>
    <link href="~/WebAppUK/HomeV3/css/homestyle.css" rel="stylesheet" />
    <link href="~/WebAppUK/HomeV3/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/WebAppUK/css/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="~/WebAppUK/css/font-awesome.min.css" type="text/css" rel="stylesheet" />

    <script src="/WebAppUK/HomeV3/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Common/Scripts/metisMenu.js" type="text/javascript"></script>
    <script src="../Common/Scripts/raphael.js" type="text/javascript"></script>
    <script src="../Common/Scripts/morris.js" type="text/javascript"></script>
    <script src="../Common/Scripts/sb-admin-2.js" type="text/javascript"></script>
    <script src="../../WebAppUK/js/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
    <link href="../../WebAppUK/css/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <link href="../../WebAppUK/css/msgBoxLight.css" type="text/css" rel="stylesheet" />
    <script src="../../WebAppUK/js/jquery.msgBox.js" type="text/javascript"></script>

    <script src="../../Scripts/angular.min.js" type="text/javascript"></script>
    <script src="../../PortalScripts/ServiceLanguage.js" type="text/javascript"></script>
    <script src="../../Scripts/md5.js"></script>

    <script src="../Scripts/CommonScript.js" type="text/javascript"></script>
    <script src="../Scripts/ValidationScript.js" type="text/javascript"></script>
    <script src="/WebApp/Registration/CitizenRegistration.js" type="text/javascript"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        h1 {
            margin: 0;
        }

        hr {
            margin: 0;
            padding: 0;
            clear: both;
            border: none;
        }

        #container_lgn {
            width: 512px;
        }

        .login-wrapper {
            width: 450px;
            margin: 0 auto;
        }

        .rbt-grp {
            padding-left: 0;
        }

        .text-align-center {
            text-align: center;
        }

        .Ltitle {
            font-weight: bolder;
            color: rgb(233, 84, 0);
        }

        .sub-title {
            color: rgb(0, 62, 0);
            margin: 2px;
            font-size: 20px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .sub-sub-title {
            color: rgb(0, 29, 0);
            margin-bottom: 10px;
            font-size: 15px;
            font-weight: bold;
            letter-spacing: 1.2px;
        }

        .box-container > .box-body {
            background-color: rgba(252, 252, 252, 0.93) !important;
        }

        .tooltip {
            position: relative;
            display: inline-block;
            border-bottom: 1px dotted black;
        }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: 120px;
                background-color: black;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;
                /* Position the tooltip */
                position: absolute;
                z-index: 1;
                bottom: 100%;
                left: 50%;
                margin-left: -60px;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
            }
    </style>

    <script type="text/javascript">
        $(document).ready(function ()
        {
            $('#divInfo').show();
            $('#divMsg').hide();
            $('#divDetail').hide();
            $('#divBtn').hide();
            $('#divOTP').hide();
            $('#btnProceed').show();
            $('#btnValidateOTP').hide();
            $('#btnOTP').show();
            $('#divbtnOTP').hide();
            $('#txtEmail').focus();

            //$("#btnConfirm").bind("click", function (e) { return SubmitData(); });
        });

        $(function ()
        {
            $('[data-toggle="tooltip"]').tooltip()
        })

        function fnGenOTP()
        {
            $('#divMsg').hide();
            $('#txtSMSCode').val("");

            if (!ValidateForm())
            {
                return;
            }

            var temp = "Gunwant";

            var result = false;

            //var UID = getQueryString("aadhaarNumber");
            //var TransID = getQueryString("transactionId");

            var MobileNo = $("#txtMobile").val();
            $("#txtMobile").prop('disabled', true);
            $("#txtEmail").prop('disabled', true);
            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Citizen/Forms/ValidateUser.aspx/GenerateOTP',
                    data: '{"prefix": "","Data":"' + MobileNo + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response)
                    {

                    },
                    error: function (a, b, c)
                    {
                        alert("2." + a.responseText);
                    }
                })).then(function (data, textStatus, jqXHR)
                {

                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    var strMobile = "";
                    AppID = obj.AppID;
                    var temp = AppID.split('_');
                    strMobile = temp[3];
                    result = true;

                    if (result /*&& jqXHRData_IMG_result*/)
                    {
                        alertPopup('Citizen Registration', '<BR> The 6 digit OTP has been sent to ' + strMobile + ' \Please enter the no to verify');

                        $("#txtMobile").prop('disabled', true);
                        $("#txtEmail").prop('disabled', true);
                        $('#divOTP').show();
                        $('#divbtnOTP').show();
                        $('#btnValidateOTP').show();
                        $('#btnOTP').prop('disabled', true);
                        $('#divVerify').hide();
                        $('#btnOTPLink').css("display", "block");
                        $('#btnOTP').removeClass("btn-primary");
                        $('#btnOTP').addClass("btn-link");
                        $('#txtSMSCode').focus();
                        $("#divMsgTitle").text("Information!");
                        $("#divMsgDtls").text("6 Digit OTP Code has been sent to registered mobile no.");
                        $('#divMsg').show();
                    }
                    else
                    {
                        alertPopup('Form Validation!', '<BR> Sorry! Something went wrong, please try again.');
                        $("#txtMobile").prop('disabled', false);
                        $('#btnOTP').val('Re-Send OTP');
                        $("#MobileNo").val(MobileNo);
                        $("#divCitizenProfile").show();
                        $("#divSearch").hide();
                        $("#HFOTPDone").val("Y");
                        $("#HFMobileNo").val(MobileNo);
                    }
                });// end of Then function of main Data Insert Function

            return false;
        }

        function ValidateForm()
        {
            //CheckAvability();
            var MobileNo = $("#txtMobile").val();
            var length = MobileNo.length;
            var mobmatch1 = /^[6789]\d{9}$/;
            var text = "";
            var opt = "";
            //if ($("#txtMobile").val() == "") {
            //    text += "<BR>" + " \u002A" + " Please enter 10 digit mobile number.";
            //    opt = 1;
            //}

            //if (!mobmatch1.test(MobileNo)) {
            //    text += "<BR>" + " \u002A" + " Please enter valid mobile number";
            //    opt = 1;
            //}

            var emailMatch = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
            var EmailID = $("#txtEmail").val();
            if ((!emailMatch.test(EmailID)) || EmailID == "" || EmailID == null)
            {
                text += "<BR>" + " \u002A" + " Please enter valid email id";
                opt = 1;
            }

            if ((!mobmatch1.test(MobileNo)) || MobileNo == "" || eval(length) < 10)
            {
                text += "<BR>" + " \u002A" + " Please enter valid 10 digit mobile number.";
                opt = 1;
            }

            if ($('#captcha').val() == "" || $('#captcha').val() == null)
            {
                text += "<BR>" + " \u002A" + " Please enter captcha.";
                opt = 1;
            }

            if (opt == "1")
            {
                //$("#divMsgTitle").text("Validate Form!");
                //$('#divMsg').show();
                //$("#divMsgDtls").text(text);
                alertPopup("Please fill following information.", '<BR>' + text);
                return false;
            }

            return true;
        }

        function fnValidateOTP()
        {
            var temp = "Gunwant";
            if ($('#txtSMSCode').val() == "")
            {
                alertPopup('Form Validation!', '<BR> OTP Validation Failed! Please enter correct 6 digit OTP received as SMS from Uttarakhand Govt.');
                return false;
            }
            var result = false;
            //var temp = AppID.split('_');
            //var strMobile = temp[0];
            //var UID = temp[0];
            //var OTP = temp[1];
            AppID = AppID;
            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Citizen/Forms/ValidateUser.aspx/ValidateCitizenOTP',
                    data: '{"prefix": "","Data":"' + AppID + '","EnteredOTP":"' + $('#txtSMSCode').val() + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response)
                    {

                    },
                    error: function (a, b, c)
                    {
                        alert("2." + a.responseText);
                    }
                })).then(function (data, textStatus, jqXHR)
                {

                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    var strMobile = "";
                    var strReturn = obj.AppID;
                    var temp = strReturn.split('_');
                    var cnt = temp[0];
                    result = true;

                    if (cnt == 1)
                    {
                        $('#divDetail').show();
                        $('#btnValidateOTP').hide();
                        $('#btnOTP').hide();
                        $('#txtSMSCode').hide();
                        $('#divOTP').hide();
                        $('#btnOTPLink').hide();
                        $('#divBtn').show();
                        $("#divMsgTitle").text("Information!");
                        $("#divMsgDtls").text("Mobile OTP Successfully Validated, Please fill the necessary details.");
                        $('#divMsg').show();
                        $("#btnConfirm").bind("click", function (e) { return SubmitData(); });

                        //alert($("#") "Basic detail saved from Aadhaar.");
                        //rtnurl = "/WebApp/Citizen/Forms/Register.aspx";
                        //window.location.href = rtnurl;
                        //fnRedirect4Profile(temp[0], temp[1]);
                    }
                    else
                    {
                        alertPopup('Form Validation!', '<BR> OTP Validation Failed! Please enter correct 6 digit OTP received as SMS from Uttarakhand Govt.');

                    }
                    //alert("Basic detail saved from Aadhaar.");
                    //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

                });// end of Then function of main Data Insert Function

            return false;
        }
        var bool = 0;
        function ckhInfo()
        {
            if (bool == 0)
            {
                bool = 1;
                $('#divInfo').hide(500);
            }
            else
            {
                bool = 0;
                $('#divInfo').show(500);
            }
        }

        function SubmitData()
        {
            $("#btnConfirm").prop('disabled', true);

            if (!ValidateForm())
            {
                return;
            }

            var temp = "Gunwant";
            var AppID = "";
            var result = false;

            var datavar = {

                'FullName': $('#txtName').val(),
                'LoginID': $('#txtUserID').val(),
                'Mobile': $('#txtMobile').val(),
                'emailId': $('#txtEmail').val(),
                'Password': $('#txtConfirm').val(),
                'NewPassword': '',
                'Saltkey': '',
            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4),
                "Signature": calcMD5($.stringify(datavar, null, 4))
            };

            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/CitizenRegistration.aspx/InsertLoginDetails',
                    data: $.stringify(obj, null, 4),
                    processData: false,
                    dataType: "json",
                    success: function (response)
                    {

                    },
                    error: function (a, b, c)
                    {
                        $("#btnConfirm").prop('disabled', false);
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
            ).then(function (data, textStatus, jqXHR)
            {
                var obj = jQuery.parseJSON(data.d);
                var html = "";
                AppID = obj.AppID;
                result = true;

                if (result /*&& jqXHRData_IMG_result*/)
                {
                    var url = "/WebApp/Citizen/Forms/Register.aspx";
                    window.location.href = url + '?UserID=' + AppID;
                }
                else
                {
                    alert("Something went wrong, please try again.");
                    $("#btnConfirm").prop('disable', false);
                }
            });// end of Then function of main Data Insert Function

            return false;
        }
    </script>

    <script type="text/javascript">
        //Strong password
        function pwdStrength(p1)
        {
            var lenPwd = p1.value;
            var password = p1.value;

            if (p1.value == "")
            {
                alertPopup('Form Validation', "<BR> Please Enter New Password");
                p1.focus();
                return false;
            }
            if ((lenPwd.length > 6) && password.match(/[a-z]/) && password.match(/[A-Z]/) && password.match(/\d+/) && password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))
            {
                return true;
            }
            else
            {
                //var text = "Password should be minimum of 6 Digit & it should contain combination of numeric,special character and alphabets(Both in Upper and Lower Cases)";
                var text = '<span style="font-weight: bold;">Password must include:</span><br />1. Minimum of Six (6) character<br />2. One character must be in CAPS (Capital Alphabet A-Z)<br />3. One character must be in Numeric&nbsp;(0-9) and<br />4. One character must be special character (!@#$%^&amp;*)'
                alertPopup("Please fill following information.", '<BR>' + text);
                p1.focus();
                p1.value = "";
                return false;
            }
        }

        function repass(p1, p2)
        {
            if (p2.value == "")
            {
                var text = "Please Enter Confirm password";
                alertPopup("Please fill following information.", '<BR>' + text);
                p2.focus();
                return false;
            }

            else if (p1.value != p2.value)
            {
                var text = "Password do not match";
                alertPopup("Please fill following information.", '<BR>' + text);
                p2.focus();
                p2.value = "";
                return false;
            }
            else
            {
                return true;
            }
        }
        //End of strong password
        // for md5 encryption
        function md5auth(seed)
        {

<%--            var newpwd = document.getElementById('<%=txtChangePassword.ClientID %>');
            var repwd = document.getElementById('<%=txtChangePasswordConfirm.ClientID %>');--%>
            var newpassword = newpwd.value;
            var confirmpassword = repwd.value;

            if (newpwd.value == '')
            {
                alertPopup('Form Validation', "<BR> Please enter New password");
                newpwd.focus();
                return false;
            }

            if (repwd.value == '')
            {
                alertPopup('Form Validation', "<BR> Please enter Re-confirm password");
                repwd.focus();
                return false;
            }

            var newHash = calcMD5(newpassword).toUpperCase();
            newpwd.value = newHash;

            var conhash = calcMD5(confirmpassword).toUpperCase();
            repwd.value = conhash;
            return true;

        }
    </script>
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
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
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
                                        <li><a href="/WebAppUK/HomeV3/index.aspx" id="home" class="active"><span class="topnav_icon home_icon"></span>Home</a></li>
                                        <li><a href="#"><span class="topnav_icon whos_icon"></span>Who's Who</a></li>
                                        <li><a href="#"><span class="topnav_icon stateprofile_icon"></span>State Profile</a></li>
                                        <li><a href="#"><span class="topnav_icon apexbodies_icon"></span>Apex Bodies</a></li>
                                        <li><a href="#"><span class="topnav_icon division_icon"></span>Divisions</a></li>
                                        <li><a href="#"><span class="topnav_icon district_icon"></span>Districts</a></li>
                                        <li><a href="#"><span class="topnav_icon act_icon"></span>Acts</a></li>
                                        <li><a href="#"><span class="topnav_icon goi_icon"></span>GOI Websites</a></li>
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
        <div id="intrnlContent" ng-app="appmodule">
            <div ng-controller="ctrl">
                <section class="maindtl_container">
                    <div class="content_cntr">
                        <uc1:FormTitle runat="server" ID="FormTitle" />
                        <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                        <div class="row">
                            <div class="box-container col-lg-12">
                                <p>
                                    <b class="text-danger-green " style="font-size: 20px !important;">Register yourself with Uttarakhand Common Application Portal to avail notifed services.</b>
                                </p>
                            </div>
                        </div>
                        <div class="row" id="divApp" runat="server">
                            <div class="col-md-12">
                                <div class="box-container" style="box-shadow: 1px 1px 12px rgba(0,0,0,0.3); padding: 0;">
                                    <div class="box-heading">
                                        <h4 class="box-title">Login Details <span class="pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                            <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i></span>
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 margin-btm" id="divInfo">
                                            <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10" id="divCredential">

                                                <span style="font-weight: bold; margin-bottom: 5px">Mobile / Email Verification:</span><br />
                                                <span>1. Please enter correct Email Id and Mobile no as all the communication (of Services, notification, status) shall be made through it<br />
                                                    2. Verification Code will be send to entered mobile no.
                                            <br />
                                                    3. OTP will be valid for 20 minutes only.<br />
                                                    2. You request another OTP on clicking on Resend OTP button.
                                                </span>
                                                <br />
                                                <span style="font-weight: bold; margin-bottom: 5px">Password must include:</span><br />
                                                <span>1. Minimum of Eight (8) character<br />
                                                    2. One character must be in CAPS (Capital Alphabet A-Z)
                                <br />
                                                    3. One character must be in Numeric&nbsp;(0-9) and<br />
                                                    4. One character must be special character (!@#$%^&amp;*)
                                                </span>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                                <div class="alert alert-success mt0 mbtm10" id="divMsg" style="font-size: 16px !important">
                                                    <b>
                                                        <p class="text-justify" id="divMsgTitle"></p>
                                                    </b>
                                                    <span class="text-justify" id="divMsgDtls"></span>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="mtop15"></div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                        <div class="form-group">
                                                            <label class="manadatory" for="txtEmail">Email ID</label>
                                                            <input type="email" name="txtEmail" id="txtEmail" class="form-control" title="Email ID" placeholder="Enter Applicant Email ID" pattern="[A-Za-z]" maxlength="30" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                                        <div class="form-group">
                                                            <label class="manadatory" for="lblMobileNo">Mobile No.</label>
                                                            <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" maxlength="10" title="Mobile No" onkeypress="return isNumberKey(event);" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                                        <div style="margin-top: -12px;">
                                                            <label>
                                                                <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
                                                            </label>
                                                            <asp:TextBox runat="server" ID="captcha" MaxLength="6" CssClass="form-control" title="Captcha" placeholder="Enter Captcha" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divVerify">
                                                        <div class="form-group">
                                                            <label>
                                                                &nbsp;
                                                            </label>
                                                            <%--<input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="fnGenOTP();" />--%>
                                                            <input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." style="margin-top: 2px;" onclick="fnCheckMobileNo();" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-1 col-lg-1">
                                                        <div class="form-group">
                                                            <label class="" for="Village">
                                                                &nbsp;
                                                            </label>
                                                            <input type="button" id="btnOTPLink" value="ReSend SMS" class="btn-link" style="display: none;" onclick="fnCheckMobileNo();" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divOTP">
                                                        <div class="form-group">
                                                            <label class="manadatory" for="CompanyName">OTP</label>
                                                            <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" maxlength="6" onkeypress="return isNumberKey(event);" autofocus />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divbtnOTP">
                                                        <div class="form-group">
                                                            <label class="" for="">
                                                                &nbsp;
                                                            </label>
                                                            <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Validate SMS Code" onclick="fnValidateOTP();" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="divDetail">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtName">Applicant Full Name</label>
                                                    <input type="text" id="txtName" name="txtName" class="form-control" placeholder="Enter Applicant Full Name" autofocus="autofocus" maxlength="30" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtUserID">Login Id</label>
                                                    <input id="txtUserID" class="form-control" name="txtUserID" type="text" placeholder="Enter Login Id" maxlength="26" onchange="CheckAvability();" autofocus />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtPassword">Password  <a href="#" data-toggle="tooltip" data-placement="top" title="Password should be 6 character combination of alpha numeric including one special character,one Upper and one lower character."><i class="fa fa-info-circle fa-1x fa-fw pull-right"></i></a></label>
                                                    <input id="txtPassword" class="form-control" name="txtPassword" placeholder="Enter Password" type="password" maxlength="20" autofocus ncopy="return false;" oncut="return false;" onpaste="return false;" onchange="javascript:return pwdStrength(this);" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtConfirm">Confirm Password</label>
                                                    <input class="form-control" id="txtConfirm" name="txtConfirm" type="password" placeholder="Confrim Password" maxlength="20" onchange="fnCompairPassword();" autofocus oncopy="return false;" oncut="return false;" onpaste="return false;" onchange="javascript:return repass(document.getElementById('txtChangePassword'), this);" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group text-right">
                                                    <label class="" for="">
                                                        &nbsp;
                                                    </label>
                                                    <input type="button" id="btnAvailability" class="btn btn-link" value="Check Login Id Availability" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 box-container" id="divBtn">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <div class="col-xs-12 col-sm-12">
                                        <input type="button" id="btnConfirm" class="btn btn-success mright15" value="Register" />
                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" CssClass="btn btn-danger" PostBackUrl="" Text="Cancel" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <asp:HiddenField ID="HFServiceID" runat="server" Value="995" />
        <asp:HiddenField ID="HFCapID" runat="server" />
        <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="995" ng-model="ServiceID" runat="server" visible="false" />
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
                <p class="ptop15" style="color: #fff;">© All rights reserved CSC, SPVC.</p>
            </div>
        </footer>
    </form>
</body>
</html>