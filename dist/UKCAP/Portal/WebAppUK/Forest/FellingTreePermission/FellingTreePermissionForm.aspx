<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="FellingTreePermissionForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.Forest.FellingTreePermission.FellingTreePermissionForm" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>

<%@ Register Src="~/WebAppUK/controls/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>

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
    <script src="/WebAppUK/Forest/FellingTreePermission/FellingTreePermission.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#showOtherNationality').hide(600);
            $("#ddlNationality").on("change", function () {
                var v = $(this).val();
                if (v == "2") {
                    $("#showOtherNationality").show(600);
                } else {
                    $("#showOtherNationality").hide(600);
                }
            });
        });
       

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



    </script>
    <style>
        #AncestralInfo label {
            display: inline !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ng-app="appmodule">
        <div id="page-wrapper" ng-controller="ctrl" style="min-height: 500px !important;">
            <div class="container-fluid">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Permission for felling of Trees<small class="pull-right txt_white pright10">Language :
                        <input type="button" id="btnLang" class="btn-link" style="height: 25px; color: #fff;" runat="server" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
                </div>
                    <div class="clearfix"></div>
            <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />

            <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                    <%--General Information--%>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">General Information</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory ">Full Name of the Firm / Company</label>
                                    <input type="text" maxlength="30" id="txtFirmCompName" placeholder="Name of the Firm / Company" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory ">Applicant Full Name</label>
                                    <input type="text" maxlength="30" id="txtApplicantName" placeholder="Applicant Full Name" class="form-control" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Father's Name</label>
                                    <input type="text" maxlength="30" id="txtFatherName" placeholder="Father's Name" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Mother's Name</label>
                                    <input type="text" maxlength="30" id="txtMotherName" placeholder="Mother's Name" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory ">Gender</label>
                                    <select class="form-control" id="ddlGender">
                                        <option value="0">-Select-</option>
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                        <option value="T">Transgender</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="display: none;">
                                <div class="form-group">
                                    <label class="manadatory">D.O.B</label>
                                    <div class="col-lg-8 pleft0">
                                        <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" maxlength="10" onkeypress="return false" />
                                    </div>
                                    <div class="col-lg-4 pright0">
                                        <input type="text" id="txtAge" placeholder="Age" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">ID Proof Type</label>
                                    <select class="form-control" id="IdProofType">
                                        <option value="0">-Select-</option>
                                        <option value="PAN">PAN</option>
                                        <option value="Voter ID">Voter ID</option>
                                        <option value="Driving License">Driving License</option>
                                        <option value="Passport">Passport</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">ID Proof No</label>
                                    <input type="text" maxlength="30" id="txtIDProofNo" placeholder="ID Proof No" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label>Nationality</label>
                                    <select class="form-control" id="ddlNationality">
                                        <option value="0">-Select-</option>
                                        <option value="Indian">Indian</option>
                                        <option value="Others">Others</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" id="showOtherNationality" style="display:none">
                                <div class="form-group">
                                    <label class="manadatory">Others</label>
                                    <input type="text" id="txtOtherNationality" class="form-control" placeholder="Specify your Nationality" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">Mobile No.</label>
                                    <input type="text" id="txtMobileNo" class="form-control" placeholder="Mobile No." />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label>Landline No.</label>
                                    <input type="text" id="txtLandlineNo" class="form-control" placeholder="Landline No." />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Email ID</label>
                                    <input type="text" maxlength="30" id="txtEmailID" placeholder="Email Id" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>GST Number of the company</label>
                                    <input type="text" maxlength="30" id="txtGSTNO" placeholder="Company's GST Number" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory ">Complete Postal Address</label>
                                    <textarea id="txtPostalAddress" class="form-control" rows="4" cols="4" placeholder="Complete Postal Address" style="resize: none;"></textarea>

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
                    <div id="divSign" class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title manadatory register-num">Applicant Signature</h4>
                        </div>
                        <div class="box-body box-body-open p0">
                            <div class="col-lg-12">
                                <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                                <input class="camera" id="File2" name="Photoupload" type="file" />
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <%--Land Detail Panel--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Details of Land (Address / Location of premises / Land / Plot,where tree felling is proposed)
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblLandType}}</label>
                                <select class="form-control" id="ddlLandType">
                                    <option value="0">-Select-</option>
                                    <option value="Forest">Forest</option>
                                    <option value="Non Forest">Non Forest</option>


                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Khasara No./Survey No./Plot No.</label>
                                <input type="text" id="txtPlotNo" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlDistrict">
                                    District
                                </label>
                                <select name="ddlDistrict" id="ddlDistrict" class="form-control" onchange="GetUKBlock();" >
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label for="ddlTaluka">
                                    Tehsil/Taluka/Mandal
                                </label>
                                <select name="ddlTaluka" id="ddlTaluka" class="form-control"  onchange="GetUKPanchayat();" >
                                    <option value="0">-Select-</option>
                                </select>
                                <input name="txtBlock" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2" style="display:none">
                            <div class="form-group">
                                <label class="manadatory">
                                    Block Name
                                </label>
                                <input type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label>
                                    Thana/Chauki Name
                                </label>
                                <input type="text" id="txtChauki" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label for="ddlVillage">
                                    Panchayat/Village/City
                                </label>
                                <select name="ddlVillage" id="ddlVillage" class="form-control">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2" style="display: none;">
                            <div class="form-group">
                                <label class="manadatory">
                                    Village Code
                                </label>
                                <input name="PVillageCode" type="text" id="PVillageCode" class="form-control" placeholder="Village Code" maxlength="6" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Pincode
                                </label>
                                <input name="PPinCode" type="text" id="txtPinCode" class="form-control" placeholder="Pin Code" maxlength="6" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Circle Name
                                </label>
                                <select id="ddlCircleName" class="form-control" onchange="GetDivisionList();">
                                        <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                   Division
                                </label>
                                <select class="form-control" id="ddlDivision" onchange="GetRangeList();">
                                       <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Apply to DFO
                                </label>
                                <select class="form-control" id="ddldfo">
                                    <option value="No">-Select-</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Forest Range Name
                                </label>
                                <select class="form-control" id="ddlForestRange">
                                      <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Latitute (Degree)
                                </label>
                                <input type="text" id="txtLatituteDegree" class="form-control" placeholder="" maxlength="2" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Latitute (Minute)
                                </label>
                                <input type="text" id="txtLatituteMinute" class="form-control" placeholder="" maxlength="2" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Latitute (Second)
                                </label>
                                <input type="text" id="txtLatituteSecond" class="form-control" placeholder="" maxlength="2" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Longitude (Degree)
                                </label>
                                <input type="text" id="txtLongitudeDegree" class="form-control" placeholder="" maxlength="2" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Longitude (Minute)
                                </label>
                                <input type="text" id="txtLongitudeMinute" class="form-control" placeholder="" maxlength="2" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Longitude (Second)
                                </label>
                                <input type="text" id="txtLongitudeSecond" class="form-control" placeholder="" maxlength="2" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>
                                    Categeory of Premises
                                </label>
                                <select class="form-control" id="ddlPremises">
                                    <option value="0">-Select-</option>
                                    <option value="Agricultural">Agricultural</option>
                                    <option value="Commercial">Commercial</option>
                                    <option value="Industrial">Industrial </option>
                                    <option value="Institutional">Institutional</option>
                                    <option value="Residential">Residential</option>
                                    <option value="Other">Other Specify</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>
                                    Others
                                </label>
                                <input type="text" class="form-control" id="ddlPremisesOther" placeholder="Specify Other Category of Premises" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Reason for proposing to fell the tree/trees
                                </label>
                                <select class="form-control" id="ddlTreeFellingReason">
                                    <option value="0">-Select-</option>
                                    <option value="Self Consumption">Self Consumption</option>
                                    <option value="Commercial">Commercial</option>
                                    <option value="Other Specify">Other Specify</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Other
                                </label>
                                <input type="text" id="OthercategoryReason" class="form-control" placeholder="Specify Other Reason for proposing to fell the tree/trees" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                            <div class="form-group">
                                <label class="manadatory">
                                    Whether, it is recorded as Forest (Reserve Forest/Protected Forest/Cantonment/Garden/ etc.) in any Government Records
                                </label>
                                <select class="form-control" id="ddlGovForesrRecord">
                                    <option value="No">-Select-</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">
                                    Whether exempted from TPA-1976
                                </label>
                                <select class="form-control" id="ddlExempted1976">
                                    <option value="No">-Select-</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Area of the Premises
                                </label>
                                <input type="text" class="form-control" id="txtPremisesAreaHectere" placeholder="(in hectare)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-6 col-lg-5">
                            <div class="form-group">
                                <label>
                                    Aerial distance Nearest Protected area/Eco-sensitive zone etc
                                </label>
                                <input type="text" class="form-control" id="txtZoneinKm" placeholder="(in km)" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <%--Enumeration Detail Panel--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Number of Trees and Species Proposed to be Felled (Non-Exempted)</h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                            <div class="table-responsive">
                                <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 99%; margin: 0 auto;">
                                    <tbody>
                                        <tr>
                                            <%--<th rowspan="2">#</th>--%>
                                            <th rowspan="2"><strong>Tree 
species</strong></th>
                                            <th rowspan="2"><strong>Total No. of Trees 
existing in the premises/plot/area</strong></th>
                                            <th colspan="8">
                                                <p style="text-align: center;">
                                                    <strong>No. of Trees 
proposed to be Felled</strong>
                                                </p>
                                            </th>
                                            <th rowspan="2"><strong>Position of Trees 
(Standing/Fallen)</strong></th>
                                            <th rowspan="2"><strong>Condition of Trees 
(Green/Dry)</strong></th>
                                            <th rowspan="2" style="width: 100px;">Action</th>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">0-10</td>
                                            <td style="text-align: center;">10-20</td>
                                            <td style="text-align: center;">20-30</td>
                                            <td style="text-align: center;">30-40</td>
                                            <td style="text-align: center;">40-50</td>
                                            <td style="text-align: center;">50-60</td>
                                            <td style="text-align: center;">60-70</td>
                                            <td style="text-align: center;">&gt;70</td>
                                        </tr>
                                        <tr>
                                            <%--<td>
                                                <input type="checkbox" class="case" value="true" /></td>--%>
                                            <td>
                                                <select class="form-control" id="ddlTreeSpecies" style="width: 100px;">
                                                    <option value="">-- Select --</option>
                                                    <option value="Aadu">Aadu</option>
                                                    <option value="aakhya">aakhya</option>
                                                    <option value="Aam">Aam</option>
                                                    <option value="Akhrot">Akhrot</option>
                                                    <option value="Alstonia">Alstonia</option>
                                                    <option value="Amaltas">Amaltas</option>
                                                    <option value="Amla">Amla</option>
                                                    <option value="Anjeer">Anjeer</option>
                                                    <option value="Arjun">Arjun</option>
                                                    <option value="Aruacaria">Aruacaria</option>
                                                    <option value="Ashoka">Ashoka</option>
                                                    <option value="Bahera">Bahera</option>
                                                    <option value="Bakain">Bakain</option>
                                                    <option value="Bal Makhira">Bal Makhira</option>
                                                    <option value="Banj">Banj</option>
                                                    <option value="Banyan">Banyan</option>
                                                    <option value="Bel Patti">Bel Patti</option>
                                                    <option value="Cassia Siamea">Cassia Siamea</option>
                                                    <option value="Chakrasia">Chakrasia</option>
                                                    <option value="Chamkharik">Chamkharik</option>
                                                    <option value="Champa">Champa</option>
                                                    <option value="Chandan">Chandan</option>
                                                    <option value="Cheed">Cheed</option>
                                                    <option value="Chil">Chil</option>
                                                    <option value="Chironji">Chironji</option>
                                                    <option value="Christmas">Christmas</option>
                                                    <option value="Coral">Coral</option>
                                                    <option value="Deodar">Deodar</option>
                                                    <option value="Dhak Palas">Dhak Palas</option>
                                                    <option value="Dhau/Bakli">Dhau/Bakli</option>
                                                    <option value="Gulmohar">Gulmohar</option>
                                                    <option value="Gutel">Gutel</option>
                                                    <option value="Haldu">Haldu</option>
                                                    <option value="Harad">Harad</option>
                                                    <option value="Harr">Harr</option>
                                                    <option value="Imli">Imli</option>
                                                    <option value="Jamun">Jamun</option>
                                                    <option value="Kadam">Kadam</option>
                                                    <option value="Kail">Kail</option>
                                                    <option value="Kanak Champa">Kanak Champa</option>
                                                    <option value="Kanji">Kanji</option>
                                                    <option value="Kanju">Kanju</option>
                                                    <option value="Kapur">Kapur</option>
                                                    <option value="Kardhai">Kardhai</option>
                                                    <option value="Kathal">Kathal</option>
                                                    <option value="Khair">Khair</option>
                                                    <option value="Kharshu">Kharshu</option>
                                                    <option value="Kukaat">Kukaat</option>
                                                    <option value="Kusum">Kusum</option>
                                                    <option value="Lichi">Lichi</option>
                                                    <option value="Lokaat">Lokaat</option>
                                                    <option value="Mahua">Mahua</option>
                                                    <option value="Molshree">Molshree</option>
                                                    <option value="Morinda">Morinda</option>
                                                    <option value="Morpankhi">Morpankhi</option>
                                                    <option value="Moru">Moru</option>
                                                    <option value="Nashpatti">Nashpatti</option>
                                                    <option value="Neem">Neem</option>
                                                    <option value="Nimbu">Nimbu</option>
                                                    <option value="Papri/Sansadu/Chikri">Papri/Sansadu/Chikri</option>
                                                    <option value="Phaliyant">Phaliyant</option>
                                                    <option value="Phycusnuda">Phycusnuda</option>
                                                    <option value="Pilkhan">Pilkhan</option>
                                                    <option value="Pipal">Pipal</option>
                                                    <option value="Rai">Rai</option>
                                                    <option value="Rakta Chandan">Rakta Chandan</option>
                                                    <option value="Rianj">Rianj</option>
                                                    <option value="Rubber Tree">Rubber Tree</option>
                                                    <option value="Rudraksha">Rudraksha</option>
                                                    <option value="Sagaon">Sagaon</option>
                                                    <option value="Sain/Asna">Sain/Asna</option>
                                                    <option value="Sal">Sal</option>
                                                    <option value="Salai">Salai</option>
                                                    <option value="Semal">Semal</option>
                                                    <option value="Shisham">Shisham</option>
                                                    <option value="Simbal">Simbal</option>
                                                    <option value="siris">siris</option>
                                                    <option value="Surai">Surai</option>
                                                    <option value="Teelkhand">Teelkhand</option>
                                                    <option value="Tejpatta">Tejpatta</option>
                                                    <option value="Tendu">Tendu</option>
                                                    <option value="Tikuma">Tikuma</option>
                                                    <option value="Tun">Tun</option>
                                                    <option value="Tuni">Tuni</option>
                                                    <option value="Vilaayati Dhodi">Vilaayati Dhodi</option>
                                                    <option value="Virola">Virola</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="text" id="TotalnoTreesArea" class="form-control" placeholder="" /></td>
                                            <td>
                                                <input type="text" id="No0to10" name="" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <input type="text" id="No10to20" name="" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <input type="text" id= "No20to30" name="" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <input type="text" id="No30to40" name="" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <input type="text" name="" id="No40to50" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <input type="text" name="" id="No50to60" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <input type="text" name="" id="No60to70" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <input type="text" name="" id="Noabove70" class="form-control" style="width: 35px;" /></td>
                                            <td>
                                                <select class="form-control" id="ddlPositionOfTrees">
                                                    <option value="Standing">Standing</option>
                                                    <option value="Fallen">Fallen</option>
                                                </select></td>
                                            <td>
                                                <select class="form-control" id="ddlConditionofTrees">
                                                    <option value="Green">Green</option>
                                                    <option value="Dry">Dry</option>
                                                </select></td>
                                            <td>
                                                <input type="text" class="btn btn-success" value="Add More" onclick="AddSuspect('');" style="width: 105px;" /></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    
                        <div class="clearfix"></div>
                    <div class="mtop15"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <div id="divSuspect"></div>
                            
                        </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Number of Trees and Species Proposed to be Felled (Exempted)</h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                            <div class="table-responsive">
                                 <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 99%; margin: 0 auto;">
                                    <tbody>
                                        <tr>
                                           <%-- <th>#</th>--%>
                                            <th><strong>Tree species</strong></th>
                                            <th><strong>Total No. of Trees existing in 
			the premises/plot/area</strong></th>
                                            <th><strong>No. of Trees proposed to be 
			Exempted</strong></th>
                                            <th><strong>Position of Trees 
			(Standing/Fallen)</strong></th>
                                            <th><strong>Condition of Trees (Green/Dry)</strong></th>
                                            <th><strong>Action</strong></th>
                                        </tr>
                                        <tr>
                                            <%--<td>
                                                <input type="checkbox" class="form-control"/></td>--%>
                                            <td >
                                                <select class="form-control" id="ddlNonTreeSpecies">
                                                    <option value="">-- Select --</option>
                                                    <option value="Apple">Apple</option>
                                                    <option value="Bakain">Bakain</option>
                                                    <option value="Benjamina">Benjamina</option>
                                                    <option value="betel">betel</option>
                                                    <option value="Bhains/Majanu">Bhains/Majanu</option>
                                                    <option value="Bottle brush">Bottle brush</option>
                                                    <option value="Cadamba">Cadamba</option>
                                                    <option value="calestonia">calestonia</option>
                                                    <option value="Curry Plant">Curry Plant</option>
                                                    <option value="Eucalyptuse all species">Eucalyptuse all species</option>
                                                    <option value="Guava">Guava</option>
                                                    <option value="Harsrangaar">Harsrangaar</option>
                                                    <option value="Jacaranda">Jacaranda</option>
                                                    <option value="Kachhnar">Kachhnar</option>
                                                    <option value="Kaner">Kaner</option>
                                                    <option value="Kazoriya">Kazoriya</option>
                                                    <option value="Kosiyagulka">Kosiyagulka</option>
                                                    <option value="Lishoda">Lishoda</option>
                                                    <option value="Mehandi">Mehandi</option>
                                                    <option value="Muhwa">Muhwa</option>
                                                    <option value="Palm">Palm</option>
                                                    <option value="Pansetia">Pansetia</option>
                                                    <option value="Pao">Pao</option>
                                                    <option value="Paper Mulberry">Paper Mulberry</option>
                                                    <option value="Paper Murmary">Paper Murmary</option>
                                                    <option value="Paulownia">Paulownia</option>
                                                    <option value="Peach">Peach</option>
                                                    <option value="Pear">Pear</option>
                                                    <option value="Pipal Mari">Pipal Mari</option>
                                                    <option value="Populer (except Hill Pipal)">Populer (except Hill Pipal)</option>
                                                    <option value="Robinia">Robinia</option>
                                                    <option value="Rubiya">Rubiya</option>
                                                    <option value="Shahtoot">Shahtoot</option>
                                                    <option value="Shoo babool">Shoo babool</option>
                                                    <option value="Silver Oak">Silver Oak</option>
                                                    <option value="Tomato">Tomato</option>
                                                    <option value="Videsi Cheer">Videsi Cheer</option>
                                                    <option value="Videsi Surai">Videsi Surai</option>
                                                </select></td>
                                            <td>
                                                <input type="text"id="NonTotalnoTreesArea" class="form-control" placeholder=""/></td>
                                            <td>
                                                <input type="text" id="NonPositionOfTrees" class="form-control" placeholder=""/></td>
                                            <td>
                                                <select class="form-control" id="ddlnonConditionofTrees">
                                                    <option value="Standing">Standing</option>
                                                    <option value="Fallen">Fallen</option>
                                                </select></td>
                                            <td>
                                                <select class="form-control" id="dddlnonTotalnoofProposedTrees">
                                                    <option value="Green">Green</option>
                                                    <option value="Dry">Dry</option>
                                                </select></td>
                                            <td>
                                                <input type="text" class="btn btn-success" value="Add More" onclick="AddSuspect2('');" style="width: 105px;" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        <div class="clearfix"></div>


                             <div class="mtop15"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <div id="divSuspect2"></div>
                            
                        </div>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%--Transportation Detail Panel--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Transportation Information
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Transit From</label>
                                <input type="text" id="txtTransitFrom" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Transit To</label>
                                <input type="text" id="txtTransitTo" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Via (Specify the Route/Forest check posts)</label>
                                <input type="text" id="txtTransitVia" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <%-- Other Information Panel--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="AncestralInfo">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Other Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p><span id="ParentProp"><span class="fom-Numbx">1.</span>   Whether, It is a Non-Forest Land?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="NonForest" id="NonForestYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="NonForest" id="NonForestNo" value="0" />
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
                                    <p><span id="Earning"><span class="fom-Numbx">2.</span>   Whether, You are setting up an industry, on this land?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="SetIndustry" id="SetIndustryYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="SetIndustry" id="ParentEarningNo" value="0" />
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
                                    <p><span id="GovtService"><span class="fom-Numbx">3.</span>   Whether, Tree felling permission sought previously, on the same plot of land, if any?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="SoughtPrev" id="SoughtPrevYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="SoughtPrev" id="SoughtPrevNo" value="0" />
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
                                    <p><span><span class="fom-Numbx">4.</span>   Whether, Certificate of Ownership over Tree/Land issued by Tahsildar and above is attached?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="CertAttach" id="CertAttachYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="CertAttach" id="CertAttachNo" value="0" />
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
                                    <p><span><span class="fom-Numbx">5.</span>   Whether, the land of ownership is shared by some other person/Joint ownership?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="SharedOwnership" id="SharedOwnershipYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="SharedOwnership" id="SharedOwnershipNo" value="0" />
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
                                    <p><span><span class="fom-Numbx">6.</span>   If yes, Whether, the NOC from Joint owner/Gram Pradhan/Parshad has been obtained and enclosed?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="NOCObtain" id="NOCObtainYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="NOCObtain" id="NOCObtainNo" value="0" />
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
                                    <p><span><span class="fom-Numbx">7.</span>  Whether, Surveyed sketch map of the land enclosed?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="SketchAttach" id="SketchAttachYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="SketchAttach" id="SketchAttachNo" value="0" />
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
                                    <p><span><span class="fom-Numbx">8.</span> Whether, Location map of the land enclosed?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="LocationMapAttach" id="LocationMapAttachYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="LocationMapAttach" id="LocationMapAttachNo" value="0" />
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
                                    <p><span><span class="fom-Numbx">9.</span> Whether, Enumeration lit of trees to be felled in Annexure-III enclosed?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="EnumerationAttach" id="EnumerationAttachYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="EnumerationAttach" id="EnumerationAttachNo" value="0" />
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
                                    <p><span><span class="fom-Numbx">10.</span> Whether exempted from TPA-1976?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="ExemptedTPA1976" id="ExemptedTPAYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="ExemptedTPA1976" id="ExemptedTPANo" value="0" />
                                        <label>No</label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                        </div>
                         <div class="clearfix"></div>
                        <div class="mtop10"></div>
                        <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p><span><span class="fom-Numbx">10.</span> Whether, Security Deposit towards replanting is paid?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="SecDepositPaid" id="SecDepositPaidYes" value="1" />
                                        <label>Yes</label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="SecDepositPaid" id="SecDepositPaidNo" value="0" />
                                        <label>No</label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                        </div>--%>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <%--Declaration Details--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="Div2">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Declaration</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-sm-6 col-md-6 col-lg-12">
                            <label class="text-justify" style="line-height:20px;"><span class="pull-left" >1.</span> <span style="display: flex;">It is hereby certify that, I/We have applied for tree felling NOC, under the sections of Uttarakhnad Enterprises Single Window Facilitation and Clearance Act, 2012. I/We inform ourselves and uphold the policies, rules, regulations and laws that govern/related to our work.</span><br />

<span class="pull-left" >2.</span> <span style="display: flex;"> I/We do, hereby undertake that in the forthcoming rainy season, I shall replant more than 4 year old seedlings of tree/trees (a minimum of two trees against each tree to be felled) in place of the trees felled as per the Sec. 7 of the Uttar Pradesh Tree (Protection), Act 1976, as adopted in Uttarakhand, and maintain the same for a period of 5 (five) years, failing which, plants will be raised by the Competent Authority / Designated Officer at my Cost (will be deposited as NSC) under section 9.</span><br />

<span class="pull-left" >3.</span> <span style="display: flex;"> I/We, shall move the felled/cut/removed trees/timber with a valid transit permit/pass (Ravanna) issued by competent forest authority, as prescribed under Uttarakhnad transit of timber and other forest produce rules-2012</span><br />

<span class="pull-left" >4. </span><span style="display: flex;"> I/We do, hereby certify that Details of the Land, Tree Species and other detailed information as furnished and disclosed above are true and correct to the best of my knowledge.</span><br />

Permission for cut/felling/removal of trees as mentioned above is solicited in terms of Sec. 5 of the Uttar Pradesh Tree (Protection), Act 1976, as adopted in Uttarakhand. </label><br />
                            <label class="text-justify">
                                <input name=""  type="checkbox" id="chkDeclaration" class="pull-left" onclick="javascript: Declaration(this.checked);"  />
                                <b style="display: flex; line-height: 22px;"> I agree that all information provided by me is true to my knowledge.

                                </b>
                            </label>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container text-center">
                    <input type="button"  id="btnSubmit2"  class="btn btn-success" value="Submit" onclick="SubmitData();" />
                    <input type="button" id="btClear" class="btn btn-danger mleft10" value="Cancel" onclick="Reset();" />
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDNFNM" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    
        <asp:HiddenField ID="hdfSuspect" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdfSuspect2" runat="server" ClientIDMode="Static" />
    

</asp:Content>
