<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="EmploymentRegistration.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.NewEmploymentReg.EmploymentRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#SpouseName").hide();
            $("#ddlMaritalStatus").click(function ()
            {
                if (this.value == 1)
                {
                    $("#SpouseName").show(500);
                }
                else
                {
                    $("#SpouseName").hide(500);
                }
            });

            $("#CasteCertPanel").hide();
            $("#ddlCaste").click(function () {
                if (this.value == 1) {
                    $("#CasteCertPanel").show(500);
                }
                else if (this.value == 2) {
                    $("#CasteCertPanel").show(500);
                }
                else if (this.value == 3) {
                    $("#CasteCertPanel").show(500);
                }
                else {
                    $("#CasteCertPanel").hide(500);
                }
            });
            

            $('#txtDOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });

            $('#txtCCertificateDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            $('#txtExmenAppointmentDte').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            }); 
            $('#txtExmenDischargeDte').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            $('#txtCertDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
               
        });
        function fuShowHideDiv(divID, isTrue)
        {
            debugger;
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



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                  <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Application for New Employment Registration<small class="pull-right txt_white pright10">Language :
                        <input type="button" id="ContentPlaceHolder1_btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
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
                                <label class="manadatory ">Applicant Name</label>
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
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">D.O.B</label>
                                <div class="col-lg-8 pleft0">
                                    <input type="text" maxlength="30" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" />
                                </div>
                                <div class="col-lg-4 pright0">
                                    <input type="text" maxlength="30" id="txtAge" placeholder="Age" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory ">Gender</label>
                                <select class="form-control" id="ddlGender">
                                    <option value="0">-Select-</option>
                                    <option value="1">Male</option>
                                    <option value="2">Female</option>
                                    <option value="3">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Religion</label>
                                <select class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="1">SC</option>
                                    <option value="2">ST</option>
                                    <option value="3">OBC</option>
                                    <option value="4">GEN</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Caste</label>
                                <select class="form-control" id="ddlCaste">
                                    <option value="0">-Select-</option>
                                    <option value="1">SC</option>
                                    <option value="2">ST</option>
                                    <option value="3">OBC</option>
                                     <option value="4">GURKHA</option>
                                    <option value="5">GEN</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Aadhaar No</label>
                                <input type="text" maxlength="30" id="txtAadhaarNo" placeholder="Aadhaar No" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Email ID</label>
                                <input type="text" maxlength="30" id="txtEmailID" placeholder="Email Id" class="form-control" />
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
                                <label class="manadatory">Literacy Level</label>
                                <select class="form-control" id="ddlLiteracyLvl">
                                    <option value="0">-Select-</option>
                                    <option value="1">Literate</option>
                                    <option value="2">Illiterate</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Marital Status</label>
                                <select class="form-control" id="ddlMaritalStatus">
                                    <option value="0">-Select-</option>
                                    <option value="1">Married</option>
                                    <option value="2">Unmarried</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2" id="SpouseName">
                            <div class="form-group">
                                <label class="manadatory">Husband/Wife Name</label>
                                <input type="text" maxlength="30" id="txtHusWifeName" placeholder="" class="form-control" />
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
             <%--Caste Certificate Details--%>
             <div class="col-md-12 box-container mTop15" id="CasteCertPanel">
                <div class="box-heading">
                    <h4 class="box-title register-num">Caste Certificate Details
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                         <div class="form-group">
                            <label class="manadatory">Certificate Number</label>
                            <input type="text" class="form-control" placeholder="Certificate Number" />
                        </div>
                        </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                         <div class="form-group">
                            <label class="manadatory">Certificate Issue Date</label>
                            <input type="text" class="form-control" id="txtCCertificateDate" placeholder="DD/MM/YYYY" />
                        </div>
                        </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                         <div class="form-group">
                            <label class="manadatory">Certificate Issued By</label>
                            <input type="text" class="form-control" placeholder="Certificate Issued By" />
                        </div>
                        </div>
                    <div class="clearfix"></div>
                    </div>
                 </div>

            <%--Address Panel--%>
            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Permanent Address
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="AddressLine1">
                                Address Line-1 (Care of)
                            </label>
                            <input name="AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="AddressLine2">
                                Address Line-2 (Building)
                            </label>
                            <input name="AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="RoadStreetName">
                                Road/Street Name
                            </label>
                            <input name="RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="LandMark">
                                Landmark
                            </label>
                            <input name="LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="Locality">
                                Locality
                            </label>
                            <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlState">
                                State
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District
                            </label>
                            <select name="ddlDistrict" id="PddlDistrict" class="form-control">
                                <option value="0">Select District</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label for="ddlTaluka">
                                Block/Taluka
                            </label>
                            <select name="ddlTaluka" id="PddlTaluka" class="form-control">
                                <option value="0">Select Block</option>
                            </select>
                            <input name="txtBlock" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" style="display: none;" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label for="ddlVillage">
                                Panchayat/Village/City
                            </label>
                            <select name="ddlVillage" id="PddlVillage" class="form-control">
                                <option value="0">Select Panchayat</option>
                            </select>
                            <input name="txtPanchayat" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" style="display: none;" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                Pin Code
                            </label>
                            <input name="Address1PinCode" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>

            </div>
            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Present Address <span style="font-size: 13px; padding-right: 0">(For correspondence)</span>
                        <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                            <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);" />Same as Permanent Address</span><span class="clearfix">
                            </span>
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="AddressLine1">
                                    Address Line-1 (Care of)
                                </label>
                                <input name="AddressLine1" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="AddressLine2">
                                    Address Line-2 (Building)
                                </label>
                                <input name="AddressLine2" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="" for="RoadStreetName">
                                    Road/Street Name
                                </label>
                                <input name="RoadStreetName" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="LandMark">
                                    Landmark
                                </label>
                                <input name="LandMark" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="" for="Locality">
                                    Locality
                                </label>
                                <input name="Locality" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlState">
                                    State
                                </label>
                                <select name="ddlState" id="CddlState" class="form-control">
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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlDistrict">
                                    District
                                </label>
                                <select name="ddlDistrict" id="CddlDistrict" class="form-control">
                                    <option value="0">Select District</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="ddlTaluka">
                                    Block/Taluka
                                </label>
                                <select name="ddlTaluka" id="CddlTaluka" class="form-control">
                                    <option value="0">Select Block</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="ddlVillage">
                                    Panchayat/Village/City
                                </label>
                                <select name="CddlVillage" id="CddlVillage" class="form-control">
                                    <option value="0">Select Panchayat</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="PIN">
                                    Pin Code
                                </label>
                                <input name="PinCode" type="text" id="CPinCode" class="form-control" placeholder="PIN" maxlength="6" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>

                </div>
                <div class="clearfix">
                </div>
            </div>

            <%--Qualification Panel--%>
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Qualification Details
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                        <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <thead>
                                <tr>
                                    <th>Qualification Type</th>
                                    <th>Board University</th>
                                    <th style="width: 17%;">Name of School/Institution</th>
                                    <th>Medium</th>
                                    <th>Passing Year</th>
                                    <th>Certificate No.</th>
                                    <th>Category</th>
                                    <th>Percentage/Grade</th>
                                    <th style="width: 7%;">Percentage</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">Middle</option>
                                            <option value="2">10th Pass</option>
                                            <option value="3">12th Pass</option>
                                            <option value="3">ITI Certificate Holder</option>
                                            <option value="3">Diploma Holder</option>
                                            <option value="3">Graduate</option>
                                            <option value="3">Honors Graduate</option>
                                            <option value="3">Post Graduate</option>
                                            <option value="3">Doctorate</option>
                                            <option value="3">Unskilled</option>
                                        </select></td>
                                    <td>
                                        <select class="form-control">
                                            <option value="0">-Select-</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" /></td>
                                    <td>
                                        <select class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">English</option>
                                            <option value="2">Hindi</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="DD/MM/YYYY" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" /></td>
                                    <td>
                                        <select class="form-control">
                                            <option value="0">-Select-</option>
                                        </select></td>
                                    <td>
                                        <select class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">Percentage</option>
                                            <option value="2">Grade</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" /></td>
                                    <td>
                                        <input type="button" value="ADD" class="btn btn-primary" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>


           


            <%--Permanent Residence Certificate Panel--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Do you have state permanent residence certificate? 
                        <small class="pull-right txt_white">
                        <input type="radio" name="haveprc" onclick="return fuShowHideDiv('PRCDtlInfo', 1);"/>Yes
                        <input type="radio" name="haveprc" class="ml10" onclick="return fuShowHideDiv('PRCDtlInfo', 0);" />No</small></h4>
                </div>
                <div class="box-body box-body-open" id="PRCDtlInfo" style="display: none;">
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Local Address ID</label>
                            <select id="ddlLocalAddID" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1">Allotment Letter</option>
                                <option value="2">Voter Card</option>
                                <option value="3">Other</option>
                                <option value="4">Password</option>
                                <option value="5">Ration Card</option>
                                <option value="6">Driving License</option>
                                <option value="7">Telephone Bill</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory ">Identity Card No.</label>
                            <input type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory ">Residence Certificate No.</label>
                            <input type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory ">Date of Certificate</label>
                            <input type="text" class="form-control" id="txtCertDate" placeholder="DD/MM/YYYY" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <select class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Tehsil</label>
                            <select class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%--Working Experience--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Whether do you have any working experience? 
                        <small class="pull-right txt_white">
                        <input type="radio" name="workingexp" onclick="return fuShowHideDiv('WkgnExpDtlInfo', 1);"/>Yes
                        <input type="radio" name="workingexp" class="ml10" onclick="return fuShowHideDiv('WkgnExpDtlInfo', 0);"/>No</small></h4>
                </div>
                <div class="box-body box-body-open" id="WkgnExpDtlInfo" style="display:none;">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                        <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <thead>
                                <tr>
                                    <th style="width: 8%;">Sector</th>
                                    <th style="width: 15%;">Name of Organisation/Dept.</th>
                                    <th style="width: 10%;">Type of Experience</th>
                                    <th>Job Nature</th>
                                    <th>Post/Designation</th>
                                    <th>Experience <small>(in month)</small></th>
                                    <th>Current Salary (p.m.)</th>
                                    <th>Reason for leaving</th>
                                    <th>Nature of Work</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select id="ddlWorkingSector" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">Govt.</option>
                                            <option value="2">Private</option>
                                            <option value="3">NGO</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />

                                    </td>
                                    <td>
                                        <select id="ddlExperienceType" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1"> Administrative</option>
                                            <option value="2"> PVT Full Time Temporary</option>
                                            <option value="3"> PVT Part Time Regular</option>
                                            <option value="4"> PVT Part Time Temporary</option>
                                            <option value="5"> Daily Wages</option>
                                            <option value="6"> Apprenticeship</option>
                                            <option value="7"> Hourly</option>
                                            <option value="8"> Training</option>
                                            <option value="9"> Instructional & Supervisory</option>
                                            <option value="10"> Temp Likely to Continue</option>
                                            <option value="11"> Others</option>
                                            <option value="12"> Part Time Regular</option>
                                            <option value="13"> Part Time Temporary</option>
                                            <option value="14"> Full Time Regular</option>
                                            <option value="15"> Full Time Temporary</option>
                                            <option value="16"> AD-HOC</option>
                                        </select></td>

                                    <td>
                                        <select id="ddlJobNature" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">Permanent</option>
                                            <option value="2">Part-Time</option>
                                            <option value="3">Internship</option>
                                            <option value="4">Traninig</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />
                                    </td>
                                    <td>
                                       <select class="form-control">
                                           <option value="0">-Select-</option>
                                           <option value="1">Personal</option>
                                           <option value="2">Official</option>
                                           <option value="3">NA</option>
                                       </select>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-primary" value="ADD" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

           <%-- Ex-Army Service Man Details--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Whether do you have worked as an Ex-Servicemen?
                        <small class="pull-right txt_white">
                        <input type="radio" name="workingexp" onclick="return fuShowHideDiv('ExservicemenInfo', 1);"/>Yes
                        <input type="radio" name="workingexp" class="ml10" onclick="return fuShowHideDiv('ExservicemenInfo', 0);"/>No</small></h4>
                </div>
                <div class="box-body box-body-open" id="ExservicemenInfo" style="display:none;">
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Type</label>
                            <select id="" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1">Assam Riffles</option>
                                 <option value="2">Navy</option>
                                 <option value="3">Army Air Force</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Rank</label>
                             <select id="" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1">General (CO)</option>
                                <option value="2">  Group Captain (CO)</option>
                                <option value="3">  Havildar (NCO)</option>
                                <option value="4">  II Lieutanant (CO)</option>
                                <option value="5">  Junior Warrant Officer (JCO)</option>
                                <option value="6">  LAC (NCO)</option>
                                <option value="7">  Lance Naik (NCO)</option>
                                <option value="8">  Leading Seaman (NCO)</option>
                                <option value="9">  Petty Officer (NCO)</option>
                                <option value="10">  Lieutanant (CO)</option>
                                <option value="11">  Wing Commander (CO)</option>
                                <option value="12">  Brigadier</option>
                                <option value="13">  Chief Petty Officer (JCO)</option>
                                <option value="14">  Naik (NCO)</option>
                                <option value="15">  Lt.Colonel (CO)</option>
                                <option value="16">  Lt.Commander (CO)</option>
                                <option value="17">  Lt.General (CO)</option>
                                <option value="18">  Other Lower Category</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Service Number</label>
                            <input type="text" class="form-control" placeholder="Service Number"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory ">Character</label>
                             <select id="" class="form-control">
                                <option value="0">-Select-</option>
                                  <option value="1">Good</option>
                                  <option value="2">Bad</option>
                                  <option value="3">Exemplary</option>
                                  <option value="4">Good</option>
                                  <option value="5">Satisfactory</option>
                                  <option value="6">Very Good</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Appointment Date</label>
                           <input type="text" class="form-control" id="txtExmenAppointmentDte" placeholder="DD/MM/YYYY" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Discharge Date</label>
                           <input type="text" class="form-control" id="txtExmenDischargeDte" placeholder="DD/MM/YYYY" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory">Reason for Discharge</label>
                           <textarea rows="2" cols="2" class="form-control" style="resize:none;"></textarea>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                </div>

            <%--Voluntarily Details--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Whether do you have worked as a volunteer?
                        <small class="pull-right txt_white">
                        <input type="radio" name="workingexp" onclick="return fuShowHideDiv('VolunteerInfo', 1);"/>Yes
                        <input type="radio" name="workingexp" class="ml10" onclick="return fuShowHideDiv('VolunteerInfo', 0);"/>No</small></h4>
                </div>
                <div class="box-body box-body-open" id="VolunteerInfo" style="display:none;">
                  
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Voluntary Employment</label>
                             <select id="" class="form-control">
                                <option value="0">-Select-</option>
                                
                            </select>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Vacancy Voluntary</label>
                             <select id="" class="form-control">
                                <option value="0">-Select-</option>
                                  <option value="1">Any type of Vacancy</option>
                                  <option value="2">Troubles to continue</option>
                                  <option value="3">Daily Wages</option>
                                  <option value="4">Adhoc</option>
                                  <option value="5">Regular Only</option>
                                  <option value="6">Temporary</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Other Voluntary</label>
                           <select id="" class="form-control">
                                <option value="0">-Select-</option>
                                  
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Interested in Training</label>
                          <select id="" class="form-control">
                                <option value="0">-Select-</option>
                              <option value="1">Yes</option>
                              <option value="2">No</option>
                              </select>
                        </div>
                    </div>
                     <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Interested in Self Employment</label>
                          <select id="" class="form-control">
                                <option value="0">-Select-</option>
                              <option value="1">Yes</option>
                              <option value="2">No</option>
                              </select>
                        </div>
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
                </div>

            <%--Disability Details--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Whether do you have any disability? 
                        <small class="pull-right txt_white">
                        <input type="radio" name="disability" onclick="return fuShowHideDiv('DisabilityDtlInfo', 1);"/>Yes
                        <input type="radio" name="disability" class="ml10" onclick="return fuShowHideDiv('DisabilityDtlInfo', 0);"/>No</small></h4>
                </div>
                <div class="box-body box-body-open" id="DisabilityDtlInfo" style="display:none;">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                        <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <thead>
                                <tr>
                                    <th style="width: 12%;">Disability Class</th>
                                    <th style="width: 12%;">Partial/Completed</th>
                                    <th style="width: 12%;">Working Capacity</th>
                                    <th>Percentage</th>
                                    <th>Certificate No.</th>
                                    <th>Certificate Issue Date</th>
                                    <th>Certificate Issued By</th>
                                    <th style="width: 20%;">Comments</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select id="" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">Night Blindness</option>
                                            <option value="2"> Blindness</option>
                                            <option value="3"> Lame</option>
                                            <option value="4"> Disk</option>
                                            <option value="5"> Ortho One Arm (Left)</option>
                                            <option value="6"> Ortho One Arm (Right)</option>
                                            <option value="7"> Ortho Both Arms</option>
                                            <option value="8"> Ortho One Leg (Left)</option>
                                            <option value="9"> Ortho One Leg (Right)</option>
                                            <option value="10"> OHC/Locomotor Disability / Cerebral Palsy</option>
                                            <option value="11"> Deaf & Dumb / Hearing & Speech Impairment</option>
                                            <option value="12"> Blind / Partialy Blind / Low Vision</option>
                                            <option value="13"> Mentally Retarded</option>
                                            <option value="14"> Visually Handicapped</option>
                                            <option value="15"> Locomotor / Cerebral Palsy</option>
                                            <option value="16"> Speech & Hearing Imparirement</option>
                                            <option value="17"> Speech Disability</option>
                                            <option value="18"> Hearing Disability</option>
                                            <option value="19"> Mental Handicap</option>

                                        </select></td>
                                    <td>
                                        <select id="" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">Full</option>
                                            <option value="2">Part</option>
                                        </select>

                                    </td>
                                    <td>
                                        <select id="" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1">Deark Works</option>
                                            <option value="2">Operator</option>
                                        </select></td>

                                    <td>
                                        <input type="text" class="form-control" placeholder="" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="" />
                                    </td>
                                    <td>
                                        <textarea rows="1" cols="2" class="form-control"></textarea>
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%--Declaration--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Declaration</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p style="font-family: MyriadPro-Semibold; font-weight: 500; line-height: 28px;">
                            <input type="checkbox" style="float:left; vertical-align:middle;" /><span style="display:flex;">I certify that all the above information / archival certificates by me are true and correct in my knowledge. I am well aware of the fact that if the information given by me is found false / incorrect, then I will continue to be punished according to the rules and along with all facilities being given to me will automatically be considered abrogated.<br />
                            I hereby certify that all the informations / documentary credentials furnished by me are true to the best of my knowledge. If any information furnished by turns out, I will be personally responsible for any implication.</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%--Submit Button--%>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container text-center">
                <input type="button" class="btn btn-success" value="Submit" />
            </div>

        </div>

    </div>
</asp:Content>
