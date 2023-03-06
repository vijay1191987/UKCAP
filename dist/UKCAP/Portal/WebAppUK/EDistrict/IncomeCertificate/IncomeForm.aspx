<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="IncomeForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.IncomeCertificate.IncomeForm" %>

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
    <script src="/WebAppUK/Edistrict/IncomeCertificate/IncomeCertificate.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        function ChangeLanguage(p_Lang)
        {
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
                    <span class="col-lg-9 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>INCOME CERTIFICATE
                    </span>
                    <span class="col-lg-3" style="font-size: 14px; text-align: right;">Language :
                        <input type="button" runat="server"  id="btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></span>
                    <span class="clearfix"></span>
                </h2>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Basic Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblapplicantfullname}}</label>
                                <input type="text" id="txtFullName" placeholder="Applicant Full Name" class="form-control" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory ">{{resourcesData.lblAppFatherName}}</label>
                                <input type="text" id="txtFatherName" placeholder="Father/Husband Name" class="form-control" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppMotherName}}</label>
                                <input type="text" id="txtMotherName" placeholder="Mother Name" class="form-control" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
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
                                <label class="manadatory">{{resourcesData.aadhaar}}</label>
                                <input type="text" id="txtAadhaarNo" placeholder="Aadhaar No." maxlength="12" class="form-control" onkeypress="return isNumber(event);" onchange="AadhaarValidation(this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblOccupation}}</label>
                                <input type="text" id="txtOccupation" placeholder="Occupation" class="form-control" maxlength="25" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMobileNo}}</label>
                                <input type="text" id="txtMobileNo" placeholder="Mobile" maxlength="10" class="form-control" onchange="MobileValidation(txtMobileNo)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppEmail}}</label>
                                <input type="text" id="txtEmailID" placeholder="Email ID" maxlength="40" class="form-control" onchange="EmailValidation();" />
                            </div>
                        </div>
                           <%--<div ng-app='appmodule'>--%>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblIncomeinNumber}}</label>
                                    <%--<input type="text" id="txtIncome" placeholder="Income in Number" class="form-control" maxlength="7" ng-model="name" onkeypress="return isNumber(event);" />--%>
                                    <input type="text" id="txtIncome" placeholder="Income in Number" autocomplete="off" class="form-control" maxlength="7" onkeyup="RsPaise(this.value)"  onkeypress="ForDecimalNumber(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                <div class="form-group">
                                    <label>{{resourcesData.lblIncomeinWords}}</label>
                                    <%--<span id="lblIncomeWords" class="form-control" style="font-size: 15px; display: block;">{{name | words}}</span>--%>
                                    <span id="lblIncomeWords" class="form-control" style="font-size: 15px; display: block;"></span>
                                </div>
                            </div>
                     <%--   </div>--%>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <%--Photograph & Signature--%>
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 p0">
                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading" style="padding: 12px 8px;">
                        <h4 class="box-title manadatory">Applicant Photograph</h4>
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
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Address Details <small class="pull-right" style="color:#fff;">Choose Address : &nbsp; <input type="radio" value="PreAdd" id="PreAdd" name="Address" />Present &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="PerAdd" id="PerAdd" name="Address" />Permanent</small></h4>
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
                            <input id="txtAddress1" type="text" class="form-control" placeholder="First Line Address" maxlength="40" onkeypress="AlphaNumeric(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label for="AddressLine2">{{resourcesData.lblAddress2}}</label>
                            <input id="txtAddress2" type="text" class="form-control" placeholder="Second Line Address" maxlength="40" onkeypress="AlphaNumeric(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblRoadStreetName}}</label>
                            <input type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="20" onkeypress="AlphaNumeric(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblLandMark}}</label>
                            <input type="text" id="txtLandMark" class="form-control" placeholder="Landmark" maxlength="20" onkeypress="AlphaNumeric(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblLocality}}</label>
                            <input type="text" id="txtLocality" class="form-control" placeholder="Locality" maxlength="20" onkeypress="AlphaNumeric(event);" />
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
                            <input type="text" id="txtPincode" class="form-control" placeholder="Pincode" maxlength="6" onkeypress="isNumber(event);" onchange="PinCodeValidation(this);" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
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
