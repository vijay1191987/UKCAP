<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="DisabilityPensionForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.DisabilityPension.DisabilityPensionForm" %>

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
    <script src="/WebAppUK/Edistrict/DisabilityPension/DisabilityPension.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

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
                Please wait...<br />
                <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br />
                while submitting form...
            </p>
        </div>
        <div id="page-wrapper" ng-controller="ctrl" style="min-height: 500px !important;">
            <div class="container-fluid">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>APPLICATION FOR DISABILITY PENSION<small class="pull-right txt_white pright10">Language :
                        <input type="button" id="btnLang" runat="server" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
                </div>
                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                    <%--General Information--%>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">General Information</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblapplicantfullname}}</label>
                                    <input type="text" maxlength="30" id="txtApplicantName" placeholder="Applicant Full Name" class="form-control" onkeypress="ForName(event)" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblfathername}}</label>
                                <input type="text" class="form-control" id="txtFatherName" placeholder="Father's Name" onkeypress="ForName(event)" onkeypress="ForName(event)" />
                            </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppMotherName}}</label>
                                <input type="text" class="form-control" id="txtMotherName" placeholder="Mother's Name" onkeypress="ForName(event)" onkeypress="ForName(event)" />
                            </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblDOB}}</label>
                                    <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" autocomplete="off" maxlength="10" onkeypress="return false" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>{{resourcesData.lblAge}}</label>
                                    <input type="text" readonly="true" id="txtAge" placeholder="Years | Months | Days" class="form-control" autocomplete="off" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
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
                                    <label>{{resourcesData.aadhaar}}</label>
                                    <input type="text" maxlength="12" id="txtAadhaarNo" placeholder="Aadhaar No" class="form-control" onkeypress="return isNumber(event);" onchange="AadhaarValidation(this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblCaste}}  </label>
                                    <select class="form-control" id="ddlCaste">
                                        <option value="0">-Select-</option>
                                        <option value="SC">SC</option>
                                        <option value="ST">ST</option>
                                        <option value="OBC">OBC</option>
                                        <option value="GURKHA">GURKHA</option>
                                        <option value="GEN">GEN</option>
                                    </select>
                                </div>
                            </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory ">{{resourcesData.lblSubCaste}} </label>
                                <select class="form-control" id="ddlSubCaste">
                                    <option value="0">-Select-</option>
                                    <option value="Singh">Singh</option>
                                    <option value="Kumar">Kumar</option>
                                    <option value="Bhardwaj">Bhardwaj</option>
                                    <option value="Saini">Saini</option>
                                    <option value="Joshi">Joshi</option>
                                    <option value="Negi">Negi</option>
                                    <option value="Sharma">Sharma</option>
                                    <option value="Yadav">Yadav</option>
                                    <option value="Chand">Chand</option>
                                    <option value="Jaat">Jaat</option>
                                    <option value="Chauhan">Chauhan</option>
                                    <option value="Thakur">Rai</option>
                                    <option value="Roy">Roy</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMobileNo}}</label>
                                <input type="text" id="txtMobileNo" placeholder="Mobile" maxlength="10" class="form-control" onchange="MobileValidation(txtMobileNo);" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>{{resourcesData.lblAppEmail}}</label>
                                <input type="text" id="txtEmailID" placeholder="Email ID" maxlength="40" class="form-control" onchange="ValiateEmail();" />
                            </div>
                        </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblDisabilityType}}</label>
                                    <select class="form-control" id="ddlDisabilityType">
                                        <option value="0">-Select-</option>
                                        <option value="1">Night Blindness</option>
                                        <option value="2">Blindness</option>
                                        <option value="3">Lame</option>
                                        <option value="4">Disk</option>
                                        <option value="5">Ortho One Arm (Left)</option>
                                        <option value="6">Ortho One Arm (Right)</option>
                                        <option value="7">Ortho Both Arms</option>
                                        <option value="8">Ortho One Leg (Left)</option>
                                        <option value="9">Ortho One Leg (Right)</option>
                                        <option value="10">OHC/Locomotor Disability / Cerebral Palsy</option>
                                        <option value="11">Deaf & Dumb / Hearing & Speech Impairment</option>
                                        <option value="12">Blind / Partialy Blind / Low Vision</option>
                                        <option value="13">Mentally Retarded</option>
                                        <option value="14">Visually Handicapped</option>
                                        <option value="15">Locomotor / Cerebral Palsy</option>
                                        <option value="16">Speech & Hearing Imparirement</option>
                                        <option value="17">Speech Disability</option>
                                        <option value="18">Hearing Disability</option>
                                        <option value="19">Mental Handicap</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblDisabilityPercentage}}</label>
                                    <input type="text" maxlength="2" id="txtDisablityPcent" class="form-control" placeholder="in Percentage (%)" onkeypress="return isNumber(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblResidenceDurationUK}}</label>
                                    <input type="text" id="txtResidenceDuration" maxlength="3" class="form-control" placeholder="(in years)" onkeypress="return isNumber(event);" />
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
                                <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 250px;" id="myImg" />
                                <input class="camera" id="File1" name="Photoupload" type="file" />
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="clearfix"></div>
            <%--Address Panel--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Address Details <small class="pull-right" style="color:#fff;">Choose Address : &nbsp; <input type="radio" value="PreAdd" id="PreAdd" name="Address" />Present &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="PerAdd" id="PerAdd" name="Address" />Permanent</small></h4>
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
                            <input name="RoadStreetName" type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="20" onkeypress="AlphaNumeric(event)" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="LandMark">{{resourcesData.lblLandMark}}</label>
                            <input name="LandMark" type="text" id="txtLandMark" class="form-control" placeholder="Landmark" maxlength="20" onkeypress="AlphaNumeric(event)" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="Locality">{{resourcesData.lblLocality}}</label>
                            <input type="text" id="txtLocality" class="form-control" placeholder="Locality" maxlength="20" onkeypress="AlphaNumeric(event)" />
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
                            <label class="manadatory" for="ddlTaluka">{{resourcesData.lblBlock}}</label>
                            <select class="form-control" id="ddlBlock" onchange="GetUKPanchayat();">
                                <option value="0">-Select-</option>
                            </select>
                            <input name="txtBlock" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" style="display: none;" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="ddlVillage">{{resourcesData.lblPanchayat}}</label>
                            <select name="ddlVillage" id="ddlVillage" class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                            <input name="txtPanchayat" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" style="display: none;" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPostalAddress}}</label>
                            <select class="form-control" id="ddlPostOffice">
                                <option value="0">-Select-</option>
                                <option value="Dummy1">Dummy Data 1</option>
                                <option value="Dummy2">Dummy Data 2</option>
                                <option value="Dummy3">Dummy Data 3</option>
                                <option value="Dummy4">Dummy Data 4</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPoliceStation}}</label>
                            <select class="form-control" id="ddlPoliceStn">
                                <option value="0">-Select-</option>
                                <option value="Dummy1">Dummy Data 1</option>
                                <option value="Dummy2">Dummy Data 2</option>
                                <option value="Dummy3">Dummy Data 3</option>
                                <option value="Dummy4">Dummy Data 4</option>
                            </select>
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
            <%--Other Information--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="otherDtl">
                <div class="box-heading">
                    <h4 class="box-title register-num">Other Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p id="idBooFamily"><span class="fom-Numbx">1.</span> {{resourcesData.lblBOOFamily}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="BOO" id="BOOFamilyYes" value="1" onclick="return fuShowHideDiv('BOOFamilyInfo', 1);" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="BOO" id="BOOFamilyNo" value="0" onclick="return fuShowHideDiv('BOOFamilyInfo', 0);" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="BOOFamilyInfo" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblMonthIncome}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" id="txtMonthlyIncome" maxlength="6" class="form-control" placeholder="Monthly Income (in Rs.)" onkeypress="return isNumber(event);" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p id="isAssistance"><span class="fom-Numbx">2.</span> {{resourcesData.lblAppReceivedAssistance}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="GetAssistance" id="GetAssistanceYes" value="1" onclick="return fuShowHideDiv('AssistanceInfo', 1);" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="GetAssistance" id="GetAssistanceNo" value="0" onclick="return fuShowHideDiv('AssistanceInfo', 0);" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="AssistanceInfo" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblResidenceDurationUK}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" id="txtResidenceYrs" maxlength="2" class="form-control" placeholder="Years In Uttrakhand" onkeypress="isNumber(event);" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblResidenceType}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <select class="form-control" id="ddlResidenceType">
                                        <option value="0">-Select-</option>
                                        <option value="Rent">Rent</option>
                                        <option value="Own">Own</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <%--Bank Information--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Bank Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblBankPostOffice}}</label>
                            <select class="form-control" id="ddlBankOffice">
                                <option value="0">-Select-</option>
                                <option value="Dummy1">Dummy Data 1</option>
                                <option value="Dummy2">Dummy Data 2</option>
                                <option value="Dummy3">Dummy Data 3</option>
                                <option value="Dummy4">Dummy Data 4</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblBankBranch}}</label>
                            <select class="form-control" id="ddlBankBranch">
                                <option value="0">-Select-</option>
                                <option value="Dummy1">Dummy Data 1</option>
                                <option value="Dummy2">Dummy Data 2</option>
                                <option value="Dummy3">Dummy Data 3</option>
                                <option value="Dummy4">Dummy Data 4</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblBankAccountNo}}</label>
                            <input type="text" id="txtAccountNo" maxlength="17" class="form-control" placeholder="Account No." onkeypress="return isNumber(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblIFSCCode}}</label>
                            <input type="text" id="txtIFSCode" maxlength="11" class="form-control" placeholder="IFSC Code" onchange="return ValidateIFSCode();" />
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
                                {{resourcesData.lblI}},<b><span id="lblUName" style="text-transform: uppercase; color: black; font-weight: bolder;"></span></b>
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
    <asp:HiddenField ID="HDNFNM" runat="server" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFb64Sign" runat="server" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" />
</asp:Content>