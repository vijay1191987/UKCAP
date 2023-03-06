<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="DeathForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.DeathCertificate.DeathForm" %>

<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>--%>
  <%--  <script src="../js/AngularJS_v1.6.4.js"></script>--%>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <link href="../css/common.css" rel="stylesheet" />s
    <script src="DeathForm.js"></script>
    <link href="../css/style.admin.css" type="text/css" rel="stylesheet" />
    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../css/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {
            $('#DateOfBirth').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    GetAge();
                }
            });
            $('#DateOfDeath').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    GetAge();
                }
            });
        });
    </script>

    <%--<script type="text/javascript">

        function Declaration(chk) {
            if (chk) {
                if ($('#FatherName').val() == "" || $('#FatherName').val() == null) {
                    alertPopup("Declaration Validation", "<BR><BR> Please Enter Father Name.")
                    $("#BenfName").html("");
                    $('#btnSubmit').prop('disabled', true);
                }
                else {
                    $("#BenfName").html($('#FatherName').val());
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

    <style type="text/css">
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
                       <%-- <h2 class="form-heading" style="width: 98%; margin: 15px auto;"><i class="fa fa-pencil-square-o"></i>DEATH CERTIFICATE </h2>--%>
                        <h2 class="form-heading" style="width: 98%; margin: 15px auto;">
                        <span class="col-lg-10 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>DEATH CERTIFICATE <%--{{resourcesData.lblOISFTitle}}--%>
                        </span>
                        <span class="col-lg-2 p0" style="font-size: 15px;">Language : 
                                    <input type="button" id="btnLang" class="btn-link" style="height:25px; color:#fff;" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i></span>
                        <span class="clearfix"></span>
                    </h2>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Deceased Death Details--%>{{resourcesData.lblDeceasedDeathDetails}}</h4>
                            </div>
                            <div class="box-body box-body-open">

                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Full Name of Deceased--%>{{resourcesData.lblFullNameofDeceased}}</label>
                                        <input type="text" id="txtName" placeholder="Deceased Name" maxlength="100" class="form-control" onkeypress="return ValidateAlpha(event, this);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Father/Husband Name--%>{{resourcesData.lblAppFatherName}}</label>
                                        <input type="text" id="FatherName" placeholder="Father Name" maxlength="100" class="form-control" onkeypress="return ValidateAlpha(event, this);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Mother  Name--%>{{resourcesData.lblAppMotherName}}</label>
                                        <input type="text" id="MotherName" placeholder="Mother Name" maxlength="100" class="form-control" onkeypress="return ValidateAlpha(event, this);" />
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Gender--%>{{resourcesData.lblAppGender}}</label>
                                        <select class="form-control" id="ddlGender" name="nationality">
                                            <option value="0">Select</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <label class="manadatory"><%--Religion--%>{{resourcesData.religion}}</label>
                                    <select class="form-control" id="Religion" name="religion">
                                        <option value="0">Select</option>
                                        <option value="Hindu">Hindu</option>
                                        <option value="Muslim">Muslim</option>
                                        <option value="Sikh">Sikh</option>
                                        <option value="Buddhism">Buddhism</option>
                                    </select>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Date of Birth--%>{{resourcesData.lblDOB}}</label>
                                        <input type="text" id="DateOfBirth" placeholder="Date of Birth" class="form-control" maxlength="12" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Date of Death--%>{{resourcesData.lblAppDOD}}</label>
                                        <input type="text" id="DateOfDeath" placeholder="Date of Death" class="form-control" maxlength="12" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label><%--Age--%>{{resourcesData.appage}}</label>
                                        <input type="text" id="Age" placeholder="Age" readonly="true" class="form-control" maxlength="3" onkeypress="return isNumber(event, this);" onchange="GetAge();" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Place of Death--%>{{resourcesData.lblplaceofdeath}}</label>
                                        <input type="text" id="PlaceOfDeath" placeholder="Place of Death" class="form-control" onkeypress="return ValidateAlpha(event, this);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Nationality--%>{{resourcesData.lblnationality}}</label>
                                        <select class="form-control" id="Nationality" name="nationality">
                                            <option value="0">Select</option>
                                            <option value="Indian">Indian</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--No of Days till Death--%>{{resourcesData.lblNoofDaystillDeath}}</label>
                                        <input type="text" id="NoOfDaysTillDeath" readonly="true" placeholder="Total Days Till Death" class="form-control" onkeypress="return isNumber(event, this);" maxlength="3" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Cause of Death--%>{{resourcesData.lblCauseofDeath}}</label>
                                        <input type="text" id="CauseOfDeath" placeholder="Cause of Death" maxlength="150" class="form-control" onkeypress="return ValidateAlpha(event, this);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Is death certified by any Hospital/Authority? --%>{{resourcesData.lblIsHospitalAuthority}}</label>
                                        <select class="form-control" id="DllDeathAutority" name="isdeathcertified">
                                            <option value="0">Select</option>
                                            <option value="yes">Yes</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pright0">
                                    <div class="form-group">
                                        <label class="manadatory"><%--What kind of therapy recommended? --%>{{resourcesData.lbltherapyrecommended}}</label>
                                        <input type="text" id="KindOfTharapy" onkeypress="return ValidateAlpha(event, this);" maxlength="150" placeholder="Please Describe" class="form-control" />

                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <label class="manadatory"><%--Relation with Deceased--%>{{resourcesData.deceasedrelation}}</label>
                                    <input type="text" id="RelationWithDesease" maxlength="100" placeholder="Relation with Deceased" class="form-control" onkeypress="return ValidateAlpha(event, this);" />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Beneficiary Address Details--%>{{resourcesData.lblBeneficiaryAddressDetails}}</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2" style="display: none">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Location Type--%>{{resourcesData.LocationType}}</label>
                                        <select class="form-control" id="ddllocationtype" name="locationtype">
                                            <option value="0">Select</option>
                                            <option value="urban">Urban</option>
                                            <option value="rural">Rural</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Address Line-1 (Care of)--%>{{resourcesData.addressLine1}}</label>
                                        <input type="text" id="Addressline1" placeholder="First Line Address" maxlength="150" class="form-control" onkeypress="return Alphanumericspecialchar(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Address Line-2 (Building)--%>{{resourcesData.addressLine2}}</label>
                                        <input type="text" id="Addressline2" placeholder="Second Line Address" maxlength="150" class="form-control" onkeypress="return Alphanumericspecialchar(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--State--%>{{resourcesData.lblAppState}}</label>
                                        <select class="form-control" name="district" id="ddlstate" onchange="GetUKDistrict();">
                                            <option value="0">-Select State-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--District--%>{{resourcesData.district}}</label>
                                        <select class="form-control" name="district" id="ddldistrict" onchange="GetUKBlock();">
                                            <option value="0">-Select District-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Block/Taluka/Sub district--%>{{resourcesData.taluka}}</label>
                                        <select class="form-control" name="taluka" id="ddlblock" onchange="GetUKPanchayat();">
                                            <option value="0">-Select Taluka-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Gram Panchayat--%>{{resourcesData.lblAppVillage}}</label>
                                        <select class="form-control" name="panchayat" id="ddlpanchayat">
                                            <option value="0">-Select Panchayat-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Pincode--%>{{resourcesData.lblAppPincode}}</label>
                                        <input type="text" id="pincode" placeholder="Pincode" onkeypress="return isNumber(event, this);" maxlength="6" class="form-control" onchange="PinCodeValidation();" />
                                    </div>
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
