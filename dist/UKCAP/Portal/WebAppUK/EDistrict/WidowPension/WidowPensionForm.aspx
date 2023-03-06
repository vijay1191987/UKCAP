<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="WidowPensionForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.WidowPension.WidowPensionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            
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
            $('#txtHusbandDD').datepicker({
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ng-app="appmodule">
    <div id="page-wrapper" ng-controller="ctrl" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>WIDOW PENSION FORM <small class="pull-right txt_white pright10">Language :
                        <input type="button" id="ContentPlaceHolder1_btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
            </div>
            <%--Basic Details START Here--%>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Basic Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblapplicantfullname}}</label>
                                <input type="text" id="txtApplicantlname" placeholder="Applicant Full Name" class="form-control" />
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
                                <label class="manadatory">{{resourcesData.lblAppDOB}}</label>

                                <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" autocomplete="off" />

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppAge}}</label>
                                <input type="text" id="txtAge" placeholder="Age Detail" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppGender}}</label>
                                <select class="form-control" id="ddlgender">
                                    <option value="0">-Select-</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>{{resourcesData.aadhaar}}</label>
                                <input type="text" id="txtAadhaarNo" placeholder="Aadhaar No" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblCaste}}</label>
                                <select class="form-control" id="ddlCaste">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" id="ddlSubCaste">{{resourcesData.lblSubCaste}}</label>
                                <select class="form-control">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMobileNo}}</label>
                                <input type="text" id="txtMobileNo" placeholder="Mobile No." class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppEmail}}</label>
                                <input type="text" id="txtEmailID" placeholder="Email ID" class="form-control" />
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

            <%--Address Details--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Address Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="AreaType">{{resourcesData.lblAreaType}}</label>
                            <select class="form-control" id="ddlAreaType">
                                <option value="0">-Select-</option>
                                <option value="1">Urban</option>
                                <option value="2">Rural</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory" for="AddressLine1">
                                 {{resourcesData.lblAddress1}}
                            </label>
                            <input name="AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label for="AddressLine2">
                                {{resourcesData.lblAddress2}}
                            </label>
                            <input name="AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="" for="RoadStreetName">
                                 {{resourcesData.lblAppStreet}}
                            </label>
                            <input name="RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label for="LandMark">
                                {{resourcesData.lblLandMark}}
                            </label>
                            <input name="LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="" for="Locality">
                                {{resourcesData.lblLocality}}
                            </label>
                            <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="ddlState">
                                {{resourcesData.lblAppState}}
                            </label>
                            <select name="ddlState" id="PddlState" class="form-control">
                                <option selected="selected" value="0">-Select-</option>
                                <option value="35">Andamans &amp; Nicobar</option>
                                <option value="28">Andhra Pradesh</option>
                                <option value="12">Arunachal Pradesh</option>
                                <option value="18">Assam</option>
                                <option value="10">Bihar</option>
                                <option value="04">Chandigarh</option>
                                <option value="22">Chhattisgarh</option>
                                <option value="26">Dadra &amp; Nagar Have</option>
                                <option value="26">Dadra &amp; Nagar Haveli</option>
                                <option value="25">Daman &amp; Diu</option>
                                <option value="07">Delhi</option>
                                <option value="30">Goa</option>
                                <option value="24">Gujarat</option>
                                <option value="06">Haryana</option>
                                <option value="02">Himachal Pradesh</option>
                                <option value="01">Jammu &amp; Kashmir</option>
                                <option value="20">Jharkhand</option>
                                <option value="29">Karnataka</option>
                                <option value="32">Kerala</option>
                                <option value="31">Lakshadweep</option>
                                <option value="23">Madhya Pradesh</option>
                                <option value="27">Maharashtra</option>
                                <option value="14">Manipur</option>
                                <option value="17">Meghalaya</option>
                                <option value="15">Mizoram</option>
                                <option value="13">Nagaland</option>
                                <option value="21">Odisha</option>
                                <option value="34">Puducherry</option>
                                <option value="03">Punjab</option>
                                <option value="08">Rajasthan</option>
                                <option value="11">Sikkim</option>
                                <option value="33">Tamil Nadu</option>
                                <option value="28">Telangana</option>
                                <option value="16">Tripura</option>
                                <option value="09">Uttar Pradesh</option>
                                <option value="05">Uttarakhand</option>
                                <option value="19">West Bengal</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                {{resourcesData.district}}
                            </label>
                            <select name="ddlDistrict" id="PddlDistrict" class="form-control">
                                <option value="0">Select District</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label for="ddlTaluka">
                               {{resourcesData.lblBlock}}
                            </label>
                            <select name="ddlTaluka" id="PddlTaluka" class="form-control">
                                <option value="0">Select Block</option>
                            </select>
                            <input name="txtBlock" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" style="display: none;" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label for="ddlVillage">
                                {{resourcesData.lblPanchayat}}
                            </label>
                            <select name="ddlVillage" id="PddlVillage" class="form-control">
                                <option value="0">Select Panchayat</option>
                            </select>
                            <input name="txtPanchayat" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" style="display: none;" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                {{resourcesData.lblPostOffice}}
                            </label>
                            <select class="form-control">
                                <option value="0">-Select-</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                {{resourcesData.lblPoliceStation}}
                            </label>
                            <select class="form-control">
                                <option value="0">-Select-</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                {{resourcesData.lblPincode}}
                            </label>
                            <input name="PPinCode" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

            <%--Husband Death Information--%>
             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Husband's Death Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="AreaType">{{resourcesData.lblHusbandDeathPlace}}</label>
                           <input type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                     <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="AreaType"> {{resourcesData.lblHusbandDD}}</label>
                           <input type="text" class="form-control"  id="txtHusbandDD" placeholder="DD/MM/YYYY"  />
                        </div>
                    </div>
                     <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="AreaType">{{resourcesData.lblDiedHusbandOccupation}}</label>
                          <select class="form-control">
                              <option value="0">-Select-</option>
                               <option value="1">Business</option>
                               <option value="2">Self Employed</option>
                               <option value="3">Salaried</option>
                               <option value="4">Professional</option>
                          </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="AreaType">{{resourcesData.lblDiedHusbandIncome}}</label>
                           <input type="text" class="form-control"  id="txtHusbandIncome" placeholder="(in Rs.)"  />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    </div>
                 </div>



            <%--Other Information--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="otherDtl">
                <div class="box-heading">
                    <h4 class="box-title register-num">Other Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span class="fom-Numbx">1.</span>  {{resourcesData.lblBOOFamily}}</p>
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
                                    <input type="text" class="form-control" placeholder="Month Income (in Rs.)" />
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span id="Earning"><span class="fom-Numbx">2.</span>   {{resourcesData.lblGrandsonEarn}}</span></p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="Grandson" id="GrandsonEarnYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="Grandson" id="GrandsonEarnNo" value="0" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span class="fom-Numbx">3.</span> {{resourcesData.lblCurrentlyWork}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="Working" id="WorkingYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="Working" id="WorkingNo" value="0" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span class="fom-Numbx">4.</span>   {{resourcesData.lblAppHaveLand}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="Land" id="HaveLandYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="Land" id="HaveLandNo" value="0" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span class="fom-Numbx">5.</span>   {{resourcesData.lblAppHaveMoveableAssets}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="Land" id="HaveMVAssetsYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="Land" id="HaveMVAssetsNo" value="0" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span class="fom-Numbx">6.</span>  {{resourcesData.lblAppHaveOwnHouse}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="House" id="OwnHouseYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="House" id="OwnHouseNo" value="0" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span class="fom-Numbx">7.</span>   {{resourcesData.lblAppReceivedAssistance}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="BOO" id="GetAssistanceYes" value="1" onclick="return fuShowHideDiv('AssistanceInfo', 1);" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="BOO" id="GetAssistanceNo" value="0" onclick="return fuShowHideDiv('AssistanceInfo', 0);" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="AssistanceInfo" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblUKResidenceDuration}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <input type="text" class="form-control" placeholder="Month Income (in Rs.)" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="pleft27 ptop10"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.lblResidenceType}}</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <select class="form-control">
                                        <option value="0">-Select-</option>
                                        <option value="1">Rent</option>
                                        <option value="2">Own</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <p><span class="fom-Numbx">8.</span>  {{resourcesData.lblAppLiveWithAnyone}}</p>
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="OtherLive" id="ApplicantLiveOtherYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="OtherLive" id="ApplicantLiveOtherNo" value="0" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

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
                            <select class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblBankBranch}}</label>
                            <select class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblBankAccountNo}}</label>
                            <input type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblIFSCCode}}</label>
                            <input type="text" class="form-control" placeholder="IFSC Code" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>

            <%--Declaratin Details--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="Div2">
                <div class="box-heading">
                    <h4 class="box-title register-num">Declaration</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-sm-6 col-md-6 col-lg-12">
                        <p class="text-justify">
                            <input name="" type="checkbox" id="FormDeclaration" class="pull-left" />
                            <b style="display: flex; line-height: 22px;">I, solemnly affirm that the above mentioned information submitted by me is true and correct to my knowledge and belief. I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date
                            </b>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container text-center">
                <input type="button" class="btn btn-success" value="Submit" />
                <input type="button" class="btn btn-danger mleft10" value="Cancel" />
            </div>

        </div>
    </div>
        </div>
    <asp:HiddenField ID="HFCurrentLang" runat="server" />
</asp:Content>
