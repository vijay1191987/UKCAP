<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="FamilyRegistrationForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.FamilyRegistration.FamilyRegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#AddFamilyMember").hide();
            $(window).on('load', function () {
                $('#costumModal2').modal('show');
            }); 
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
            $('#txtAddMemberDOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    GetAge();
                }
            });
            $("#ddlRegType").click(function () {
                if (this.value == 3) {
                    $("#AddFamilyMember").show(500);
                }
                else {
                    $("#AddFamilyMember").hide(500);
                }
            });

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="costumModal2" class="modal" data-easein="flipXIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h1 style="font-size: 1.3em; font-weight: bold;">Please choose your type.
                    </h1>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <select class="form-control" id="ddlRegType">
                                <option value="0">-Select-</option>
                                <option value="1">Registration</option>
                                <option value="2">Renewal</option>
                                <option value="3">Add Family Member</option>
                            </select>
                        </div>

                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer" style="text-align: center !important;">
                    <%-- <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">
                            Close
                        </button>--%>

                    <input type="button" data-dismiss="modal" aria-hidden="true" class="btn btn-primary" value="Proceed" title="Proceed to Service" />

                </div>
            </div>
        </div>
    </div>
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>FAMILY REGISTRATION FORM<small class="pull-right txt_white pright10">Language :
                        <input type="button" id="ContentPlaceHolder1_btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
            </div>
            <%--Basic Details START Here--%>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Family Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <%--<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Type of Registration</label>
                                <select class="form-control" id="ddlRegistrationType">
                                    <option value="0">-Select-</option>
                                    <option value="1">Registration with 1 Month</option>
                                    <option value="2">Registration after 1 Month and within 1 year</option>
                                    <option value="3">Registration after 1 Year</option>
                                </select>
                            </div>
                        </div>--%>


                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Family Chief Name</label>
                                <input type="text" id="txtChieffullname" placeholder="Family Chief Full Name" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Father's/Husband's Name</label>
                                <input type="text" id="txtFatherHusbandName" placeholder="Father's/Husband's Name" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Date of Birth</label>

                                <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" autocomplete="off" />

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory ">Age Detail</label>
                                <input type="text" id="txtAge" placeholder="Age Detail" class="form-control" />
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Gender</label>
                                <select class="form-control" id="ddlGender">
                                    <option value="0">-Select-</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>Aadhaar No</label>
                                <input type="text" id="txtAadhaarNo" placeholder="Aadhaar No" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Caste</label>
                                <select class="form-control" id="ddlCaste">
                                    <option value="0">-Select-</option>
                                    <option value="1">SC</option>
                                    <option value="2">ST</option>
                                    <option value="3">GORKHA</option>
                                    <option value="4">GEN</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Sub Caste</label>
                                <select class="form-control" id="ddlSubcaste">
                                    <option value="0">-Select-</option>
                                    <option value="1">Tamang</option>
                                    <option value="2">Oil</option>
                                    <option value="3">Thapalial</option>
                                    <option value="4">Thapa (Kaucha)</option>
                                    <option value="5">Tharoo</option>
                                    <option value="6">Dhami</option>
                                    <option value="7">Dhind</option>
                                    <option value="8">Dhobi</option>
                                    <option value="9">Kanwar</option>
                                    <option value="10">Dhauvi</option>
                                    <option value="11">Hairdresser</option>
                                    <option value="12">Nath</option>
                                    <option value="13">Nath Goswami</option>
                                    <option value="14">Neggi</option>
                                    <option value="15">Pawar</option>
                                    <option value="16">Panthee</option>
                                    <option value="17">Relegation</option>
                                    <option value="18">Pandey</option>
                                    <option value="19">Sail</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">
                                    Religion</label>
                                <select class="form-control" id="ddlReligion" name="Religion">
                                    <option value="Select Religion">Select</option>
                                    <option value="Hindu">Hindu</option>
                                    <option value="Islam">Islam</option>
                                    <option value="Jain">Jain</option>
                                    <option value="Sikh">Sikh</option>
                                    <option value="Christian">Christian</option>
                                    <option value="Budhist">Budhist</option>
                                    <option value="Othr">Other's</option>
                                </select>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>Current Status</label>
                                <select class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="1">Living</option>
                                    <option value="2">Dead</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>Mobile No</label>
                                <input type="text" id="txtMobileNo" placeholder="Mobile No" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-4">
                            <div class="form-group">
                                <label>Email ID</label>
                                <input type="text" id="txtEmailID" placeholder="Email ID" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>Occupation</label>
                                <select class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="1">Business</option>
                                    <option value="2">Doctor</option>
                                    <option value="3">Housewife</option>
                                    <option value="4">Advocate</option>
                                    <option value="5">Kisan</option>
                                    <option value="6">Govt.Job</option>
                                    <option value="7">Private Job</option>
                                    <option value="8">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>Educated</label>
                                <select class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="1">Yes</option>
                                    <option value="2">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label>Education</label>
                                <input type="text" class="form-control" placeholder="Education" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Comment</label>
                                <textarea class="form-control" rows="2" cols="2" style="resize: none;"></textarea>
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
            <%-- Address Details--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Address Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="AreaType">Type of Area </label>
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
                                Address Line-1 (Care of)
                            </label>
                            <input name="AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-5 col-lg-5">
                        <div class="form-group">
                            <label for="AddressLine2">
                                Address Line-2 (Building)
                            </label>
                            <input name="AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="" for="RoadStreetName">
                                Road/Street Name
                            </label>
                            <input name="RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label for="LandMark">
                                Landmark
                            </label>
                            <input name="LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="" for="Locality">
                                Locality
                            </label>
                            <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
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
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District
                            </label>
                            <select name="ddlDistrict" id="PddlDistrict" class="form-control">
                                <option value="0">Select District</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
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
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
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
                    <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
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
            <div class="clearfix"></div>

            <%--Added Couple Members--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="AddFamilyMember">
                <div class="box-heading">
                    <h4 class="box-title register-num">Couples of Family Members Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                        <table cellpadding="0" cellspacing="0" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Name of Member</th>
                                    <th>Father's/Husband Name</th>
                                    <th>Date of Birth</th>
                                    <th>Age</th>
                                    <th>Gender</th>
                                    <th>Context</th>
                                    <th>Occupation</th>
                                    <th>Educated</th>
                                    <th>Education</th>
                                    <th>Current Status</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="text" class="form-control" id="txtAddMemberDOB" placeholder="DD/MM/YYYY" autocomplete="off" /></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><select class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="1">Business</option>
                                    <option value="2">Doctor</option>
                                    <option value="3">Housewife</option>
                                    <option value="4">Advocate</option>
                                    <option value="5">Kisan</option>
                                    <option value="6">Govt.Job</option>
                                    <option value="7">Private Job</option>
                                    <option value="8">Other</option>
                                </select></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="text" class="form-control" placeholder="" /></td>
                                    <td><input type="button" class="btn btn-primary" value="ADD"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
</asp:Content>
