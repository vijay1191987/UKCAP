<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="UttrajiviForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.UttrajiviCertificate.UttrajiviForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="/WebAppUK/css/style.admin.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebAppUK/Edistrict/UttrajiviCertificate/UttrajiviCertificate.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {
            var t_Lang = p_Lang;
            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;
            //if (document.getElementById('HFCurrentLang').value != "") t_Lang = document.getElementById('HFCurrentLang').value;
            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";
            document.getElementById('HFCurrentLang').value = t_Lang;
            document.forms[0].submit();
            return true;
        }
    </script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        #g207 {
            position: fixed !important;
            position: absolute;
            top: 0;
            top: expression ((t=document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop)+"px");
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #fff;
            opacity: 0.9;
            filter: alpha(opacity=90);
            display: block
        }

            #g207 p {
                opacity: 1;
                filter: none;
                font: bold 24px Verdana,Arial,sans-serif;
                text-align: center;
                margin: 20% 0
            }

                #g207 p a, #g207 p i {
                    font-size: 12px
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ng-app="appmodule">
        <div id="g207" style="display: none; z-index: 1000;">
            <p>
                Please wait...<br>
                <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br>
                while submitting form...
            </p>
        </div>
        <div id="page-wrapper" ng-controller="ctrl" style="min-height: 500px !important;">
            <div class="container-fluid">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h2 class="form-heading" style="margin: 15px auto;">
                        <span class="col-lg-10 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>UTTRAJIVI CERTIFICATE
                        </span>
                        <span class="col-lg-2" style="font-size: 15px; text-align: right;">Language :
                        <input type="button" runat="server" id="btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></span>
                        <span class="clearfix"></span>
                    </h2>
                </div>
                <%--Basic Details START Here--%>
                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Applicant Details</h4>
                        </div>
                        <div class="box-body box-body-open">

                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblapplicantfullname}}</label>
                                    <input type="text" id="txtFullName" placeholder="Applicant Full Name" class="form-control" autocomplete="off" maxlength="40" onkeypress="ForName(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppFatherName}}</label>
                                    <input type="text" id="txtFatherName" placeholder="Father/Husband Name" class="form-control" autocomplete="off" maxlength="40" onkeypress="ForName(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppMotherName}}</label>
                                    <input type="text" id="txtMotherName" placeholder="Mother Name" class="form-control" autocomplete="off" maxlength="40" onkeypress="ForName(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppDOB}}</label>
                                    <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" autocomplete="off" maxlength="10" onkeypress="return false" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblMobileNo}}</label>
                                    <input type="text" id="txtMobileNo" placeholder="Mobile No." maxlength="12" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppGender}}</label>
                                    <select class="form-control" id="ddlGender">
                                        <option value="0">-Select-</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Transgender">Transgender</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label>{{resourcesData.aadhaar}}</label>
                                    <input type="text" id="txtAadhaarNo" placeholder="Aadhaar No." maxlength="12" class="form-control" onchange="AadhaarValidation(txtAadhaarNo);" onkeypress="return isNumber(event);"/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.deceasedrelation}}</label>
                                    <select id="ddlDeceasedRelationship" class="form-control">
                                        <option value="0">-Select-</option>
                                        <option value="Father">Father</option>
                                        <option value="Mother">Mother</option>
                                        <option value="Brother">Brother</option>
                                        <option value="Sister">Sister</option>
                                        <option value="Husband">Husband</option>
                                        <option value="Wife">Wife</option>
                                        <option value="Son">Son</option>
                                        <option value="Daughter">Daughter</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>{{resourcesData.appage}}</label>
                                    <input type="text" id="txtAgeDetail" placeholder="Age Detail" class="form-control" readonly="true" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppEmail}}</label>
                                    <input type="text" id="txtEmailID" placeholder="Email ID" class="form-control" maxlength="40" autocomplete="off" onchange="EmailValidation();"  />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <%--Photograph & Signature--%>
                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 p0">
                    <div id="divPhoto" class="col-md-12 box-container">
                        <div class="box-heading" style="padding: 12px 8px;">
                            <h4 class="box-title manadatory">Applicant Photograph
                            </h4>
                        </div>
                        <div class="box-body box-body-open p0">
                            <div class="col-lg-12">
                                <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px;" id="myImg" />
                                <input class="camera" id="File1" name="Photoupload" type="file" />
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%-- Address Details--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Address Details <small class="pull-right" style="color: #fff;">Choose Address : &nbsp;
                            <input type="radio" value="PreAdd" id="PreAdd" name="Address" />Present &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="PerAdd" id="PerAdd" name="Address" />Permanent</small></h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="AreaType">{{resourcesData.lblAreaType}}</label>
                                <select class="form-control" id="ddlArea">
                                    <option value="0">-Select-</option>
                                    <option value="Urban">Urban</option>
                                    <option value="Rural">Rural</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory" for="AddressLine1">{{resourcesData.lblAddress1}}</label>
                                <input id="txtAddress1" type="text" class="form-control" placeholder="First Line Address" autocomplete="off" maxlength="40" onkeypress="AlphaNumeric(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label for="AddressLine2">{{resourcesData.lblAddress2}}</label>
                                <input id="txtAddress2" type="text" class="form-control" placeholder="Second Line Address" autocomplete="off" maxlength="40" onkeypress="AlphaNumeric(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblRoadStreetName}}</label>
                                <input type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" autocomplete="off" maxlength="20" onkeypress="AlphaNumeric(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblLandMark}}</label>
                                <input type="text" id="txtLandMark" class="form-control" placeholder="Landmark" autocomplete="off" maxlength="20" onkeypress="AlphaNumeric(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblLocality}}</label>
                                <input type="text" id="txtLocality" class="form-control" placeholder="Locality" autocomplete="off" maxlength="20" onkeypress="AlphaNumeric(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlState">{{resourcesData.lblAppState}}</label>
                                <select id="ddlState" class="form-control">
                                    <option selected="selected" value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.district}}</label>
                                <select id="ddlDistrict" class="form-control" onchange="GetUKBlock();">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblBlock}}</label>
                                <select id="ddlBlock" class="form-control" onchange="GetUKPanchayat();">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblPanchayat}}</label>
                                <select id="ddlPanchayat" class="form-control">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="PIN">{{resourcesData.lblPincode}}</label>
                                <input type="text" id="txtPincode" class="form-control" placeholder="Pincode" autocomplete="off" maxlength="6" onkeypress="isNumber(event);" onchange="PinCodeValidation(this);" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%--Death Details--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Death Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblFullNameofDeceased}}</label>
                                <input type="text" id="txtdeceasedFullname" placeholder="Deceased Full Name" class="form-control" autocomplete="off" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppFatherName}}</label>
                                <input type="text" id="txtdeceasedFathername" placeholder="Father/Husband Name" class="form-control" autocomplete="off" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>{{resourcesData.lblplaceofdeath}}</label>
                                <input type="text" id="txtdeceasedDeathPlace" placeholder="Place of Death" class="form-control" autocomplete="off" maxlength="30" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppGender}}</label>
                                <select class="form-control" id="ddldeceasedGender">
                                    <option value="0">-Select-</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppDOD}}</label>

                                <input type="text" id="txtdeceasedDOD" placeholder="DD/MM/YYYY" class="form-control" autocomplete="off" maxlength="10" onkeypress="return false" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMobileNo}}</label>
                                <input type="text" id="txtdeceasedMobileNo" placeholder="Mobile No." maxlength="10" class="form-control" onchange="MobileValidation(txtdeceasedMobileNo)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="AreaType">{{resourcesData.lblAreaType}}</label>
                                <select class="form-control" id="ddldeceasedAreaType">
                                    <option value="0">-Select-</option>
                                    <option value="Urban">Urban</option>
                                    <option value="Rural">Rural</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlState">
                                    {{resourcesData.lblAppState}}
                                </label>
                                <select name="ddlState" id="ddldeceasedState" class="form-control" onchange="DeseasedDistrict();">
                                    <option selected="selected" value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddldeceasedDistrict">
                                    {{resourcesData.district}}
                                </label>
                                <select name="ddlDistrict" id="ddldeceasedDistrict" class="form-control" onchange="DeseasedBlock();">
                                    <option value="0">Select District</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label for="ddlTaluka">
                                    {{resourcesData.lblBlock}}
                                </label>
                                <select name="ddldeceasedTaluka" id="ddldeceasedTaluka" class="form-control" onchange="DeseasedPanchayat();">
                                    <option value="0">Select Block</option>
                                </select>
                                <input name="txtdeceasedBlock" type="text" id="txtdeceasedBlock" class="form-control" placeholder="Enter Block Name" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label for="ddlVillage">
                                    {{resourcesData.lblPanchayat}}
                                </label>
                                <select name="ddldeceasedVillage" id="ddldeceasedVillage" class="form-control">
                                    <option value="0">Select Panchayat</option>
                                </select>
                                <input name="txtdeceasedPanchayat" type="text" id="txtdeceasedPanchayat" class="form-control" placeholder="Enter Panchayat Name" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="PIN">
                                    {{resourcesData.lblPincode}}
                                </label>
                                <input name="txtdeceasedPinCode" type="text" id="txtdeceasedPinCode" class="form-control" autocomplete="off" placeholder="Pincode" maxlength="6" onkeypress="isNumber(event);" onchange="PinCodeValidation(this);" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%--Declaration Details--%>
                <div class="col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num manadatory" id="lblDeclaration">
                            <input type="checkbox" id="chkDeclaration" runat="server" onclick="javascript: Declaration(this.checked);" />Declaration
                        </h4>
                    </div>
                    <div class="box-body box-body-open" id="divDeclaration">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="text-danger text-danger-green mt0">
                                <p class="text-justify">
                                    {{resourcesData.lblI}}, <b><span id="lblUName" style="text-transform: uppercase; color: black; font-weight: bolder;"></span></b>
                                     {{resourcesData.birthDeclaration}}
                                </p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnSubmit" class="btn btn-primary" value="Submit" onclick="SubmitData();" />
                    <input type="button" value="Reset" id="btnReset" class="btn btn-danger" onclick="Reset();" />
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HDNFNM" runat="server" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFb64Sign" runat="server" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" />
</asp:Content>
