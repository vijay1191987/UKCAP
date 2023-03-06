<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="CastCertificateForm.aspx.cs" ClientIDMode="Static" Inherits="CitizenPortal.WebAppUK.EDistrict.CastCertificate.CastCertificateForm" %>

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
    <script src="/WebAppUK/Edistrict/CastCertificate/CastCertificate.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

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
            Please wait...<br/>
            <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br/>
            while submitting form...
        </p>
    </div>
    <div id="page-wrapper" ng-controller="ctrl" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;">
                    <span class="col-lg-9 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>CASTE CERTIFICATE
                    </span>
                    <span class="col-lg-3" style="font-size: 14px; text-align: right;">Language :
                        <input type="button" runat="server"  id="btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();"   value="हिन्दी" /><i class="fa fa-hand-o-up"></i></span>
                    <span class="clearfix"></span>
                </h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pleft0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container pright0 ">
                    <div class="box-heading">
                        <h4 class="box-title register-num">General Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblapplicantfullname}}</label>
                                <input type="text" maxlength="30" id="txtFullName" placeholder="Applicant Name" class="form-control" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory ">{{resourcesData.lblAppFatherName}}</label>
                                <input type="text" maxlength="30" id="txtFatherName" placeholder="Father/Husband Name" class="form-control" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppMotherName}}</label>
                                <input type="text" maxlength="30" id="txtMotherName" placeholder="Mother Name" class="form-control" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.aadhaar}}</label>
                                <input type="text" id="txtAadhaarNo" placeholder="Aadhaar No" class="form-control" maxlength="12" onkeypress="return isNumber(event, this);" onchange="AadhaarValidation(this);" />
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
                                <label class="manadatory">{{resourcesData.lblAppDOB}}</label>
                                <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" autocomplete="off" maxlength="10" onkeypress="return false" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory ">{{resourcesData.appage}}</label>
                                <input type="text" id="txtAge" placeholder="Age Detail" class="form-control" readonly="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.religion}} </label>
                                <select class="form-control" id="ddlReligion">
                                    <option value="0">-Select-</option>
                                    <option value="Hinduism">Hinduism</option>
                                    <option value="Muslim">Muslim </option>
                                    <option value="Sikhism">Sikhism </option>
                                    <option value="Buddhism">Buddhism </option>
                                    <option value="Christianity">Christianity </option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblCaste}}  </label>
                                <select class="form-control" id="ddlCaste">
                                    <option value="0">-Select-</option>
                                    <option value="General">General</option>
                                    <option value="SC/ST">SC/ST</option>
                                    <option value="OBC">OBC</option>
                                    <option value="Gorkha">Gorkha</option>
                                    <option value="Jaat">Jaat</option>
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
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
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
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 p0">
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
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container ">
                <div class="box-heading">
                    <h4 class="box-title register-num">Address Details <small class="pull-right" style="color:#fff;">Choose Address : &nbsp; <input type="radio" value="PreAdd" id="PreAdd" name="Address" />Present &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="PerAdd" id="PerAdd" name="Address" />Permanent</small></h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblAreaType}}</label>
                            <select class="form-control" id="ddlArea">
                                <option value="0">-Select-</option>
                                <option value="Rural">Rural</option>
                                <option value="Urban">Urban</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPostalAddress}}</label>
                            <input type="text" id="txtAddress" placeholder="Full Address" class="form-control" maxlength="200" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblAppState}}</label>
                            <select class="form-control" disabled="disabled" name="state" id="ddlState" onchange="GetUKDistrict();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.district}}</label>
                            <select class="form-control" id="ddlDistrict" onchange="GetUKBlock();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory ">{{resourcesData.lblBlock}}</label>
                            <select class="form-control" id="ddlBlock" onchange="GetUKPanchayat();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label id="lblGram">{{resourcesData.lblGramName}}</label>
                            <select class="form-control" id="ddlGram">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPatwariArea}}</label>
                            <select class="form-control" id="ddlPatwariArea">
                                <option value="0">-Select-</option>
                                <option value="">Dummy Data 1</option>
                                <option value="">Dummy Data 2</option>
                                <option value="">Dummy Data 3</option>
                                <option value="">Dummy Data 4</option>
                                <option value="">Dummy Data 5</option>
                                <option value="">Dummy Data 6</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label id="lblMarea">{{resourcesData.lblMunicipalityArea}}</label>
                            <input type="text" maxlength="20" class="form-control" placeholder="Municipality Area" id="txtMunicipalityArea" onkeypress="ForName(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPincode}}</label>
                            <input type="text" maxlength="6" class="form-control" placeholder="Pincode" id="txtPincode" onkeypress="return isNumber(event, this);" onchange="PinCodeValidation(this);" />
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
