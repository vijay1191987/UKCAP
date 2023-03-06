<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="BirthForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.BirthCertificate.BirthForm" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/common.css" rel="stylesheet" />
    <link href="../css/style.admin.css" type="text/css" rel="stylesheet" />
    <script src="../js/jquery-ui-1.11.4.min.js"></script>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>--%>
   <%-- <script src="../js/AngularJS_v1.6.4.js"></script>--%>
    <link href="../css/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery.msgBox.js"></script>
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="BirthForm.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validation
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
        });
    </script>
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

    <%--    <script type="text/javascript">

        function Declaration(chk) {
            if (chk) {
                if ($('#FatherName').val() == "" || $('#FatherName').val() == null) {
                    alertPopup("Declaration Validation", "<BR><BR> Please Enter Father's Name.")
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

    <script type="text/javascript">
        function ReturnSubmit() {
            var qs = getQueryStrings();
            var uid = qs["UID"];
            window.location = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
        }
    </script>
    <%-- <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            $('#<%=BLocationType.ClientID%>').change(function () {
                var selectedval = $(this).val();
                if (selectedval == "urban") {
                    $('#<%=BGramPanchayat.ClientID%>').attr("disabled", true);
            $('#<%=BMunicipality.ClientID%>').attr("disabled", false);

        }

        else if (selectedval == "rural") {
            $('#<%=BGramPanchayat.ClientID%>').attr("disabled", false);
            $('#<%=BMunicipality.ClientID%>').attr("disabled", true);

        }
        else if (selectedval == "0") {
            $('#<%=BGramPanchayat.ClientID%>').attr("disabled", false);
             $('#<%=BMunicipality.ClientID%>').attr("disabled", false);

         }

            });
        });
    </script>--%>

    <style type="text/css">
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
</asp:Content>
<%------%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row mtop15">
                    <div class="col-lg-12">
                        <%--<h2 class="form-heading" style="width: 98%; margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>BIRTH CERTIFICATE 
                        </h2>--%>
                         <h2 class="form-heading" style="width: 98%; margin: 15px auto;">
                        <span class="col-lg-10 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>BIRTH CERTIFICATE <%--{{resourcesData.lblOISFTitle}}--%>
                        </span>
                        <span class="col-lg-2 p0" style="font-size: 15px;">Language : 
                                    <input type="button" id="btnLang" class="btn-link" style="height:25px; color:#fff;" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i></span>
                        <span class="clearfix"></span>
                    </h2>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Child Details--%>{{resourcesData.lblChildDetails}}</h4>
                            </div>
                            <div class="box-body box-body-open">

                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Name of Child--%>{{resourcesData.lblnameofchild}}</label>
                                        <input type="text" id="txtChildName" placeholder="Name of Child" maxlength="100" onkeypress="return ValidateAlpha(event); " class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Father Name--%>{{resourcesData.lblfathername}}</label>
                                        <input type="text" id="FatherName" placeholder="Father Name" onkeypress="return ValidateAlpha(event); " maxlength="100" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Mother Name--%>{{resourcesData.lblAppMotherName}}</label>
                                        <input type="text" id="MotherName" placeholder="Mother Name" onkeypress="return ValidateAlpha(event); " maxlength="100" class="form-control" />
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Gender--%>{{resourcesData.lblAppGender}}</label>
                                        <select class="form-control" id="ddlGender" name="nationality">
                                            <option value="0">-Select-</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Date of Birth--%>{{resourcesData.lblAppDOB}}</label>
                                        <input type="text" id="DOB" placeholder="Date of Birth" maxlength="15" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Place of Birth--%>{{resourcesData.lblplaceofbirth}}</label>
                                        <input type="text" id="PlaceOfBirth" placeholder="Place of Birth" class="form-control" maxlength="50" onkeypress="return ValidateAlpha(event); " />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--No.of Days till Birth--%>{{resourcesData.lblNoofDaystillBirth}}</label>
                                        <input type="text" id="NoOfDaysTillBirth" readonly="true" placeholder="Total Days Till Birth" onkeypress="return onlyNumbers(event); " class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <label class="manadatory"><%--Relation with Child--%>{{resourcesData.lblchildrealtion}}</label>
                                    <input type="text" id="BRelationWithChild" onkeypress="return ValidateAlpha(event);" placeholder="Relation with Child" class="form-control" />
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <label class="manadatory"><%--Religion--%>{{resourcesData.religion}}</label>
                                    <select class="form-control" name="religion" id="Religion">
                                        <option value="0">-Select-</option>
                                        <option value="Hindu">Hindu</option>
                                        <option value="Muslim">Muslim</option>
                                        <option value="Sikh">Sikh</option>
                                        <option value="Buddhism">Buddhism</option>
                                    </select>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <label class="manadatory"><%--Nationality--%>{{resourcesData.lblnationality}}</label>
                                    <select class="form-control" id="BNationality" name="nationality">
                                        <option value="0">-Select-</option>
                                        <option value="Indian">Indian</option>
                                    </select>
                                </div>
                                <div class="clearfix"></div>

                            </div>
                        </div>

                        <div class="col-md-12 box-container ">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Beneficiary Of Child--%>{{resourcesData.lblBeneficiaryOfChild}}</h4>
                            </div>
                            <div class="box-body box-body-open">


                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Address Line-1 (Care of)--%>{{resourcesData.addressLine1}}</label>
                                        <input type="text" id="BAddressOfCareOf" runat="server" maxlength="150" placeholder="First Line Address" onkeypress="return Alphanumericspecialchar(event);" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Address Line-2 (Building)--%>{{resourcesData.addressLine2}}</label>
                                        <input type="text" id="BAddressBuilding" runat="server" maxlength="150" placeholder="Second Line Address" onkeypress="return Alphanumericspecialchar(event);" class="form-control" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2" style="display: none">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Location Type--%>{{resourcesData.LocationType}}</label>
                                        <select class="form-control" id="BLocationType" runat="server" name="locationtype" onchange="Locationtypechange();">
                                            <option value="0">-Select-</option>
                                            <option value="urban">Urban</option>
                                            <option value="rural">Rural</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <label class="manadatory"><%--State--%>{{resourcesData.lblAppState}}</label>
                                    <select class="form-control" name="BenfState" id="BenfState" onchange="GetUKDistrict2();">
                                        <option value="0">-Select-</option>
                                        <%--   <option value="hindu">Hindu</option>
                                <option value="muslim">Muslim</option>
                                <option value="sikh">Sikh</option>
                                <option value="buddhism">Buddhism</option>--%>
                                    </select>
                                </div>
                                
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--District--%>{{resourcesData.district}}</label>
                                        <%--   <input type="text" id="BDistrict" runat="server" placeholder="District" class="form-control" />--%>
                                        <select class="form-control" name="district" id="BDistrict" onchange="GetUKBlock2();">
                                            <option value="0">-Select-</option>
                                            <%--     <option value="angul">Angul</option>
                                    <option value="balasore">Balasore</option>--%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Block/Taluka/Sub district--%>{{resourcesData.taluka}}</label>
                                        <%--<input type="text" id="BlockTalukaSubDistrict" runat="server" placeholder="Taluka" class="form-control" />--%>
                                        <select class="form-control" id="BBlockTalukaSubDistrict" name="taluka" onchange="GetUKPanchayat2();">
                                            <option value="0">-Select-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2" id="divPanchayat">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Gram Panchayat--%>{{resourcesData.lblAppVillage}}</label>
                                        <select class="form-control" id="BGramPanchayat" runat="server" name="panchayat">
                                            <option value="0">-Select-</option>
                                        </select>
                                    </div>
                                </div>
                                <%--<div class="col-xs-12 col-sm-8 col-md-8 col-lg-2" id="divmuncipality">
                            <div class="form-group">
                                <label class="manadatory">Municipality/Patvari Chowki</label>
                                <select class="form-control" name="municipality" id="BMunicipality" runat="server">
                                  <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>--%>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory"><%--Pincode--%>{{resourcesData.lblAppPincode}}</label>
                                        <%-- <input type="text" class="form-control" id="BPincode"  maxlength="6" onkeypress="return onlyNumbers(event);"  onchange="checkBpincode();"  placeholder="Pincode" />--%>
                                        <input name="text" type="text" id="BPincode" onkeypress="return onlyNumbers(event);" class="form-control" placeholder="Pincode" maxlength="6" onchange="checkBpincode();" />

                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num"><%--Hospital (Birth Place) Details--%>{{resourcesData.lblHospitalBirthPlaceDetails}}
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory">
                                           <%-- Name of Hospital--%>{{resourcesData.lblnameofhospital}}</label>
                                        <input id="HospitalName" maxlength="100" class="form-control" placeholder="Hospital Name" onkeypress="return ValidateAlpha(event); " name="AccountHolder" type="text" value="" autofocus="" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="box-body box-body-open">
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory">
                                                       <%-- Address Line-1 (Care of)--%>{{resourcesData.addressLine1}}
                                                    </label>
                                                    <input maxlength="100" name="Address1" type="text" id="Address1" class="form-control" onkeypress="return Alphanumericspecialchar(event);" placeholder="First Line Address" autofocus="" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="mandatory">
                                                       <%-- Address Line-2 (Building)--%>{{resourcesData.addressLine2}}
                                                    </label>
                                                    <input name="Address2" type="text" id="Address2" class="form-control" onkeypress="return Alphanumericspecialchar(event);" placeholder="Second Line Address" maxlength="100" autofocus="" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory">
                                                        <%--Road/Street Name--%>{{resourcesData.lblAppStreet}}
                                                    </label>
                                                    <input maxlength="100" name="Street" type="text" id="Street" class="form-control" placeholder="Road / Street Name" onkeypress="return AlphaNumeric(event);" autofocus="" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="mandatory">
                                                      <%--  Landmark--%>{{resourcesData.lblAppLandmark}}
                                                    </label>

                                                    <input maxlength="100" name="text" type="text" id="Landmark" class="form-control" placeholder="Landmark" onkeypress="return AlphaNumeric(event);" autofocus="" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory">
                                                        <%--Locality--%>{{resourcesData.lblAppLocality}}
                                                    </label>
                                                    <input maxlength="100" name="Locality" type="text" id="Locality" class="form-control" placeholder="Locality" onkeypress="return AlphaNumeric(event);" autofocus="" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory">
                                                      <%--  State--%>{{resourcesData.lblAppState}}
                                                    </label>
                                                    <select name="State" id="State" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetUKDistrict();">
                                                        <option value="0">-Select-</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory">
                                                       <%-- District--%>{{resourcesData.lblAppDistrict}}
                                                    </label>
                                                    <select name="ddlDistrict" id="ddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetUKBlock();">
                                                        <option value="0">-Select-</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory ">
                                                        <%--Block/Taluka--%>{{resourcesData.taluka}}
                                                    </label>
                                                    <select name="BlockTaluka" id="BlockTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetUKPanchayat();">
                                                        <option value="0">-Select-</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory text-nowrap">
                                                       <%-- Panchayat/Village/City--%>{{resourcesData.lblAppVillage}}
                                                    </label>
                                                    <select name="PanchayatVillageCity" id="PanchayatVillageCity" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                        <option value="0">-Select-</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <label class="manadatory">
                                                      <%--  Pincode--%>{{resourcesData.lblAppPincode}}
                                                    </label>
                                                    <input name="text" type="text" id="HPinCode" onkeypress="return onlyNumbers(event);" class="form-control" placeholder="Pincode" maxlength="6" onchange="checkHpincode();" />
                                                </div>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
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
<%--                                            solemnly affirm that the above mentioned information submitted by me is true and correct to my knowledge and belief. 
                                        I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date.--%>{{resourcesData.lblstatement}}
                                        </b>
                                    </p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <%--<div class="col-md-12 box-container ">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Beneficiary Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <label class="manadatory">Beneficiary Name</label>
                                <input type="text" clientstaticmode="static" id="BName" onkeypress="return ValidateAlpha(event);" runat ="server" placeholder="Beneficiary Name" class="form-control" />
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <label class="manadatory">Mobile</label>
                                <input type="text" runat="server"   maxlength="10" onkeypress="return onlyNumbers(event);" id="BMobile" placeholder="Mobile No" class="form-control"  onchange="checkmobile();"/>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <label class="manadatory">Relation with Child</label>
                                <input type="text" id="BRelationWithChild" onkeypress="return ValidateAlpha(event);" placeholder="Relation with Beneficiary" class="form-control" />
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <label class="manadatory">Nationality</label>
                                <select class="form-control" id="BNationality" name="nationality">
                                       <option value="0">-Select-</option>
                                    <option value="indian">Indian</option>
                                </select>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>--%>


                        <div class="col-md-12 box-container">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData();" />
                                <input type="button" name="Button1" value="Cancel" id="Button1" class="btn btn-danger" onclick="ReturnSubmit();" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
</asp:Content>
