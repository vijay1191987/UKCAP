<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="RentDeed.aspx.cs" Inherits="CitizenPortal.WebAppUK.Deeds.RentDeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script></script>
    <script src="../js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
    <link href="../css/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <link href="css/stylesheet.css" type="text/css" rel="stylesheet" />
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/bootbox.min.js"></script>
    <script src="RentDeedJS.js" type="text/javascript"></script>


 <script type="text/javascript">
        var a = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
        var b = ['Hundred', 'Thousand', 'Lakh', 'Crore'];
        var c_0 = ['Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Ninteen'];
        var d = ['Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

        function convertNumToWord(number) {
            debugger;
            var number = $("#txtSecurityAmnt").val();
            if (number < 1) {
                //alertPopup('Cannot convert more than nine digits');
                $('#txtSecurityAmntInWords').val('');
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
              
                $('#txtSecurityAmntInWords').val(string+' Only');

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
                    <select class="form-control" id="ddlApplicantType">
                        <option value="0">Please Select...</option>
                        <option value="1">Tenant</option>
                        <option value="2">Owner</option>
                    </select>
                    <br />
                    <input id="errorMsg" type="text" hidden="hidden" value="" style="color: red; width: 100%; border: none" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="submitApplicantType(this);">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h2 class="form-heading" style="width: 98%; margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>DEED OF RENT 
            </h2>
        </div>
        <div class="col-lg-12 mtop5">
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Verify Yourself</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Verification Type</label>
                            <select class="form-control" id="ddlVerificationTypeID">
                                <option value="0">Select Verification Type</option>
                                <option value="1">Aadhaar/UID</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Aadhaar/UID Number</label>
                            <div class="col-xs-8 pleft0">
                                <input type="text" id="txtAadhaarUIDNumber" placeholder="Enter your Aadhaar/UID No" maxlength="16" onkeypress="return onlyNumbers(event);" class="form-control" />
                            </div>
                            <div class="col-xs-4">
                                <input type="button" id="btnUIDVerify" class="btn btn-primary" value="Verify UID" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="col-lg-6 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Tenant Details</h4>
                </div>
                <div class="box-body box-body-open">

                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label class="manadatory">Name of Tenant</label>
                            <input type="text" id="txtTenantName" placeholder="Tenant Full Name" maxlength="100" onkeypress="return ValidateAlpha(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">DOB</label>
                            <input type="text" id="txtTenantDOB" class="form-control" placeholder="DOB" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pleft0">
                        <div class="form-group">
                            <label class="manadatory">Gender</label>
                            <select class="form-control" id="ddlTenantGenderID">
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
                            <input type="text" id="txtTenantEmail" placeholder="Email Id" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Mobile No</label>
                            <input type="text" id="txtTenantMobile" placeholder="Mobile" maxlength="10" onkeypress="return onlyNumbers(event);" onchange="checkmobile();" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory">Full Address of Rent Place</label>
                            <input type="text" id="txtTenantRentPlaceAddr"  placeholder="Rent Place Full Address" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">State</label>
                            <input type="text" id="txtTenantStateID" style="display: none" placeholder="Mobile" maxlength="100" class="form-control" />
                            <select class="form-control" id="ddlTenantStateID">
                                <option value="0">-Select State-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <input type="text" id="txtTenantDistID" style="display: none" placeholder="Mobile" maxlength="100" class="form-control" />
                            <select class="form-control" id="ddlTenantDistID">
                                <option value="0">-Select District-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Block/Taluka</label>
                            <input type="text" id="txtTenantDistBlockID" placeholder="Mobile" style="display: none" maxlength="100" class="form-control" />
                            <select class="form-control" id="ddlTenantDistBlockID">
                                <option value="0">-Select Block-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Pincode</label>
                            <input type="text" id="txtTenantPinCode" placeholder="Pincode" maxlength="6" onkeypress="return onlyNumbers(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-lg-6 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Owner/Landlord Basic Details (As per UID/Aadhaar)</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label class="manadatory">Name of Owner/Landlord </label>
                            <input type="text" id="txtLandlordName" placeholder="Owner/Landlord Full Name" maxlength="100" onkeypress="return ValidateAlpha(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">DOB</label>
                            <input type="text" id="txtLandlordDOB" class="form-control" placeholder="DOB" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pleft0">
                        <div class="form-group">
                            <label class="manadatory">Gender</label>
                            <select class="form-control" id="ddlLandlordGenderID">
                                <option value="0">Select</option>
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                                <option value="T">Transgender</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="form-group">
                            <label>Email ID</label>
                            <input type="text" id="txtLandlordEmail" placeholder="Email Id" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Mobile No.</label>
                            <input type="text" id="txtLandlordMobile" placeholder="Mobile No" maxlength="10" onkeypress="return onlyNumbers(event);" onchange="checkmobile();" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                        <div class="form-group">
                            <label class="manadatory">Permanent Address of Owner/Landlord</label>
                            <input type="text" id="txtLandlordRentPlaceAddr" placeholder="Owner Full Address" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">State</label>
                            <input id="txtLandlordStateID" class="form-control" type="text" style="display: none" />
                            <select class="form-control" id="ddlLandlordStateID">
                                <option value="0">-Select State-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <input id="txtLandlordDistID" class="form-control" type="text" style="display: none" />
                            <select class="form-control" id="ddlLandlordDistID">
                                <option value="0">-Select District-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Block/Taluka</label>
                            <input id="txtLandlordDistBlockID" class="form-control" type="text" style="display: none" />
                            <select class="form-control" id="ddlLandlordDistBlockID">
                                <option value="0">-Select Block-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Pincode</label>
                            <input type="text" id="txtLandlordPinCode" placeholder="PinCode" maxlength="6" onkeypress="return onlyNumbers(event);" class="form-control" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Tenant Permanent Address (As per UID/Aadhaar)
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="AddressLine1">
                                Address Line-1 (Care of)
                            </label>
                            <input name="" type="text" id="txtTenantPrmntAddrLine1" class="form-control" placeholder="First Line Address" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="AddressLine2">
                                Address Line-2 (Building)
                            </label>
                            <input name="" type="text" id="txtTenantPrmntAddrLine2" class="form-control" placeholder="Second Line Address" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="RoadStreetName">
                                Road/Street Name
                            </label>
                            <input name="" type="text" id="txtTenantPrmntStreetName" class="form-control" placeholder="Road / Street Name" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label for="LandMark">
                                Landmark
                            </label>
                            <input name="" type="text" id="txtTenantPrmntStreetLandMark" class="form-control" placeholder="Landmark" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="Locality">
                                Locality
                            </label>
                            <input name="" type="text" id="txtTenantPrmntStreetLocality" class="form-control" placeholder="Locality" maxlength="100" autofocus="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">State</label>
                            <input id="txtTenantPrmntStateID" class="form-control" type="text" style="display: none" />
                            <select class="form-control" id="ddlTenantPrmntStateID">
                                <option value="0">-Select State-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <input id="txtTenantPrmntDistD" class="form-control" type="text" style="display: none" />
                            <select class="form-control" id="ddlTenantPrmntDistD">
                                <option value="0">-Select District-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Block/Taluka</label>
                            <input id="txtTenantPrmntBlockD" class="form-control" type="text" style="display: none" placeholder="" />
                            <select class="form-control" id="ddlTenantPrmntBlockD">
                                <option value="0">-Select Block-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Panchayat/Village/City</label>
                            <input id="txtTenantPrmntCityID" class="form-control" type="text" style="display: none" placeholder="" />
                            <select class="form-control" id="ddlTenantPrmntCityID">
                                <option value="0">-Select Village-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="PIN">Pin Code</label>
                            <input name="" type="text" id="txtTenantPrmntPinCode" class="form-control" placeholder="PinCode" maxlength="6" onkeypress="return onlyNumbers(event);" autofocus="" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Rent/House/Premises Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Period of Rent</label>
                            <div class="col-xs-6 pright0 pleft0">
                                <input id="ddlRentPeriodType" type="text" value="Month" class="form-control" placeholder="" disabled="disabled" />
                                <%--<select id="ddlRentPeriodType" class="form-control" disabled="disabled">
                                    <option value="1">Month</option>
                                </select>--%>
                            </div>
                            <div class="col-xs-6 pleft0 pright0">
                                <input id="txtPeriodOfRent" type="text" class="form-control" placeholder="Rent Period" onkeypress="return onlyNumbers(event);" />
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Rent Payable Date (p.m.)</label>
                            <input type="text" id="txtRentPayableDatePM" placeholder="Rent Payable Date (p.m)" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0">
                        <div class="form-group">
                            <label>Grace Date (p.m.)</label>
                            <input type="text" id="txtRentPayableGraceDatePM" placeholder="Rent Payable Grace Date(p.m)" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label>Maintenance Charges (p.m.)</label>
                            <input type="text" id="txtMaintenanceChargePM" placeholder="Maintenance Charges (Rs.)" maxlength="8" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label>Rent Amount (p.m.)</label>
                            <input type="text" id="txtRentChargePM" placeholder="Rent Charges (Rs.)"  maxlength="8" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Total Rent Amount (p.m.)</label>
                            <div class="col-xs-4 pleft0">
                                <input type="text" id="txtTotalRentAmntPM" placeholder="(in number)" class="form-control" />
                            </div>
                            <div class="col-xs-8 pright0">
                                <input type="text" id="txtTotalRentAmntInWordsPM" placeholder="(in words)" onkeypress="return ValidateAlpha(event); " class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop5"></div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Deed Place</label>
                            <input type="text" id="txtDeedPlace" placeholder="Deed Place" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Deed Date</label>
                            <input type="text" id="txtDeedDate" placeholder="Deed Date" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label>Paid Rental Deposit/Security?</label>
                            <select class="form-control" id="txtIsSecurityAmntPaid">
                                <option value="0">Select</option>
                                <option value="1">Security Amount</option>
                                <option value="2">Rental Deposit</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 lbldeposit">
                        <div class="form-group">
                            <label>Period</label>
                            <input type="text" id="txtSecurityAmntPeriod" placeholder="(In Month)" class="form-control" onkeypress="return onlyNumbers(event);" />


                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-5 pright0">
                        <div class="form-group">
                            <label class="manadatory" id="lblSecurityAmnt">Total Amount (Rental Deposit/Security Deposit)</label>
                            <div class="col-xs-4 pleft0">
                                <input type="text" id="txtSecurityAmnt" placeholder="Advance Rent (in number)" onchange="convertNumToWord()" class="form-control" />
                            </div>
                            <div class="col-xs-8">
                                <input type="text" id="txtSecurityAmntInWords" placeholder="Advance Rent (in words)" onkeypress="return ValidateAlpha(event); " class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">House Property Includes</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-6 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Premises Type</label>
                            <select id="ddlPremisesTypeID" class="form-control">
                                <option value="0">Select Premises Type</option>
                                <option value="1">Unfurnished</option>
                                <option value="2">Semi Furnished</option>
                                <option value="3">Full Furnished</option>
                            </select>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                        <div class="form-group error" id="divmore" runat="server" style="display: none;">
                        </div>
                        <div id="divSuspect">
                        </div>
                        <div class="form-group">
                            <table id="tblItem" style="width: 100%" class="table table-striped table-bordered">
                                <tbody>
                                    <tr>
                                        <th id="thtxtAccused" style="text-align: center;">
                                            <label class="manadatory" for="txtAccused">
                                                Item Name</label>
                                        </th>
                                        <th id="thtxtAddress" style="text-align: center;">
                                            <label class="manadatory" for="txtAddress">
                                                No of Qty.</label>
                                        </th>
                                        <th id="thadd" style="text-align: center; width: 100px;">Add</th>
                                    </tr>
                                    <tr>
                                        <td style="width:49%;">
                                            <input id="txtItem" class="form-control" placeholder=" Name of Item" name="txtItem" type="text" value="" onkeypress="return ValidateAlpha(event);"
                                                autofocus />
                                        </td>
                                        <td style=" width:40%;">
                                            <input id="txtQty" class="form-control" placeholder="No. of Qty." name="txtQty" type="text" value="" onkeypress="return onlyNumbers(event);"
                                                autofocus />
                                        </td>
                                        <td align="center">
                                            <input id="btnAdd" type="button" value="Add" onclick="AddSuspect('');" class="btn btn-success" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Payment Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0">
                        <div class="form-group">
                            <label class="manadatory">Payment For</label>
                            <input id="txtPaymentRent" class="form-control" value="Rent" disabled="disabled" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pright0">
                        <div class="form-group">
                            <label class="manadatory">Mode of Payment</label>
                            <select class="form-control" id="ddlRentPayMode">
                                <option value="0">Select Payment Mode</option>
                                <option value="1">Cheque</option>
                                <option value="2">Cash</option>
                                <option value="3">Demand Draft</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Bank Name</label>
                            <input type="text" id="txtRentPayBank" placeholder="Bank Name" class="form-control" onkeypress="return ValidateAlpha(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label>Branch</label>
                            <input type="text" id="txtRentPayBranch" placeholder="Branch" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0 pleft0">
                        <div class="form-group">
                            <label class="manadatory">Cheq./DD Number</label>
                            <input type="text" id="txtRentPayDDNo" placeholder="Cheq./DD Number"    maxlength="15" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0">
                        <div class="form-group">
                            <label class="manadatory">Cheq./DD Date</label>
                            <input type="text" id="txtRentPayDDDate" placeholder="Date" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Amount</label>
                            <div class="col-xs-4 pleft0">
                                <input type="text" id="txtRentPayAmnt" placeholder="(in number)" class="form-control" />

                            </div>
                            <div class="col-xs-8">
                                <input type="text" id="txtRentPayAmntWords" placeholder="(in words)" class="form-control" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0 seqrityhide">
                        <div class="form-group">
                            <label class="manadatory">Payment For</label>
                            <input id="txtPaymentSecurity" class="form-control" value="Security" disabled="disabled" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pright0 seqrityhide">
                        <div class="form-group">
                            <label class="manadatory">Mode of Payment</label>
                            <select class="form-control" id="ddlSecurityPayMode">
                                <option value="0">Select Payment Mode</option>
                                <option value="1">Cheque</option>
                                <option value="2">Cash</option>
                                <option value="3">Demand Draft</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 seqrityhide">
                        <div class="form-group">
                            <label class="manadatory">Bank Name</label>
                            <input type="text" id="txtSecurityPayBank" placeholder="Bank Name" class="form-control" onkeypress="return ValidateAlpha(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 seqrityhide">
                        <div class="form-group">
                            <label>Branch</label>
                            <input type="text" id="txtSecurityPayBranch" placeholder="Branch" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0 pleft0 seqrityhide">
                        <div class="form-group">
                            <label class="manadatory">Cheq./DD Number</label>
                            <input type="text" id="txtSecurityPayDDNo"  placeholder="Cheq./DD Number" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0 seqrityhide">
                        <div class="form-group">
                            <label class="manadatory">Cheq./DD Date</label>
                            <input type="text" id="txtSecurityPayDDDate" placeholder="Date" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3 seqrityhide">
                        <div class="form-group">
                            <label class="manadatory">Amount</label>
                            <div class="col-xs-4 pleft0">
                                <input type="text" id="txtSecurityPayAmnt" placeholder="(in number)" class="form-control" />

                            </div>
                            <div class="col-xs-8">
                                <input type="text" id="txtSecurityPayAmntWords" placeholder="(in words)" class="form-control" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Witness Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Witness1 Name</label>
                            <input type="text" id="txtWitness1Name" placeholder="Witness1 Full Name" maxlength="100" onkeypress="return ValidateAlpha(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Witness1 Address</label>
                            <input type="text" id="txtWitness1Address" placeholder="Witness1 Full Address" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Witness2 Name</label>
                            <input type="text" id="txtWitness2Name" placeholder="Witness2 Full Name" maxlength="100" onkeypress="return ValidateAlpha(event); " class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Witness2 Address</label>
                            <input type="text" id="txtWitness2Address" placeholder="Witness2 Full Address" maxlength="100" class="form-control" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData(this);" />
                    <input type="submit" id="btnCancel" value="Cancel" class="btn btn-danger" />
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div id="confirm" class="modal hide fade">
        <div class="modal-body">
            Are you sure?
        </div>
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Yes</button>
            <button type="button" data-dismiss="modal" class="btn">No</button>
        </div>
    </div>
    <input type="hidden" id="hidPremises" value="0" />
    <input type="hidden" id='hdfSuspect' />
    <input type="hidden" id='hdfSuspectSave' />
    <input type="hidden" id='hdfSuspectString' />
    <input type="hidden" id='HFServiceID' />
    <input type="hidden" id="HFUIDData" />
</asp:Content>
