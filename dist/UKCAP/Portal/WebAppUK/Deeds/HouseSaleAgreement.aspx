<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="HouseSaleAgreement.aspx.cs" Inherits="CitizenPortal.WebAppUK.Deeds.HouseSaleAgreement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
    <link href="../css/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../js/bootbox.min.js"></script>
      <script src="/Scripts/jquery.msgBox.js"></script>
     <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <script src="HouseSaleAgreement.js" type="text/javascript"></script>

    <script type="text/javascript">
        var a = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
        var b = ['Hundred', 'Thousand', 'Lakh', 'Crore'];
        var c_0 = ['Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Ninteen'];
        var d = ['Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

        function convertNumToWord(number) {
            debugger;
            var number = $("#txtAdvanceAmountInNumber").val();
            if (number < 1) {
                //alertPopup('Cannot convert more than nine digits');
                $('#txtAdvanceAmountInWords').val('');
            }
            else {
                var c, rm;
                c = 1;
                string = '';
                number == 0 && (string = 'Zero');
                while (number != 0) {
                    switch (c) {
                        case 1:
                            rm = number % 100;
                            pass(rm);
                            number > 100 && number % 100 != 0 && display('And ');
                            number = ~~(number / 100);
                            break;
                        case 2:
                            rm = number % 10;
                            if (rm != 0) {
                                display(' ');
                                display(b[0]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 10);
                            break;
                        case 3:
                            rm = number % 100;
                            if (rm != 0) {
                                display(' ');
                                display(b[1]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 100);
                            break;
                        case 4:
                            rm = number % 100;
                            if (rm != 0) {
                                display(' ');
                                display(b[2]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 100);
                            break;
                        case 5:
                            rm = number % 100;
                            if (rm != 0) {
                                display(' ');
                                display(b[3]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 100);
                    }
                    ++c;

                }

                $('#txtAdvanceAmountInWords').val(string + ' Only');

            }

        }

        function display(s) {

            var t;
            t = string;
            string = s;
            string += t;
        }

        function pass(number) {

            var q, rm;
            number < 10 && display(a[number]);
            number > 9 && number < 20 && display(c_0[number - 10]);
            if (number > 19) {
                rm = number % 10;
                if (rm == 0) {
                    q = ~~(number / 10);
                    display(d[q - 2]);
                }
                else {
                    q = ~~(number / 10);
                    display(a[rm]);
                    display(' ');
                    display(d[q - 2]);
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title">WHO YOU ARE ?</h1>
                </div>
                <div class="modal-body">
                    <select class="form-control" id="txtApplicantType">
                        <option value="0">Please Select...</option>
                        <option value="1">Vendor</option>
                        <option value="2">Vendee</option>
                    </select>
                    <br />
                    <input id="errorMsg" type="text" hidden="hidden" value="" style="color:red; width: 100%; border:none" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary"  onclick="submitApplicantType(this);">Submit</button>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="row">
        <div class="col-lg-12">
            <h2 class="form-heading" style="width: 98%; margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Agreement For Sale of a House</h2>
        </div>
        <div class="col-lg-12 mtop5">
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Verify Yourself</h4>
                </div>
                <div class="box-body box-body-open">
                    <%--<div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Are you registered As</label>

                            <select class="form-control" id="RegistrationType">
                                <option value="0">Select</option>
                                <option value="1">Vendor</option>
                                <option value="2">Vendee</option>
                            </select>


                        </div>
                    </div>--%>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Verification Type</label>

                            <select class="form-control" id="txtVerificationType">
                                <option value="0">Select Verification Type</option>
                                <option value="1">Aadhaar/UID</option>
                            </select>


                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Aadhaar/UID Number</label>
                            <div class="col-xs-8 pleft0">
                                <input type="text" id="txtUIDVerify" placeholder="Enter your Aadhaar/UID No" maxlength="12" class="form-control" />
                            </div>
                            <div class="col-xs-4">
                                <input type="button" id="verifyUID" class="btn btn-primary" value="Verify UID" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="col-lg-6 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Vendee Basic Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label class="manadatory">Name of Vendee</label>
                            <input type="text" id="txtVendeeName" placeholder="Vendee Full Name" maxlength="100" onkeypress="return ValidateAlpha(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">DOB</label>
                            <input type="text" id="txtVendeeDOB" class="form-control" placeholder="DOB" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pleft0">
                        <div class="form-group">
                            <label class="manadatory">Gender</label>
                            <select class="form-control" id="txtVendeeGender">
                                <option value="0">Select</option>
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                                <option value="T">Transgender</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label class="manadatory">Email ID</label>
                            <input type="text" id="txtVendeeEmailId" placeholder="Email Id" maxlength="100" onchange="EmailValidation();"  class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Mobile No</label>
                            <input type="text" id="txtVendeeMobile" placeholder="Mobile" maxlength="10" onkeypress="return onlyNumbers(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory">Vendee Present Address</label>
                            <input type="text" id="txtVendeeRentPlace" placeholder="Vendee Full Address" maxlength="100" onkeypress="return Alphanumericspecialchar(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">State</label>
                            <input type="text" class="form-control" id="txtVendeeState" style="display:none" />
                            <select class="form-control" id="DLLVandeeState">
                                <option value="0">Select</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <input type="text" class="form-control" id="txtVendeeDistrict" style="display:none"  />
                            <select class="form-control" id="DdlVendeeDistrict">
                                <option value="0">-Select District-</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Block/Taluka</label>
                            <input type="text" class="form-control" id="txtVendeeBlock" style="display:none" " />
                            <select class="form-control" id="DdlVendeeBlock">
                                <option value="0">-Select Block-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Pincode</label>
                            <input type="text" id="txtVendeePincode" placeholder="Pincode" maxlength="6" onkeypress="return onlyNumbers(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-lg-6 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Vendor Basic Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label class="manadatory">Name of Vendor</label>
                            <input type="text" id="txtVendorName" placeholder="Vendor Full Name" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">DOB</label>
                            <input type="text" id="txtVendorDOB" class="form-control" placeholder="DOB" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pleft0">
                        <div class="form-group">
                            <label class="manadatory">Gender</label>
                            <select class="form-control" id="txtVendorGender">
                                <option value="0">Select</option>
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                                <option value="T">Transgender</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label class="manadatory">Email ID</label>
                            <input type="text" id="txtVendorEmailId" placeholder="Email Id" maxlength="100"   onchange="EmailValid();" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Mobile No</label>
                            <input type="text" id="txtVendorMobile" placeholder="Mobile" maxlength="10" onkeypress="return onlyNumbers(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory">Vendor Present Address</label>
                            <input type="text" id="txtVendorRentPlace" placeholder="Vendor Full Address" maxlength="100" onkeypress="return Alphanumericspecialchar(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">State</label>
                            <input type="text" class="form-control" id="txtVendorState" style="display:none" />
                            <select class="form-control" id="ddlVendorState">
                                <option value="0">Select</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <input type="text" class="form-control" id="txtVendorDistrict" style="display:none"  />
                            <select class="form-control" id="ddlVendorDistrict">
                                <option value="0">-Select District-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Block/Taluka</label>
                            <input type="text" class="form-control" id="txtVendorBlock" style="display:none" " />
                            <select class="form-control" id="ddlVendorBlock">
                                <option value="0">-Select Block-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Pincode</label>
                            <input type="text" id="txtVendorPincode" placeholder="Pincode" maxlength="6" onkeypress="return onlyNumbers(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Vendee Permanent Address
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="AddressLine1">
                                Address Line-1 (Care of)
                            </label>
                            <input name="" type="text" id="VendeeAddressLine1" class="form-control" placeholder="First Line Address" maxlength="100" autofocus="" onkeypress="return Alphanumericspecialchar(event);"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="AddressLine2">
                                Address Line-2 (Building)
                            </label>
                            <input name="" type="text" id="VendeeAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="100" autofocus="" onkeypress="return Alphanumericspecialchar(event);"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="RoadStreetName">
                                Road/Street Name
                            </label>
                            <input name="" type="text" id="VendeeRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="LandMark">
                                Landmark
                            </label>
                            <input name="" type="text" id="VendeeLandMark" class="form-control" placeholder="Landmark" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="Locality">
                                Locality
                            </label>
                            <input name="" type="text" id="VendeeLocality" class="form-control" placeholder="Locality" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlState">
                                State
                            </label>
                             <input type="text" id="VendeetextState" class="form-control" style="display:none" />
                             <select name="" id="VendeeddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                <option value="0">-Select State-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District
                            </label>
                            <input type="text" id="VendeeTextDistrict" class="form-control" style="display:none" />
                            <select name="" id="VendeeddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                <option value="0">-Select District-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlTaluka">
                                Block/Taluka
                            </label>
                             <input type="text" id="VendeetextTaluka" class="form-control" style="display:none" />
                            <select name="" id="VendeeddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                <option value="0">-Select Block-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory text-nowrap ng-binding" for="ddlVillage">
                                Panchayat/Village/City
                            </label>
                            <input type="text" id="VendeetextVillage" class="form-control" style="display:none" />
                            <select name="" id="VendeeddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                <option value="0">-Select Panchayat-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                PinCode
                            </label>
                            <input name="" type="text" id="VendeetxtPinCode" class="form-control" placeholder="PinCode" maxlength="6" onkeypress="return onlyNumbers(event);" autofocus="" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>

            </div>

            <div class="col-md-6 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Vendor Permanent Address
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="AddressLine1">
                                Address Line-1 (Care of)
                            </label>
                            <input name="" type="text" id="VendorAddressLine1" class="form-control" placeholder="First Line Address" maxlength="100" autofocus="" onkeypress="return Alphanumericspecialchar(event);"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="AddressLine2">
                                Address Line-2 (Building)
                            </label>
                            <input name="" type="text" id="VendorAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="100" autofocus="" onkeypress="return Alphanumericspecialchar(event);"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="RoadStreetName">
                                Road/Street Name
                            </label>
                            <input name="" type="text" id="VendorRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="LandMark">
                                Landmark
                            </label>
                            <input name="" type="text" id="VendorLandMark" class="form-control" placeholder="Landmark" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="Locality">
                                Locality
                            </label>
                            <input name="" type="text" id="VendorLocality" class="form-control" placeholder="Locality" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="VendorddlState">
                                State
                            </label>
                            <input type="text"  class="form-control" id="VendortextState" style="display: none" />
                            <select name="" id="VendorddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                <option value="0">-Select State-</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District
                            </label>
                            <input type="text" class="form-control" id="VendorTextDistrict" style="display: none" />
                            <select name="" id="VendorddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                <option value="0">-Select District-</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlTaluka">
                                Block/Taluka
                            </label>
                             <input type="text" class="form-control" id="VendortextTaluka" style="display:none"/>
                            <select name="" id="VendorddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                <option value="0">-Select Block-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory text-nowrap ng-binding" for="ddlVillage">
                                Panchayat/Village/City
                            </label>
                               <input type="text" class="form-control"  id="VendortextVillage" style="display:none"/>
                            <select name="" id="VendorddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                <option value="0">-Select Panchayat-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">
                                PinCode
                            </label>
                            <input name="" type="text" id="VendortxtPinCode" class="form-control" placeholder="PinCode" maxlength="6" onkeypress="return onlyNumbers(event);" autofocus="" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>

            </div>

            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">House/Flat Sale Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">
                                House/Flat Full Address
                            </label>
                            <input name="" type="text" id="txtSaleHouseFullAddress" class="form-control" placeholder="House/Flat Full Address" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Landmark
                            </label>
                            <input name="" type="text" id="txtSaleHouseLandmark" class="form-control" placeholder="Landmark" />
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                City
                            </label>
                            <input name="" type="text" id="txtSaleHouseCity" class="form-control" placeholder="City" />
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Pincode
                            </label>
                            <input name="" type="text" id="txtSaleHousePincode" maxlength="6" onkeypress="return onlyNumbers(event);" class="form-control" placeholder="PinCode" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Agreement Date
                            </label>
                            <input name="" type="text" id="txtAgreementDate" class="form-control" placeholder="Agreement Date" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Agreement Place
                            </label>
                            <input name="" type="text" id="txtAgreementPlace" class="form-control" placeholder="Agreement Place" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Rate of Interest (p.m) - In case of default case
                            </label>
                            <input name="" type="text" id="txtRateOfInterest" class="form-control" placeholder="Rate of Interest %" maxlength ="3" />
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Refund Amount (In case of Breach of Agreement)
                            </label>
                            <input name="" type="text" id="txtRefundAmount" class="form-control" placeholder="Refund Amount" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Intimation Period to Advocate
                            </label>
                            <input name="" type="text" id="txtAdvocateIntimationPeriod" class="form-control" placeholder="(In Days)" onkeypress="return onlyNumbers(event); " />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Advance Amount Paid Date
                            </label>
                            <input name="" type="text" id="txtAdvancePaidDate" class="form-control" placeholder="Advance Amount Date" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                        <div class="form-group">
                            <label class="manadatory">
                                Advance Amount
                            </label>
                            <div class="col-xs-4 pleft0">
                                <input name="" type="text" id="txtAdvanceAmountInNumber" onchange="convertNumToWord();" class="form-control" placeholder="(InNumber)" />
                            </div>
                            <div class="col-xs-8 pright0 pleft0">
                                <input name="" type="text" id="txtAdvanceAmountInWords" class="form-control" placeholder="(InWords)" />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Deed Complete Period
                            </label>
                            <div class="col-xs-4 pleft0">
                                <input name="" type="text" id="txtDeedPeriodInYears" class="form-control" onkeypress="return onlyNumbers(event);" placeholder="Year" maxlength ="4" />
                            </div>
                            <div class="col-xs-4 pright0 pleft0">
                                <input name="" type="text" id="txtDeedPeriodInMonths" class="form-control" placeholder="Months" onkeypress="return onlyNumbers(event);" maxlength ="2"  />
                            </div>
                            <div class="col-xs-4 pright0">
                                <input name="" type="text" id="txtDeedPeriodInDays" class="form-control" placeholder="Days" onkeypress="return onlyNumbers(event);" maxlength ="2"  />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Refund Amount (Incase, Title Not Clear)
                            </label>
                            <input name="" type="text" id="txtTitleNotClearRefundAmt" class="form-control" placeholder="Refund Amount Incase"  />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>

            <div class="col-lg-12 box-container">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="button" class="dark_blueBtn" value="Submit" onclick="SubmitData(this);" />
                    <input type="submit" name="" value="Cancel" class="cancel_Btn2" />
                </div>
            </div>
        </div>
        <input type="hidden" id="HFUIDData" />
    </div>
</asp:Content>
