<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="DomicileForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.DomicileCertificate.DomicileForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>--%>
   <%-- <script src="../js/AngularJS_v1.6.4.js"></script>--%>
    <script src="DomicileFormJS.js"></script>
    <script src="../js/jquery.msgBox.js"></script>
    <link href="../css/msgBoxLight.css" rel="stylesheet" />
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#residanceDtl').hide();
            $('#HvngparentalPrpty').hide();
            $('#areParentWrkng').hide();
            $('#parentHvngGovtJob').hide();
            $('#drpStateName').val('0');
            $('#drpDistrictName').val('0');
            $('#drpSubDistrictName').val('0');
            $('#btnSubmit').prop('disabled', true);

            $('#txtDOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    GetAge();
                }
            });

            $('#txtFromWhen').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                }
            });

        });
        //Other Information DIV SHOW/HIDE//
        function fuShowHideDiv(divID1, isTrue) {
            if (isTrue == "1") {
                $('#' + divID1).show(500);
            }
            if (isTrue == "0") {
                $('#' + divID1).hide(500);
            }
        }

        function fuShowHideDiv1(divID, isTrue) {
            if (isTrue == "1") {
                $('#' + divID).show(500);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(500);
            }
        }
    </script>

    <%--    <script type="text/javascript">

        function Declaration(chk) {
            if (chk) {
                if ($('#txtApplicantname').val() == "" || $('#txtApplicantname').val() == null) {
                    alertPopup("Declaration Validation", "<BR><BR> Please Enter Beneficiary Name.")
                    $("#BenfName").html("");
                    $('#btnSubmit').prop('disabled', true);
                }
                else {
                    $("#BenfName").html($('#txtApplicantname').val());
                    $('#btnSubmit').prop('disabled', false);
                }
            }
            else {
                $("#BenfName").html("");
                $('#btnSubmit').prop('disabled', true);
            }
        }
    </script>--%>
    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {
            debugger;

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
    <script type="text/javascript">
        $(document).ready(function () {
            var qs = getQueryStrings();

            if (qs["UID"] != null && qs["UID"] != "") {
                $('#btnSubmit').prop('disabled', true);
            }
        });

        function getQueryStrings() {
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1);
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }
            return assoc;
        }

        function Declaration(chk) {
            if (chk) {
                var qs = getQueryStrings();
                var uid = qs["UID"];

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/webapp/kiosk/forms/basicdetail.aspx/GetDeclaration',
                    data: '{"prefix":"","UID":"' + uid + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var arr = eval(response.d);
                        var html = "";
                        var name = arr[0].Name;
                        $("#BenfName").html(name);
                        if (qs["UID"] != null && qs["UID"] != "") {
                            $('#btnSubmit').prop('disabled', false);
                        }
                    },
                    error: function (a, b, c) {
                        alert("1." + a.responseText);
                    }
                });
            }
            else {
                $("#BenfName").html("");
                $('#btnSubmit').prop('disabled', true);
            }
        }
    </script>


    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                      <%--  <h2 class="form-heading" style="width: 98%; margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>DOMICILE CERTIFICATE </h2>--%>
                        <h2 class="form-heading" style="width: 98%; margin: 15px auto;">
                        <span class="col-lg-10 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>DOMICILE CERTIFICATE <%--{{resourcesData.lblOISFTitle}}--%>
                        </span>
                        <span class="col-lg-2 p0" style="font-size: 15px;">Language : 
                                    <input type="button" id="btnLang" class="btn-link" style="height:25px; color:#fff;" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i></span>
                        <span class="clearfix"></span>
                    </h2>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Beneficiary Details--%>{{resourcesData.lblBeneficiaryDetails}}</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Full Name of Beneficiary--%>{{resourcesData.lblapplicantfullname}}</label>
                                        <input type="text" id="txtApplicantname" maxlength="30" placeholder="Beneficiary Name" class="form-control" onkeypress=" return ForName(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Father/Husband Name--%>{{resourcesData.lblAppFatherName}}</label>
                                        <input type="text" id="txtFatherHusbandName" maxlength="30" placeholder="Father/Husband Name" class="form-control" onkeypress=" return ForName(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Mother Name--%>{{resourcesData.lblAppMotherName}}</label>
                                        <input type="text" id="txtMotherName" maxlength="30" placeholder="Mother Name" class="form-control" onkeypress=" return ForName(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Birth Place--%>{{resourcesData.lblplaceofbirth}}</label>
                                        <input type="text" id="txtBirthPlace" maxlength="45" placeholder="Birth Place" class="form-control" onkeypress=" return ValidateAlpha(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Father Birth Place--%>{{resourcesData.lblfatherplaceofbirth}}</label>
                                        <input type="text" id="txtFatherBirthPlace" maxlength="45" placeholder="Father Birth Place" class="form-control" onkeypress=" return ValidateAlpha(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0">
                                    <div class="form-group">
                                        <label><%--Date of Birth--%>{{resourcesData.lblDOB}}</label>
                                        <input type="text" id="txtDOB" maxlength="10" placeholder="DOB" class="form-control" onchange="GetAge();" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label><%--Years--%>{{resourcesData.year}}</label>
                                        <input type="text" id="txtYear" readonly="true" placeholder="Years" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label><%--Months--%>{{resourcesData.lblMonths}}</label>
                                        <input type="text" id="txtMonth" readonly="true" placeholder="Months" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label><%--Days--%>{{resourcesData.days}}</label>
                                        <input type="text" id="txtDay" readonly="true" placeholder="Days" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Gender--%>{{resourcesData.lblAppGender}}</label>
                                        <select class="form-control" id="drpGender">
                                            <option value="0">Select</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Transgender">Transgender</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Mobile--%>{{resourcesData.mobileno}}</label>
                                        <input type="text" id="txtMobileNo" placeholder="Mobile No" class="form-control" maxlength="10" onchange="MobileValidation();" onkeypress="return isNumber(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Email Id--%>{{resourcesData.lblAppEmail}}</label>
                                        <input type="email" id="txtEmailID" placeholder="Email Id" maxlength="30" class="form-control" onchange="EmailValidation();" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Beneficiary Address Details--%>{{resourcesData.lblBeneficiaryAddressDetails}}</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Address Line-1 (Care of)--%>{{resourcesData.addressLine1}}</label>
                                        <input type="text" id="txtAddressLine1" maxlength="45" placeholder="First Line Address" class="form-control" onkeypress="return Alphanumericspecialchar(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Address Line-2 (Building)--%>{{resourcesData.addressLine2}}</label>
                                        <input type="text" id="txtAddressLine2" maxlength="45" placeholder="Second Line Address" class="form-control" onkeypress="return Alphanumericspecialchar(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--State--%>{{resourcesData.lblAppState}}</label>
                                        <select class="form-control" name="state" id="drpStateName" onchange="GetUKDistrict();">
                                            <option value="0">-Select State-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--District--%>{{resourcesData.district}}</label>
                                        <select class="form-control" name="district" id="drpDistrictName" onchange="GetUKBlock();">
                                            <option value="0">-Select District-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Block/Taluka/Sub district--%>{{resourcesData.taluka}}</label>
                                        <select class="form-control" name="taluka" id="drpSubDistrictName" onchange="GetUKPanchayat();">
                                            <option value="0">-Select SubDistrict-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Gram Panchayat--%>{{resourcesData.lblAppVillage}}</label>
                                        <select class="form-control" name="panchayat" id="drpGramPanchayatName">
                                            <option value="0">-Select Gram Panchayat-</option>
                                        </select>
                                    </div>
                                </div>
                                <%--<div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Municipality/Patvari Chowki</label>
                                <input type="text" class="form-control" maxlength="20" id="drpMunsiPatwariChowkiName" onkeypress=" return ValidateAlpha(event);" />
                            </div>
                        </div>--%>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Pincode--%>{{resourcesData.lblAppPincode}}</label>
                                        <input type="text" class="form-control" id="txtPincode" maxlength="6" onchange="return PinCodeValidation();" onkeypress="return isNumber(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Reason For Applying Domicile Certificate--%>{{resourcesData.lblapplyfordomicile}}</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                                    <div class="form-group">
                                        <input type="text" id="txtReasonForDomicile" maxlength="100" placeholder="Reason For Applying Domicile Certificate" class="form-control" onkeypress=" return ValidateAlpha(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Other Details--%>{{resourcesData.lblOtherDetails}}</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0 ">
                                                <p>
                                                    <span><span class="fom-Numbx">1.</span><%--Are you a resident of Uttarakhand?--%>{{resourcesData.lblresidentofUttarakhand}}</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio1" id="IsResidentofUKYes" value="Yes" onclick="return fuShowHideDiv('residanceDtl', 1);" />
                                                    Yes<label for="yes"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio1" id="IsResidentofUKNo" value="No" onclick="return fuShowHideDiv('residanceDtl', 0);" />
                                                    No<label for="no"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group" id="residanceDtl">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--For how many years have you been residing in Uttarakhand?--%>{{resourcesData.lblresidinginuttrakhand}}</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="txtYearsInUK" class="form-control" placeholder="Enter Years In Uttrakhand" type="text" onkeypress="return isNumber(event);" maxlength="2" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">2.</span><%-- Have you or your father/mother/grandfather any property?--%>{{resourcesData.lblgrandfatherproperty}}</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio2" id="HasMomDadPropertyYes" value="Yes" onclick="return fuShowHideDiv1('HvngparentalPrpty', 1);" />
                                                    Yes<label for="exarmy"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio2" id="HasMomDadPropertyNo" value="No" onclick="return fuShowHideDiv1('HvngparentalPrpty', 0);" />
                                                    No<label for="sptprsn"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group" id="HvngparentalPrpty">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--Please Describe Property--%>{{resourcesData.lblPleaseDescribeProperty}}</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="txtDescribeProperty" class="form-control" maxlength="20" placeholder="Please Describe Property" type="text" onkeypress=" return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--Please Describe Property Value--%>{{resourcesData.lblDescribePropertyValue}}</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="txtDescribeValue" class="form-control" maxlength="8" placeholder="Please Describe Property Value" type="text" onkeypress="return isNumber(event);" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">3.</span> <%--Wheather the parent of the applicant are earning livinghood in their native place?--%>{{resourcesData.lblnativeplace}}</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio3" id="isParentEarningUKYes" value="Yes" onclick="return fuShowHideDiv1('areParentWrkng', 0);" />
                                                    Yes<label for="exarmy"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio3" id="isParentEarningUKNo" value="No" onclick="return fuShowHideDiv1('areParentWrkng', 1);" />
                                                    No<label for="sptprsn"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="areParentWrkng">
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--If no, please describe where they earning their livinghood. --%>{{resourcesData.lbllivinghood}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="txtIfNoDescribe" class="form-control" maxlength="50" placeholder="Describe livinghood" type="text" onkeypress=" return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--From When--%> {{resourcesData.lblFromWhen}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="txtFromWhen" class="form-control" maxlength="20" placeholder="From When" type="text" onkeypress=" return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--Type of Bussiness --%>{{resourcesData.lblTypeofBussiness}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="txtTypeOfBussiness" class="form-control" placeholder="Type of Bussiness" type="text" maxlength="30" onkeypress=" return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">4.</span> <%--Wheather the parents of the applicant are working in Govt.Sector?--%>{{resourcesData.lblWheathertheparentsareworkinginGovtSector}}</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio4" id="isParentWorkingGovtYes" value="Yes" onclick="return fuShowHideDiv1('parentHvngGovtJob', 1);" />
                                                    Yes<label for="exarmy"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio4" id="isParentWorkingGovtNo" value="No" onclick="return fuShowHideDiv1('parentHvngGovtJob', 0);" />
                                                    No<label for="sptprsn"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="parentHvngGovtJob">
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--If Yes, In which district --%>{{resourcesData.lblIfYesInwhichdistrict}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="txtIfYesDistrict" class="form-control" maxlength="20" placeholder="In Which District" type="text" onkeypress=" return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--In which Department --%>{{resourcesData.lblInwhichDepartment}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="txtGovtDepartment" class="form-control" placeholder="In which Department" maxlength="20" type="text" onkeypress=" return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><%--In which Post --%>{{resourcesData.lblInwhichPost}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="txtGovtPost" class="form-control" placeholder="In which Post" type="text" maxlength="20" onkeypress=" return ValidateAlpha(event);" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-12 box-container" id="Div2">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Declaration--%>{{resourcesData.lblDeclaration}}</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-sm-6 col-md-6 col-lg-12">
                                    <p class="text-justify">
                                        <input type="checkbox" name="checkbox" id="FormDeclaration" runat="server" onclick="javascript: Declaration(this.checked);" />
                                        <b><span id="BenfName" style="text-transform: uppercase; font-weight: bolder;"></span>
                                           <%-- solemnly affirm that the above mentioned information submitted by me is true and correct to my knowledge and belief. 
                                        I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date.--%>
                                             {{resourcesData.lblstatement}}
                                        </b>
                                    </p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-12 box-container">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData();" />
                                <input type="button" value="Cancel" class="btn btn-danger" onclick="ReturnSubmit();" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
</asp:Content>
