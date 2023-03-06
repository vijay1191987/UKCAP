<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="MountainResidentForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.MountainResidentCertificate.MountainResidentForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            $('#txtNativeLvlihdDate').datepicker({
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

        function fuShowHideDiv(divID, isTrue) {
            debugger;
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID).show(800);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(800);
            }
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



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>MOUNTAIN RESIDENT CERTIFICATE <small class="pull-right txt_white pright10">Language :
                        <input type="button" id="ContentPlaceHolder1_btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
            </div>
            <%--Basic Details START Here--%>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Applicant Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Reason for Apply</label>
                                <input type="text" id="txtapplyreason" placeholder="Reason for apply" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Full Name of Applicant</label>
                                <input type="text" id="txtfullname" placeholder="Applicant Full Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Father's / Husband's Name</label>
                                <input type="text" id="txtfathername" placeholder="Father/Husband Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Mother Name</label>
                                <input type="text" id="txtmothername" placeholder="Mother Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Date of Birth</label>

                                <input type="text" id="txtDOB" placeholder="DD/MM/YYYY" class="form-control" />

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory ">Age Detail</label>
                                <input type="text" id="txtAge" placeholder="Age Detail" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Birth Place</label>
                                <input type="text" id="txtAppBirthPlace" placeholder="Birth Place" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Gender</label>
                                <select class="form-control" id="ddlgender">
                                    <option value="0">-Select-</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label>Aadhaar No</label>
                                <input type="text" id="txtAadhaarNo" placeholder="Aadhaar No." maxlength="12" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Father's City of Birth</label>
                                <input type="text" id="txtFatherBirthCity" placeholder="Father's Birth City" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>Email ID</label>
                                <input type="text" id="txtEmailID" placeholder="Email ID" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Mobile No</label>
                                <input type="text" id="txtMobileNo" placeholder="Mobile No." maxlength="12" class="form-control" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">For How long residence in Uttarakhand</label>
                                <input type="text" id="txtResidencePeriod" placeholder="No of Year" class="form-control" />
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
         
            <%--Ancestral Information--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Ancestral Information</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p><span class="fom-Numbx">1.</span> Does the applicant's parents/grandfather/grandfather have ancestral property here?</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio1" id="haveprptyYes" value="Yes" onclick="return fuShowHideDiv('haveancestralprpty', 1);" />
                                        Yes<label></label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio1" id="haveprptyNo" value="No" onclick="return fuShowHideDiv('haveancestralprpty', 0);" />
                                        No<label></label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="haveancestralprpty" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2" >
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>If so from</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtPropertyDate" class="form-control mbtm10" name="txtPropertyDate" placeholder="No. of Years" />
                                    </div>
                                </div>
                            </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Provide Details</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtPropertyDetails" class="form-control mbtm10" name="txtPropertyDetails" placeholder="Describe Property Details" />
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                         <div class="clearfix"></div>
                        <div class="form-group">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p><span class="fom-Numbx">2.</span> Is the applicant's parents getting their livelihood in their native village?</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio2" id="livelihoodYes" value="Yes" onclick="return fuShowHideDiv('nativelivelihoodDtl', 0);" />
                                        Yes<label></label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio2" id="livelihoodNo" value="No" onclick="return fuShowHideDiv('nativelivelihoodDtl', 1);" />
                                        No<label></label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div id="nativelivelihoodDtl" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2" >
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>If not then</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtNativeVillageDetails" class="form-control mbtm10" name="txtNativeVillageDetails" placeholder="Type of Livelihood" />
                                    </div>
                                </div>
                            </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>From When</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtNativeLvlihdDate" class="form-control mbtm10" name="txtNativeLvlihdDate" placeholder="DD/MM/YYYY" />
                                    </div>
                                </div>
                            </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Business</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtNativeBusiness" class="form-control mbtm10" name="txtNativeBusiness" placeholder="Business Name" />
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p><span class="fom-Numbx">3.</span> Is the applicant's parents in government service?</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio2" id="parentgovtjobYes" value="Yes" onclick="return fuShowHideDiv('parentgovtjobDtl', 1);" />
                                        Yes<label></label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio2" id="parentgovtjobNo" value="No" onclick="return fuShowHideDiv('parentgovtjobDtl', 0);" />
                                        No<label></label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div id="parentgovtjobDtl" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2" >
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, then district</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtParentJobDistrict" class="form-control mbtm10" name="txtParentJobDistrict" placeholder="District Name" />
                                    </div>
                                </div>
                            </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Department</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtParentJobDept" class="form-control mbtm10" name="txtParentJobDept" placeholder="Department Name" />
                                    </div>
                                </div>
                            </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Post</p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-12 pleft0 pright0">
                                        <input type="text" id="txtParentJobPost" class="form-control mbtm10" name="txtParentJobPost" placeholder="Post Name" />
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>

                    </div>
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
