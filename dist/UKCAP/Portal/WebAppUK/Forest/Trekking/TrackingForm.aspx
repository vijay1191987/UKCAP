<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="TrackingForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.Forest.Trekking.TrackingForm" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>

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
    <script src="/WebAppUK/Forest/Trekking/ForestScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    
    <style type="text/css">
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .box-container > .box-heading {
            padding: 12px 8px;
        }

        .btn-outline-primary {
            display: inline;
            color: #007bff;
            background-color: transparent;
            background-image: none;
            border: 1px solid #007bff;
            min-width: 120px;
            padding: 6px 12px;
        }

            .btn-outline-primary:hover {
                color: #fff;
                background-color: #007bff;
                text-decoration: none;
            }

        .btn-outline-danger {
            display: inline;
            color: #dc3545;
            background-color: transparent;
            background-image: none;
            border: 1px solid #dc3545;
            min-width: 120px;
            padding: 6px 12px;
            margin-left: 10px;
        }

            .btn-outline-danger:hover {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
                text-decoration: none;
            }

        #g207 {
            position: fixed !important;
            position: absolute;
            top: 0;
            top: expression ((t=document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop)+"px");
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #fff;
            opacity: 0.9;
            filter: alpha(opacity=90);
            display: block
        }

            #g207 p {
                opacity: 1;
                filter: none;
                font: bold 24px Verdana,Arial,sans-serif;
                text-align: center;
                margin: 20% 0
            }

                #g207 p a, #g207 p i {
                    font-size: 12px
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="g207" style="display: none; z-index: 1000;">
        <p>
            Please wait...<br>
            <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br>
            while submitting form...
        </p>
    </div>
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-lg-12 p0">
                <h2 class="form-heading" style="width: 98%; margin: 15px auto;">
                    <i class="fa fa-pencil-square-o fa-fw"></i>TREKKING APPLICATION FORM
                </h2>
            </div>
            <div class="col-lg-12">
                <div class="alert alert-info"><b>Note:</b>&nbsp; &nbsp; Fee for Indian -  Rs.150 &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; Fee for Other - Rs.600  </div>
            </div>

            <div class="clearfix"></div>
            <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />

            <div class="clearfix"></div>
            <div class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title manadatory">Booking Details</h4>
                </div>
                <div class="box-body box-body-open">

                    
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="display:none">
                            <div class="form-group">
                                <label class="manadatory">Circle Name</label>
                                <select class="form-control" id="ddlCircle" onchange="GetDivisionList2();">
                                    <option value="0">-Select-</option>
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="display:none">
                            <div class="form-group">
                                <label class="manadatory">Division Name</label>
                                <select class="form-control" id="ddlDivision2" onchange="GetRangeList();">
                                    <option value="0">-Select-</option>
                                      
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="display:none">
                            <div class="form-group">
                                <label class="manadatory">Range</label>
                                <select class="form-control" id="ddlRange" >
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>

                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Division</label>
                            <select class="form-control" id="ddlDivision" onchange="GetSubDivisionList();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Area</label>
                            <select class="form-control" id="ddlArea" onchange="getTrakkingDays();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">From Date</label>
                            <input type="text" class="form-control" placeholder="DD/MM/YYYY" id="txtFromDate" maxlength="10" onkeypress="return false" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">To Date</label>
                            <input type="text" class="form-control" placeholder="DD/MM/YYYY" id="txtToDate" maxlength="10" onkeypress="return false" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Tour Operator</label>
                            <select class="form-control" id="ddlTourOperator" onchange="GettourDetails()" >
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                  
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Manager Name</label>
                            <input type="text" class="form-control"  id="txtTourName" readonly="true" />
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Mobile</label>
                            <input type="text" class="form-control"  id="txtTourMobileNo" readonly="true" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title manadatory">Trekkers Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Name</label>
                            <input type="text" id="txtFullName" class="form-control" maxlength="40" placeholder="Tracker Name" onkeypress=" return ForName(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Father/Husband Name</label>
                            <input type="text" id="txtFatherSpouseName" class="form-control" maxlength="40" placeholder="Father/Husband Name" onkeypress=" return ForName(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Gender</label>
                            <select class="form-control" id="ddlGender">
                                <option value="0">-Select-</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Transgender">Transgender</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">D.O.B</label>
                            <input type="text" class="form-control" placeholder="DD/MM/YYYY" id="DateOfBirth" maxlength="10" onkeypress="return false" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Mobile No.</label>
                            <input type="text" id="txtMobileNo" class="form-control" placeholder="Mobile No" maxlength="10" onchange="MobileValidation(txtMobileNo);" onkeypress="return isNumber(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Emergency No.</label>
                            <input type="text" id="txtEmergencyNo" class="form-control" placeholder="Emergency No" maxlength="10" onchange="MobileValidation(txtEmergencyNo);" onkeypress="return isNumber(event);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Email ID</label>
                            <input type="text" id="txtEmailID" class="form-control" placeholder="Email ID" onchange="EmailValidation();" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <div class="col-xs-4 pleft0">
                                <label>Year</label>
                                <input id="txtYear" class="form-control mtop0" placeholder="Year" maxlength="3" readonly="readonly" />
                            </div>
                            <div class="col-xs-4">
                                <label>Month</label>
                                <input id="txtMonth" class="form-control mtop0" placeholder="Month" maxlength="3" readonly="readonly" />
                            </div>
                            <div class="col-xs-4 pright0">
                                <label>Day</label>
                                <input id="txtDay" class="form-control mtop0" placeholder="Day" maxlength="3" readonly="readonly" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Nationality</label>
                            <select class="form-control" id="ddlNationality">
                                <option value="0">-Select-</option>
                                <option value="Indian">Indian</option>
                                <option value="Others">Others</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Select ID Proof Type</label>
                            <select class="form-control" id="ddlIDProofType">
                                <option value="0">-Select-</option>
                                <option value="AadhaarCard">Aadhaar Card</option>
                                <option value="VoterCard">Voter ID Card</option>
                                <option value="Passport">Passport</option>
                                <option value="DrivingLicence">Driving Licence</option>
                                <option value="GovernmentID">Government ID</option>
                                <option value="CountryID">Country ID</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Valid ID Proof (Detail)</label>
                            <input type="text" id="ddlIDProofDetail" maxlength="16" class="form-control" placeholder="Valid ID Proof Detail" onkeypress="return AlphaNumericIdentity(event);"   />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>Trekking Fee</label>
                            <input type="text" id="txtTrackingFee" class="form-control" disabled="disabled" placeholder="Tracking Fee" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop20"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                        <input type="button" class="btn btn-success" value="Save" style="display: none;" />
                        <input type="button" class="btn btn-primary" value="Add" onclick="AddTrackerDetail('');" />
                        <input type="button" class="btn btn-danger" value="Clear" onclick="ClearTrackerDetail();" />
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div id="divTrackerDetail" runat="server" style="display: none;">
                <div class="col-md-12 box-container mtop10">
                    <div class="box-heading">
                        <h4 class="box-title">Added Trackers Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                            <div class="table table-bordered" id="divmore" runat="server" style="display: none; width: 100%;"></div>
                                </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-12 col-lg-12 box-container mtop10">
                    <div class="box-heading">
                        <h4 class="box-title manadatory" id="lblDeclaration">
                            <input type="checkbox" id="chkDeclaration" runat="server" onclick="javascript: Declaration(this.checked);" />Declaration
                        </h4>
                    </div>
                    <div class="box-body box-body-open" id="divDeclaration">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="text-danger text-danger-green mt0">
                                <p class="text-justify">
                                    I, <b><span id="lblUName" style="text-transform: uppercase; color: black; font-weight: bolder;"></span></b>
                                    hereby affirm that the above mentioned information submitted by me is true and correct to my knowledge and belief. I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date.
                                </p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-12 box-container">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <input type="button" class="btn btn-lg btn-primary" value="Submit" id="btnSubmit2" onclick="SubmitData();" />
                          <input type="button" class="btn btn-lg btn-danger" value="Reset" onclick="Reset();" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdfTracker" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdfTrackerSave" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdfTrackerString" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HDNFNM" runat="server" ClientIDMode="Static" />
</asp:Content>
