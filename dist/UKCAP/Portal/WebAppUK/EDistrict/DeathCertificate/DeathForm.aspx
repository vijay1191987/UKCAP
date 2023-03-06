<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="DeathForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.DeathCertificate.DeathForm" %>

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
    <script src="/WebAppUK/Edistrict/DeathCertificate/DeathCertificate.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        $(document).ready(function () {
        });
        var bool = 0;
        function ckhInfo() {
            if (bool == 1) {
                bool = 0;
                $('#divInfo').slideDown(500);
            }
            else {
                bool = 1;
                $('#divInfo').slideUp(500);
            }
        }

        function fuShowHideDiv(divID, isTrue) {
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID).show(800);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(800);
            }
        }

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
        #otherDtl label {
            display: inline !important;
        }

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
            display: block;
        }

            #g207 p {
                opacity: 1;
                filter: none;
                font: bold 24px Verdana,Arial,sans-serif;
                text-align: center;
                margin: 20% 0;
            }

                #g207 p a, #g207 p i {
                    font-size: 12px;
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ng-app="appmodule">
        <div id="g207" style="display: none; z-index: 1000;">
            <p>
                Please wait...<br />
                <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br />
                while submitting form...
            </p>
        </div>
        <div id="page-wrapper" ng-controller="ctrl" style="min-height: 500px !important;">
            <div class="container-fluid">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>DEATH CERTIFICATE <small class="pull-right txt_white pright10">Language :
                        <input type="button" id="btnLang" runat="server" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
                </div>
                <%--Basic Details START Here--%>
                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Deceased Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblFullNameofDeceased}}</label>
                                    <input type="text" id="txtDeceasedfullname" placeholder="Deceased Full Name" class="form-control" />
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
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblDOD}}</label>
                                    <input type="text" id="txtDOD" placeholder="DD/MM/YYYY" autocomplete="off" maxlength="10" onkeypress="return false" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>{{resourcesData.lblRegistrationType}}</label>
                                    <select class="form-control" id="ddlRegistrationType" disabled="disabled">
                                        <option value="0">-Select-</option>
                                        <option value="Reg1M">Registration within 1 Month</option>
                                        <option value="Reg1M1Y">Registration after 1 Month and within 1 year</option>
                                        <option value="Reg1Y">Registration after 1 Year</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppFatherName}}</label>
                                    <input type="text" id="txtFatherHusbandName" placeholder="Father's/Husband's Name" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppMotherName}}</label>
                                    <input type="text" id="txtMotherName" placeholder="Mothers Name" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>{{resourcesData.lblAge}}</label>
                                    <input type="text" id="txtAge" readonly="true" placeholder="Age Detail" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="MobileNo">{{resourcesData.religion}}</label>
                                    <select class="form-control" id="ddlReligion" name="Religion">
                                        <option value="0">-Select-</option>
                                        <option value="Hindu">Hindu</option>
                                        <option value="Islam">Islam</option>
                                        <option value="Jain">Jain</option>
                                        <option value="Sikh">Sikh</option>
                                        <option value="Christian">Christian</option>
                                        <option value="Budhist">Budhist</option>
                                        <option value="Othr">Other's</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="nationality">{{resourcesData.lblnationality}}</label>
                                    <select class="form-control" data-val="true" data-val-number="Nationality" id="ddlNationality" name="Nationality">
                                        <option selected="selected" value="Indian">Indian</option>
                                        <option value="Others">Others</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <div class="form-group">
                                    <label>{{resourcesData.aadhaar}}</label>
                                    <input type="text" id="txtAadhaarNo" maxlength="12" placeholder="Aadhaar No" class="form-control" onkeypress="return isNumber(event);" onchange="AadhaarValidation(this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblCauseofDeath}}</label>
                                    <input type="text" id="txtDeathCause" placeholder="Cause of Death" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblplaceofdeath}}</label>
                                    <input type="text" id="txtDeathPlace" placeholder="Place of Death" class="form-control" />
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
                <%--Other Information--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="otherDtl">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Other Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p id="isDeceased"><span class="fom-Numbx">1.</span> {{resourcesData.lblDeceaseDeathAddress}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="DeathAddSame" id="DeathAddSameYes" value="1" onclick="return fuShowHideDiv('DeceasedDeathAddInfo', 1);" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="DeathAddSame" id="DeathAddSameNo" value="0" onclick="return fuShowHideDiv('DeceasedDeathAddInfo', 0);" />
                                        <label>No</label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="DeceasedDeathAddInfo" style="display: none;">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblDeathTimeAddress}}</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <textarea class="form-control" id="txtDeathAddress" rows="2" cols="3" style="resize: none;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mtop10"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p id="isDeathMedically"><span id="Earning"><span class="fom-Numbx">2.</span>{{resourcesData.lblDeathMedicallyPrescrb}}</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="MedicalPrescribed" id="MedicalPrescribYes" value="1" onclick="return fuShowHideDiv('MedicalPrescribInfo', 1);" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="MedicalPrescribed" id="MedicalPrescribNo" value="0" onclick="return fuShowHideDiv('MedicalPrescribInfo', 0);" />
                                        <label>No</label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="MedicalPrescribInfo" style="display: none;">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblMedicalCareDone}}</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <select class="form-control" id="ddlMedicalCare">
                                            <option value="0">-Select-</option>
                                            <option value="Dummy1">Dummy Data 1</option>
                                            <option value="Dummy2">Dummy Data 2</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblDiseaseName}}</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" id="txtDiseaseName" class="form-control" placeholder="Disease Name" />
                                    </div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblCauseofDeath}}</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" id="txtRealDeathCause" class="form-control" placeholder="Death Cause" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mtop10"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p id="isAddicted"><span class="fom-Numbx">3.</span>{{resourcesData.lblDeceasedAddicted}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="Addicted" id="AddictedYes" value="1" onclick="return fuShowHideDiv('AddictionInfo', 1);" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="Addicted" id="AddictedNo" value="0" onclick="return fuShowHideDiv('AddictionInfo', 0);" />
                                        <label>No</label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="AddictionInfo" style="display: none;">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblAddictionYears}}</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <textarea id="txtDescription" class="form-control" rows="2" cols="3" style="resize: none;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mtop10"></div>
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
                                <select class="form-control" id="ddlAreaType">
                                    <option value="0">-Select-</option>
                                    <option value="Urban">Urban</option>
                                    <option value="Rural">Rural</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory" for="AddressLine1">{{resourcesData.lblAddress1}}</label>
                                <input name="AddressLine1" type="text" id="txtAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label for="AddressLine2">{{resourcesData.lblAddress2}}</label>
                                <input name="AddressLine2" type="text" id="txtAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="RoadStreetName">{{resourcesData.lblRoadStreetName}}</label>
                                <input name="RoadStreetName" type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onkeypress="AlphaNumeric(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="LandMark">{{resourcesData.lblLandMark}}</label>
                                <input name="LandMark" type="text" id="txtLandMark" class="form-control" placeholder="Landmark" maxlength="40" onkeypress="AlphaNumeric(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="Locality">{{resourcesData.lblLocality}}</label>
                                <input type="text" id="txtLocality" class="form-control" placeholder="Locality" maxlength="40" onkeypress="AlphaNumeric(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlState">{{resourcesData.lblAppState}}</label>
                                <select name="ddlState" id="ddlState" class="form-control" onchange="GetUKDistrict();">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlDistrict">{{resourcesData.district}}</label>
                                <select class="form-control" id="ddlDistrict" onchange="GetUKBlock();">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label for="ddlTaluka">{{resourcesData.lblBlock}}</label>
                                <select class="form-control" id="ddlBlock" onchange="GetUKPanchayat();">
                                    <option value="0">-Select-</option>
                                </select>
                                <input name="txtBlock" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label for="ddlVillage">{{resourcesData.lblPanchayat}}</label>
                                <select name="ddlVillage" id="ddlVillage" class="form-control">
                                    <option value="0">-Select-</option>
                                </select>
                                <input name="txtPanchayat" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="PIN">{{resourcesData.lblPincode}}</label>
                                <input name="Address1PinCode" type="text" id="txtPinCode" class="form-control" placeholder="PinCode" maxlength="6" onkeypress="return isNumber(event, this);" onchange="PinCodeValidation(this);" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%--Applicant Details--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Applicant's Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtApplicantName">{{resourcesData.lblapplicantfullname}}</label>
                                <input name="txtApplicantName" type="text" id="txtApplicantName" class="form-control" placeholder="Applicant Full Name" maxlength="40" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtApplicantMobileNo">{{resourcesData.lblAppMobileNo}}</label>
                                <input name="txtApplicantMobileNo" type="text" id="txtApplicantMobileNo" class="form-control" placeholder="Mobile No." maxlength="10" onchange="MobileValidation(txtApplicantMobileNo);" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-6 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory" for="txtApplicantAddress">{{resourcesData.lblAppFullAddress}}</label>
                                <input name="txtApplicantAddress" type="text" id="txtApplicantAddress" class="form-control" placeholder="Applicant Full Address" maxlength="100" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtApplicantPincode">{{resourcesData.lblPincode}}</label>
                                <input name="txtApplicantPincode" type="text" id="txtApplicantPincode" class="form-control" placeholder="Pincode" maxlength="6" onkeypress="return isNumber(event, this);" onchange="PinCodeValidation(this);" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%--Declaratin Details--%>
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
                    <input type="button" id="btnSubmit" class="btn btn-primary" value="SUBMIT" onclick="SubmitData();" />
                    <input type="button" id="btClear" class="btn btn-danger" value="RESET" onclick="Reset();" />
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HDNFNM" runat="server" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFb64Sign" runat="server" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" />
</asp:Content>
