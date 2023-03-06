<%@ Page Title="Birth Certificate" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="BirthForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.BirthCertificate.BirthForm" %>

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
    <script src="/WebAppUK/Edistrict/BirthCertificate/BirthCertificate.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

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
                Please wait...<br />
                <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br />
                while submitting form...
            </p>
        </div>
        <div id="page-wrapper" ng-controller="ctrl"  style="min-height: 500px !important;">
            <div class="container-fluid">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>BIRTH CERTIFICATE <small class="pull-right txt_white pright10">Language :
                        <input type="button" id="btnLang" runat="server" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
                </div>
                <%--Basic Details START Here--%>
                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Child Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblDOB}}</label>
                                    <input type="text" id="txtChildDOB" placeholder="DD/MM/YYYY" class="form-control" autocomplete="off" maxlength="10" onkeypress="return false" />
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
                            <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblChildName}}</label>
                                    <input type="text" id="txtChildName" placeholder="Child Full Name" class="form-control" onkeypress="ForName(event)" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>{{resourcesData.lblAge}}</label>
                                    <input type="text" id="txtAge" placeholder="Age Detail" readonly="true" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblAppGender}}</label>
                                    <select class="form-control" id="ddlChildGender">
                                        <option value="0">-Select-</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Transgender">Transgender</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblBirthWeight}}</label>
                                    <input type="text" id="txtChildWeight" placeholder="(in kg)" maxlength="4" class="form-control" onkeypress="ForDecimalNumber(event);" />
                                </div>
                            </div>
                             <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label>{{resourcesData.aadhaar}}</label>
                                    <input type="text" id="txtChildAadhaarNo" maxlength="12" placeholder="Aadhaar No" class="form-control" onkeypress="return isNumber(event, this);" onchange="AadhaarValidation(this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblBirthPlace}}</label>
                                    <input type="text" id="txtBirthPlace" placeholder="Place of Birth full Address" class="form-control" />
                                </div>
                            </div>
                           <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="Religion">{{resourcesData.religion}}</label>
                                    <select class="form-control" id="ddlReligion" name="Religion">
                                        <option value="0">-Select-</option>
                                        <option value="Hindu">Hindu</option>
                                        <option value="Islam">Islam</option>
                                        <option value="Jain">Jain</option>
                                        <option value="Sikh">Sikh</option>
                                        <option value="Christian">Christian</option>
                                        <option value="Budhist">Budhist</option>
                                        <option value="Other">Other's</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="nationality">{{resourcesData.lblnationality}}</label>
                                    <select class="form-control" data-val="true" data-val-number="Nationality" id="ddlNationality" name="Nationality">
                                        <option selected="selected" value="Indian">Indian</option>
                                        <option value="Others">Others</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblDeliveryFacility}}</label>
                                    <select class="form-control" id="ddlDeliveryFacility">
                                        <option value="0">-Select-</option>
                                        <option value="Dummy1">Dummy Data 1</option>
                                        <option value="Dummy2">Dummy Data 2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory">{{resourcesData.lblDeliveryType}}</label>
                                    <select class="form-control" id="ddlDeliveryType">
                                        <option value="0">-Select-</option>
                                        <option value="Dummy1">Dummy Data 1</option>
                                        <option value="Dummy2">Dummy Data 2</option>
                                    </select>
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
                            <h4 class="box-title manadatory">Child Photograph</h4>
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

                <%--Ancestral Details--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Ancestral Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblfathername}}</label>
                                <input type="text" class="form-control" id="txtFatherName" placeholder="Father's Name" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblFatherEduLevel}}</label>
                                <input type="text" class="form-control" id="txtFatherEduLevel" placeholder="Father's Education Level" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblFatherOccupation}}</label>
                                <select class="form-control" id="ddlFatherOccupation">
                                    <option value="0">-Select-</option>
                                    <option value="Salaried">Salaried</option>
                                    <option value="Business">Business</option>
                                    <option value="Professional">Professional</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.motherName}}</label>
                                <input type="text" class="form-control" id="txtMotherName" placeholder="Mother's Name" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMotherAgeatMarriage}}</label>
                                <input type="text" maxlength="2" class="form-control" id="txtMotherMarriageAge" placeholder="Mother's Age at time of Marriage" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMotherAgeatBirth}}</label>
                                <input type="text" maxlength="2" class="form-control" id="txtMotherAgeBirth" placeholder="Mother's Age at Birth" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblTotalChildren}}</label>
                                <input type="text" class="form-control" maxlength="2" id="txtTotalChildren" placeholder="No Of Children" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMotherEduLevel}}</label>
                                <input type="text" class="form-control" id="txtMotherEduLevel" placeholder="Mother's Education Level" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMotherOccupation}}</label>
                                <select class="form-control" id="ddlMotherOccupation">
                                    <option value="0">-Select-</option>
                                    <option value="Salaried">Salaried</option>
                                    <option value="Business">Business</option>
                                    <option value="Professional">Professional</option>
                                    <option value="Housewife">Housewife</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <%-- Address Details--%>
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
                                <input name="Address1PinCode" type="text" id="txtPinCode" class="form-control" placeholder="Pincode" maxlength="6" onkeypress="return isNumber(event, this);" onchange="PinCodeValidation(this);" />
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
                                <label class="manadatory" for="txtApplicantName">
                                    {{resourcesData.lblapplicantfullname}}
                                </label>
                                <input name="txtApplicantName" type="text" id="txtApplicantName" class="form-control" placeholder="Applicant Full Name" maxlength="40" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtApplicantMobileNo">
                                     {{resourcesData.lblAppMobileNo}}
                                </label>
                                <input name="txtApplicantMobileNo" type="text" id="txtApplicantMobileNo" class="form-control" placeholder="Mobile No." maxlength="10" onchange="MobileValidation(txtApplicantMobileNo);" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-6 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory" for="txtApplicantAddress">
                                   {{resourcesData.lblAppFullAddress}}
                                </label>
                                <input name="txtApplicantAddress" type="text" id="txtApplicantAddress" class="form-control" placeholder="Applicant Full Address" maxlength="100" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtApplicantPincode">
                                    {{resourcesData.lblPincode}}
                                </label>
                                <input name="txtApplicantPincode" type="text" id="txtApplicantPincode" class="form-control" placeholder="Pincode" maxlength="6" onkeypress="return isNumber(event, this);" onchange="PinCodeValidation(this);" />
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
                                    {{resourcesData.lblI}}, <b><span id="lblUName" style="text-transform: uppercase; color: black; font-weight: bolder;"></span></b> {{resourcesData.birthDeclaration}}
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
