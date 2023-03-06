<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="PermanentResidentCertificate.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.ResidentCertificate.PermanentResidentCertificate" %>

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
    <script src="/WebAppUK/Edistrict/ResidentCertificate/ResidentCertificate.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        var bool = 0;
        function ckhInfo()
        {
            if (bool == 1)
            {
                bool = 0;
                $('#divInfo').slideDown(500);
            }
            else
            {
                bool = 1;
                $('#divInfo').slideUp(500);
            }
        }
        function fuShowHideDiv(divID, isTrue)
        {
            //alert(divID);
            if (isTrue == "1")
            {
                $('#' + divID).show(800);
            }
            if (isTrue == "0")
            {
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
        #AncestralInfo label {
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
        <div class="container-fluid p0">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;">
                    <span class="col-lg-9 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>Application for Original / Permanent Resident Certificate
                    </span>
                    <span class="col-lg-3" style="font-size: 14px; text-align: right;">Language :
                        <input type="button" runat="server"  id="btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();"   value="हिन्दी" /><i class="fa fa-hand-o-up"></i></span>
                    <span class="clearfix"></span>
                </h2>
               
            </div>
            <%--General Info--%>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container ">
                    <div class="box-heading">
                        <h4 class="box-title register-num">General Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblApplicationType}}</label>
                                <select class="form-control" id="ddlAppType">
                                    <option value="0">-Select-</option>
                                    <option value="Permanent">Permanent</option>
                                    <option value="Original">Original</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblapplicantfullname}}</label>
                                <input type="text" maxlength="30" id="txtFullName" placeholder="Applicant Name" class="form-control" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory ">{{resourcesData.lblAppFatherName}}</label>
                                <input type="text" maxlength="30" id="txtFatherName" placeholder="Father/Husband Name" class="form-control" onkeypress="ForName(event);" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory ">{{resourcesData.lblAppDOB}}</label>
                                 <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" maxlength="10" onkeypress="return false" />
                            </div>
                             </div>
                         <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
                             <div class="form-group">
                                 <label>{{resourcesData.lblAppAge}}</label>
                                   <input type="text" id="txtAge" placeholder="Age" readonly="true" class="form-control" />
                                 </div>
                             </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppMotherName}}</label>
                                <input type="text" maxlength="30" id="txtMotherName" placeholder="Mother Name" class="form-control" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.aadhaar}}</label>
                                <input type="text" id="txtAadhaarNo" placeholder="Aadhaar No" class="form-control" maxlength="12" onkeypress="return isNumber(event, this);" onchange="AadhaarValidation(this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
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
                                <label class="manadatory">{{resourcesData.lblMobileNo}}</label>
                                <input type="text" id="txtMobileNo" placeholder="Mobile" maxlength="10" class="form-control" onkeypress="return isNumber(event, this);" onchange="MobileValidation(txtMobileNo);" />
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblFatherBirthCity}}</label>
                                <input type="text" id="txtFatherBirthCity" maxlength="15" placeholder="Father's city of Birth" class="form-control" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppEmail}}</label>
                                <input type="text" id="txtEmailID" placeholder="Email ID" maxlength="40" class="form-control" onchange="ValiateEmail();" />
                            </div>
                        </div>
                       

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblResidenceUK}}</label>
                                <div class="col-lg-6 pleft0">
                                    <input type="text" id="txtUKYear" placeholder="No of Years" maxlength="3" class="form-control" onkeypress="return isNumber(event, this);" />
                                </div>
                                <div class="col-lg-6 pright0">
                                    <input type="text" id="txtUKMonth" placeholder="No of Month" maxlength="3" class="form-control" onkeypress="return isNumber(event, this);" />
                                </div>
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
            <%--Permanent Address--%>
            <div class="col-md-12 box-container ">
                <div class="box-heading">
                    <h4 class="box-title register-num">Address Details <small class="pull-right" style="color:#fff;">Choose Address : &nbsp; <input type="radio" value="PreAdd" id="PreAdd" name="Address" />Present &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="PerAdd" id="PerAdd" name="Address" />Permanent</small></h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblAreaType}}</label>
                            <select id="ddlArea" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="Urban">Urban</option>
                                <option value="Rural">Rural</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblAddress1}}</label>
                            <input type="text" class="form-control" id="txtAddress1" placeholder="First Line Address" maxlength="100" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblAddress2}}</label>
                            <input type="text" id="txtAddress2" class="form-control" placeholder="Second Line Address" maxlength="100" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblAppState}}</label>
                            <select class="form-control" disabled="disabled" name="state" id="ddlState" onchange="GetUKDistrict();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.district}}</label>
                            <select class="form-control" id="ddlDistrict" onchange="GetUKBlock();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblBlock}}</label>
                            <select class="form-control" id="ddlBlock" onchange="GetUKPanchayat();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label id="lblGram">{{resourcesData.lblPanchayat}}</label>
                            <select class="form-control" id="ddlGram" onchange="GetUKRDistrict();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPincode}}</label>
                            <input type="text" maxlength="6" class="form-control" placeholder="Pincode" id="txtPincode" onkeypress="return isNumber(event, this);" onchange="PinCodeValidation(this);" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <%--Additional Info--%>
            <div class="col-md-12 box-container ">
                <div class="box-heading">
                    <h4 class="box-title register-num">Additional Information</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblReasonforPRCert}}</label>
                            <input type="text" class="form-control" id="txtReason" maxlength="100" onkeypress="ForName(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.district}}</label>
                            <select class="form-control" id="ddlRDistrict" onchange="GetUKRBlock();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblTehsil}}</label>
                            <select class="form-control" id="ddlRTehsil">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPatwariArea}}</label>
                            <select class="form-control" id="ddlPatwariArea">
                                <option value="0">-Select-</option>
                                <option value="Data 1">Dummy Data 1</option>
                                <option value="Data 2">Dummy Data 2</option>
                                <option value="Data 3">Dummy Data 3</option>
                                <option value="Data 4">Dummy Data 4</option>
                                <option value="Data 5">Dummy Data 5</option>
                                <option value="Data 6">Dummy Data 6</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblGramName}}</label>
                            <select class="form-control" id="ddlRGram">
                                <option value="0">-Select-</option>
                                <option value="Data 1">Dummy Data 1</option>
                                <option value="Data 2">Dummy Data 2</option>
                                <option value="Data 3">Dummy Data 3</option>
                                <option value="Data 4">Dummy Data 4</option>
                                <option value="Data 5">Dummy Data 5</option>
                                <option value="Data 6">Dummy Data 6</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblMunicipalityArea}}</label>
                            <input type="text" maxlength="15" id="txtMunicipalityArea" class="form-control" onkeypress="ForName(event);" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <%--Ancestral Info--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="AncestralInfo">
                <div class="box-heading">
                    <h4 class="box-title register-num">Ancestral Information</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span id="ParentProp"><span class="fom-Numbx">1.</span>  {{resourcesData.lblAncestralPrpty}} </span></p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="AncstralPrpty" id="AncstralPrptyYes" value="1" onclick="return fuShowHideDiv('AncstralPrptyInfo', 1);" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="AncstralPrpty" id="AncstralPrptyNo" value="0" onclick="return fuShowHideDiv('AncstralPrptyInfo', 0);" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="AncstralPrptyInfo" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblFromDate}} </p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" id="txtPropertyDate" class="form-control" placeholder="DD/MM/YYYY" maxlength="10" onkeypress="return false" />
                                </div>
                            </div>
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblProvideDetails}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <textarea class="form-control" maxlength="100" id="txtPropertyDetail" rows="2" cols="4" style="resize: none;" onkeypress="ForName(event);"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span id="Earning"><span class="fom-Numbx">2.</span>    {{resourcesData.lblParentEarning}}</span></p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="ParentEarning" id="ParentEarningYes" value="1" onclick="return fuShowHideDiv('ParentEarningInfo', 0);" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="ParentEarning" id="ParentEarningNo" value="0" onclick="return fuShowHideDiv('ParentEarningInfo', 1);" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="ParentEarningInfo" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i> {{resourcesData.lblWhereLiving}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <textarea class="form-control" id="txtParentLiving" rows="2" cols="4" style="resize: none;"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblFromWhen}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" id="txtLivingDate" class="form-control" placeholder="DD/MM/YYYY" maxlength="10" onkeypress="return false" />
                                </div>
                            </div>
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblBusiness}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" id="txtParentBusiness" maxlength="15" class="form-control" placeholder="Parent Business" onkeypress="ForName(event);" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span id="GovtService"><span class="fom-Numbx">3.</span>   {{resourcesData.lblParentGovtEmply}}</span></p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="ParentGovtEmply" id="ParentGovtEmplyYes" value="1" onclick="return fuShowHideDiv('ParentGovtEmplyInfo', 1);" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="ParentGovtEmply" id="ParentGovtEmplyNo" value="0" onclick="return fuShowHideDiv('ParentGovtEmplyInfo', 0);" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="ParentGovtEmplyInfo" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblIfYesInwhichdistrict}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" id="txtGovtDistrict" maxlength="15" class="form-control" placeholder="Govt. District" onkeypress="ForName(event);" />
                                </div>
                            </div>
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblInwhichDepartment}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" id="txtGovtDept" maxlength="15" class="form-control" placeholder="Govt. Department" onkeypress="ForName(event);" />
                                </div>
                            </div>
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblInwhichPost}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" maxlength="15" id="txtGovtPost" class="form-control" placeholder="Govt. Post" onkeypress="ForName(event);" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
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
