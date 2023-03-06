<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="LostFoundRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.LostAndFound.LostFoundRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <link href="/WebAppUK/css/style.admin.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="moment.min.js"></script>
    <link href="bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="bootstrap-datetimepicker.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <link type="text/css" href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/LostAndFound/LostAndFound.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <style>
        .secondaryTable th {
            padding: 19px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: 1px solid #ddd;
            background: #6D84A3 !important;
            color: #fff;
            font-weight: normal;
        }
        .register-num {
    padding: 8px 0;
    margin-top: 5px;
}
        .secondaryTable > tbody > tr > td {
            border: 1px solid #ddd;
        }

        .categyhd {
            background-color: #517395 !important;
            color: #fff;
            font-size: 15px;
        }

        .mtop15 {
            margin-top: 15px !important;
        }

        .mtop20 {
            margin-top: 20px !important;
        }

        .box-container > .box-heading{padding:12px 8px;}

        /*.form-heading {
            color: #820000 !important;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px !important;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            font-weight: bold;
            font-size: x-large !important;
        }*/

        /*Radio box*/
        input[type="radio"] {
            position: absolute;
            right: 9000px;
        }

            input[type="radio"] + .label-text:before {
                content: "\f10c";
                font-family: "FontAwesome";
                speak: none;
                font-style: normal;
                font-weight: normal;
                font-variant: normal;
                text-transform: none;
                line-height: 1;
                -webkit-font-smoothing: antialiased;
                width: 1em;
                display: inline-block;
                margin-right: 5px;
            }

            input[type="radio"]:checked + .label-text:before {
                content: "\f192";
                color: #2980b9;
                animation: effect 250ms ease-in;
            }

            input[type="radio"]:disabled + .label-text {
                color: #aaa;
            }

                input[type="radio"]:disabled + .label-text:before {
                    content: "\f111";
                    color: #ccc;
                }

        @keyframes effect {
            0% {
                transform: scale(0);
            }

            25% {
                transform: scale(1.3);
            }

            75% {
                transform: scale(1.4);
            }

            100% {
                transform: scale(1);
            }
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
    <div class="row">
        
                <div class="col-lg-12">
                     <h2 class="form-heading" style="width: 98%; margin: 15px auto;">
                        <i class="fa fa-pencil-square-o fa-fw"></i>Lost & Found Registration
                    </h2>
                </div>
        <div class="col-lg-12">
                <div class="col-md-12 box-container mtop15">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Choose Registration Type
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 ptop10 pbtm10">
                            <div class="form-group form-check">
                                <label>
                                    <input type="radio" name="RegisterType" value="LostItem" onclick="LostFound();" style="vertical-align: top;" />
                                    <span class="label-text" style="font-size: 14px;">Register for Lost Item</span></label>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 ptop10 pbtm10">
                            <div class="form-group form-check">
                                <label>
                                    <input type="radio" name="RegisterType" value="FoundItem" onclick="LostFound();" style="vertical-align: top;" />
                                    <span class="label-text" style="font-size: 14px;">Register for Found Item</span></label>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
           
                <div id="AllDetails">
                    <div class="col-md-12 box-container mtop5">
                        <div class="box-heading ">
                            <h4 class="box-title manadatory">Applicant Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Applicant Full Name</label>
                                    <input type="text" id="txtFullName" class="form-control" placeholder="Full Name" name="FirstName" maxlength="100" onkeypress="return ValidateAlpha(event);"/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Mobile No</label>
                                    <input type="text" id="txtMobileNo" class="form-control" placeholder="Mobile No" name="MobileNo" maxlength="10" onkeypress="return isNumberKey(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Email ID</label>
                                    <input type="text" id="txtEmailId" class="form-control" placeholder="Email ID" name="EmailID" maxlength="100" onchange="ValiateEmail();"/>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="divAddress">
                        <div class="col-md-12 box-container mtop10">
                            <div class="box-heading">
                                <h4 class="box-title">Applicant Address</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory">Address Line-1 (Care of)</label>
                                            <input name="AddressLine1" type="text" id="txtAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onkeypress="return AlphaNumeric(event, this);"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label for="AddressLine2">Address Line-2 (Building)</label>
                                            <input name="AddressLine2" type="text" id="txtAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onkeypress="return AlphaNumeric(event, this);"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory">Road/Street Name</label>
                                            <input name="RoadStreetName" type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onkeypress="return AlphaNumeric(event, this);"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label for="LandMark">Landmark</label>
                                            <input name="LandMark" type="text" id="txtLandMark" class="form-control" placeholder="Landmark" maxlength="40" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory">Locality</label>
                                            <input name="Locality" type="text" id="txtLocality" class="form-control" placeholder="Locality" maxlength="40" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory">State</label>
                                            <select class="form-control" id="ddlState" onchange="GetDistrict();">
                                                <option value="0">--Select--</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory">District</label>
                                            <select class="form-control" id="ddlDistrict" onchange="GetBlock();">
                                                <option value="0">--Select--</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label>Block/Taluka</label>
                                            <select class="form-control" id="ddlTaluka" onchange="GetPanchayat();">
                                                <option value="0">--Select--</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory text-nowrap">Panchayat/Village/City</label>
                                            <select class="form-control" id="ddlVillage">
                                                <option value="0">--Select--</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory">Pin Code</label>
                                            <input name="PinCode" type="text" id="txtPinCode" class="form-control" placeholder="PIN" maxlength="6" onchange="checkpincode();" onkeypress="return isNumber(event, this);"  />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12 box-container mtop15">
                        <div class="box-heading ">
                            <h4 class="box-title manadatory">Details of Lost/Found Items</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pleft0 pright0">
                                <%-- Added Table List for Items START Here--%>
                                <div class="table table-bordered" id="divmore" runat="server" style="display: none; width: 100%;"></div>
                                <div class="table table-bordered" id="divError" runat="server" style="display: none"></div>
                                <br />
                                <%-- Added Table List for Items END Here--%>

                                <%-- Common Table for Items START Here--%>
                                <table class="table table-bordered" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%;"><span class="manadatory">Items</span></th>
                                            <th>Manufacture</th>
                                            <th>Model</th>
                                            <th><span class="manadatory">Serial No. / IMEI No. / Chasis No.</span></th>
                                            <th>Lost / Found Date</th>
                                            <th>Lost / Found Place</th>
                                            <th><span class="manadatory">Item Description</span></th>
                                            <th><span class="manadatory">VehicleNo</span></th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <select class="form-control" id="ddlItemType">
                                                    <option value="0">--Select--</option>
                                                    <option value="Vehicle">Vehicle</option>
                                                    <option value="Mobile">Mobile</option>
                                                    <option value="Laptop">Laptop</option>
                                                    <option value="Others">Others</option>
                                                </select></td>
                                            <td>
                                                <input type="text" id="txtManufacture" required="required" class="form-control" placeholder="Manufacture By" /></td>
                                            <td>
                                                <input type="text" id="txtModel" class="form-control" placeholder="Model Name" /></td>
                                            <td>
                                                <input type="text" id="txtUniqueNo" class="form-control" placeholder="Enter No" /></td>
                                            <td>
                                                <input type="text" id="txtLostFoundDate" class="form-control" placeholder="Lost / Found Date" /></td>
                                            <td>
                                                <input type="text" id="txtLostFoundPlace" class="form-control" placeholder="Lost / Found Place" /></td>
                                            <td>
                                                <input type="text" id="txtItemDescription" class="form-control" placeholder="Item Description" /></td>
                                            <td>
                                                <input type="text" id="txtVehicleNo" class="form-control" placeholder="Vehicle No" /></td>
                                            <td>
                                                <input type="button" id="btnAddMore" class="btn btn-primary" value="ADD" onclick="AddLostFoundItem('');" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <%-- Common Table for Items End Here--%>
                                <br />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12 box-container mtop10">
                        <div class="box-heading">
                            <h4 class="box-title manadatory" id="lblDeclaration">
                                <input type="checkbox" id="chkDeclaration" runat="server" onclick="javascript: Declaration(this.checked);" />Declaration
                            </h4>
                        </div>
                        <div class="box-body box-body-open" id="divDeclaration">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="text-danger text-danger-green mt0">
                                    <p class="text-justify">
                                        I, <b><span id="lblName" style="text-transform: uppercase;"></span></b>
                                        hereby affirm that the information given by me in the application is complete and true to the best of my knowledge and belief and that I have made the application with the consent and approval of my parents/guardian.
                                    </p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12 box-container" style="margin-top: 5px;">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Submit & Upload Document" title="Proceed to Upload Necessary Document" onclick="SubmitData();">
                        </div>
                    </div>
                </div>
            </div>
    </div>
        </div>
    <asp:HiddenField ID="hdfLostFound" runat="server" />
    <asp:HiddenField ID="hdfLostFoundSave" runat="server" />
    <asp:HiddenField ID="hdfLostFoundString" runat="server" />
</asp:Content>