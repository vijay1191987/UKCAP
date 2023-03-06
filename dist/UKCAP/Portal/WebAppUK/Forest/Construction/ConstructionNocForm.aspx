<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="ConstructionNocForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.Forest.Construction.ConstructionNocForm" %>
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
    <script src="/WebAppUK/Forest/Construction/ConstructionNoc.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <style>
        .readinst {
            font-size: 13px;
            color: #89ffe9;
            font-weight: normal;
            font-family: Arial;
            text-transform: capitalize;
            padding-right: 10px;
        }

            .readinst:hover, .readinst:focus {
                color: #6bdfc9;
            }

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

        #AdditionalDtl label {
            display: inline !important;
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
            display: block;
        }

            #g207 p {
                opacity: 1;
                filter: none;
                font: bold 24px Verdana,Arial,sans-serif;
                text-align: center;
                margin: 20% 0;
            }

                #g207 p a, #g207 p i {
                    font-size: 12px;
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
                    <i class="fa fa-pencil-square-o fa-fw"></i>NOC APPLICATION FOR BUILDING NEAR RESERVE FOREST</h2>
            </div>
            <div class="clearfix"></div>
            <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />

            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pleft0">
                <div class="col-md-12 box-container mtop5">
                    <div class="box-heading ">
                        <h4 class="box-title">Construction Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Construction Purpose</label>
                                <select class="form-control" id="ddlConstPurpose">
                                    <option value="0">-Select-</option>
                                    <option value="Residential">Residential</option>
                                    <option value="Private">Private</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory">Applicant Name</label>
                                <input type="text" id="txtApplicantName" class="form-control" placeholder="Applicant Full Name" maxlength="40" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Email ID</label>
                                <input type="text" id="txtEmailID" class="form-control" placeholder="Email ID" maxlength="40" onchange="EmailValidation();" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Type of ID</label>
                                <select class="form-control" id="ddlIDProofType">
                                    <option value="0">-Select-</option>
                                    <option value="AadhaarCard">Aadhaar Card</option>
                                    <option value="Pancard">Pan No</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Identity No </label>
                                <input type="text" id="txtAadhaarNo" class="form-control" placeholder="Aadhaar/PAN No." onkeypress="return AlphaNumericIdentity(event);" maxlength="12"  />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Area (in hectare)</label>
                                <input type="text" id="txtAreaHrctre" class="form-control" placeholder="(in hectare)" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Mobile No.</label>
                                <input type="text" id="txtMobileNo" class="form-control" placeholder="Mobile No." maxlength="10" onchange="MobileValidation(txtMobileNo);" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Aerial Dist. from Notified Forest</label>
                                <input type="text" id="txtAerialDistance" class="form-control" placeholder="(in km)" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-12 box-container mtop5">
                    <div class="box-heading ">
                        <h4 class="box-title">Location of Land</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory">Location of Land</label>
                                <input type="text" class="form-control" id="txtLocationLand" placeholder="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">District Name</label>
                                <select class="form-control" id="ddlDistrict" onchange="GetTaluka();">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Tehsil/Taluk/Mandal Name</label>
                                <select class="form-control" id="ddlTaluka" onchange="GetVillage();">
                                    <option value="0">-Select-</option>
                                     
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Block Name</label>
                                <select class="form-control" id="ddlBlock">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>Thana/Chauki Name</label>
                                <input type="text" class="form-control" id="ddlThana" placeholder="" />

                                <%--<select class="form-control" id="ddlThana">
                                    <option value="0">-Select-</option>
                                    <option value="1">-Thana 1-</option>
                                </select>--%>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Gram Panchayat Name</label>
                                <select class="form-control" id="ddlGramPanchayat">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Village Name</label>
                                <select class="form-control" id="ddlVillage">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Circle Name</label>
                                <select class="form-control" id="ddlCircle" onchange="GetDivisionList();">
                                    <option value="0">-Select-</option>
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Division Name</label>
                                <select class="form-control" id="ddlDivision" onchange="GetRangeList();">
                                    <option value="0">-Select-</option>
                                      
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Range</label>
                                <select class="form-control" id="ddlRange" >
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                </div>

            </div>
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pleft0 pright0">
                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Applicant Photograph</h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 250px" id="myImg" />
                            <input class="camera" id="File1" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div id="divSign" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Applicant Signature</h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 155px" id="mySign" />
                            <input class="camera" id="File2" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title">Plot/Land Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Thane No./Name</label>
                            <input type="text" id="txtThaneNo" class="form-control" placeholder="Thane No./Name" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Khata/Khatauni No.</label>
                            <input type="text" id="txtKhata" class="form-control" placeholder="Khata/Khatauni No." />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Construction Site Address with khasra/khatauni</label>
                            <textarea id="txtFullConstDetail" rows="2" cols="4" class="form-control" style="resize: none;"></textarea>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Full Address with khasra/khatauni Detail</label>
                            <textarea id="txtFullAddressDetail" rows="2" cols="4" class="form-control" style="resize: none;"></textarea>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title">GPS Location of Four Corners of the Plot</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 1 (Latitute)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor1LatdDegree" type="text"  class="form-control" maxlength="2" placeholder="Degree" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor1LatdMinute" type="text" class="form-control" maxlength="2" placeholder="Minute" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor1LatdSecond" type="text" class="form-control" maxlength="2" placeholder="Second" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 1 (Longitude)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor1LongDegree" type="text" class="form-control" maxlength="2" placeholder="Degree" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor1LongMinute" type="text" class="form-control"  maxlength="2"  placeholder="Minute" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor1LongSecond" type="text" class="form-control" maxlength="2"  placeholder="Second" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop15"></div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 2 (Latitute)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor2LatdDegree" type="text" class="form-control" maxlength="2"  placeholder="Degree" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor2LatdMinute" type="text" class="form-control" maxlength="2"  placeholder="Minute" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor2LatdSecond" type="text" class="form-control" maxlength="2"  placeholder="Second" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 2 (Longitude)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor2LongDegree" type="text" class="form-control" maxlength="2"  placeholder="Degree" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor2LongMinute" type="text" class="form-control" maxlength="2"  placeholder="Minute" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor2LongSecond" type="text" class="form-control" maxlength="2"  placeholder="Second" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop15"></div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 3 (Latitute)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor3LatdDegree" type="text" class="form-control" maxlength="2"  placeholder="Degree" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor3LatdMinute" type="text" class="form-control" maxlength="2"  placeholder="Minute" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor3LatdSecond" type="text" class="form-control" maxlength="2"  placeholder="Second" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 3 (Longitude)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor3LongDegree" type="text" class="form-control"  maxlength="2" placeholder="Degree" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor3LongMinute" type="text" class="form-control"  maxlength="2" placeholder="Minute" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor3LongSecond" type="text" class="form-control" maxlength="2"  placeholder="Second" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop15"></div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 4 (Latitute)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor4LatdDegree" type="text" class="form-control"  maxlength="2" placeholder="Degree" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor4LatdMinute" type="text" class="form-control"  maxlength="2" placeholder="Minute" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor4LatdSecond" type="text" class="form-control"  maxlength="2" placeholder="Second" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 4 (Longitude)</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor4LongDegree" type="text" class="form-control"  maxlength="2" placeholder="Degree" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor4LongMinute" type="text" class="form-control"  maxlength="2" placeholder="Minute" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor4LongSecond" type="text" class="form-control"  maxlength="2" placeholder="Second" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container mtop5" style="display: none;">
                <div class="box-heading ">
                    <h4 class="box-title">GPS Location of Four Corners of the Plot</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 1</label>
                            <div class="col-lg-6 pleft0">
                                <input id="txtCornor1Latd" type="text" class="form-control" placeholder="N" onkeypress="ForDecimalNumber(event);" />
                            </div>
                            <div class="col-lg-6 pright0">
                                <input id="txtCornor1Long" type="text" class="form-control" placeholder="E" onkeypress="ForDecimalNumber(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 2</label>
                            <div class="col-lg-6 pleft0">
                                <input id="txtCornor2Latd" type="text" class="form-control" placeholder="N" onkeypress="ForDecimalNumber(event);" />
                            </div>
                            <div class="col-lg-6 pright0">
                                <input id="txtCornor2Long" type="text" class="form-control" placeholder="E" onkeypress="ForDecimalNumber(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop15"></div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 3</label>
                            <div class="col-lg-6 pleft0">
                                <input id="txtCornor3Latd" type="text" class="form-control" placeholder="N" onkeypress="ForDecimalNumber(event);" />
                            </div>
                            <div class="col-lg-6 pright0">
                                <input id="txtCornor3Long" type="text" class="form-control" placeholder="E" onkeypress="ForDecimalNumber(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Corner 4</label>
                            <div class="col-lg-6 pleft0">
                                <input id="txtCornor4Latd" type="text" class="form-control" placeholder="N" onkeypress="ForDecimalNumber(event);" />
                            </div>
                            <div class="col-lg-6 pright0">
                                <input id="txtCornor4Long" type="text" class="form-control" placeholder="E" onkeypress="ForDecimalNumber(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container mtop5" id="AdditionalDtl">
                <div class="box-heading ">
                    <h4 class="box-title">Additional details of Plot/Land</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="col-lg-12 othrinfohd">
                            <div class="col-md-9 pleft0">
                                <span class="fom-Numbx">1.</span> Whether the proposed site falls outside notified forest boundary or not? 
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="FallsOutside" id="FallsOutsideYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="FallsOutside" id="FallsOutsideNo" value="0" />
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
                                <span class="fom-Numbx">2.</span> Is there any National Park situated within a radius of 10 Km from the Site/Land?
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="HaveNationalPark" id="HaveNationalParkYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="HaveNationalPark" id="HaveNationalParkNo" value="0" />
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
                                <span class="fom-Numbx">3.</span>Is there any Wild Life Sanctuary situated within a radius of 10 Km from the Site/Land?
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="WLSSituated" id="WLSSituatedYes" value="1" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="WLSSituated" id="WLSSituatedNo" value="0" />
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
                                <span class="fom-Numbx">4.</span>Is the proposed project situated in any Eco Sensitive Zone? 
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="EcoSensitiveZone" id="EcoSensitiveYes" value="1"   />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="EcoSensitiveZone" id="EcoSensitiveNo"  value="0"   />
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
                                <span class="fom-Numbx">5.</span>Is there any other area within a radius of 10 Km from the Site/Land?
                            </div>
                            <div class="col-md-3 pleft0 pright0">
                                <div class="col-xs-6 pleft0">
                                    <input type="radio" name="OtherArea" id="OtherAreaYes" value="1" onclick="return fuShowHideDiv2('EcoSensitiveZoneInfo', 1);" />
                                    <label>Yes</label>
                                </div>
                                <div class="col-xs-6">
                                    <input type="radio" name="OtherArea" id="OtherAreaNo" value="0" onclick="return fuShowHideDiv2('EcoSensitiveZoneInfo', 0);" />
                                    <label>No</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        
                        <div id="EcoSensitiveZoneInfo" style="display: none;">
                            <div class="col-lg-12 othrinfosubhd2">
                                <div class="col-md-9 pleft0">
                                    <%--<p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Is ther any other area withhin a radious of 10km from the site/land?  </p>--%>
                                </div>
                                <div class="col-md-3 pleft0 pright0 pbottom5">
                                    <div class="form-group">
                            <select class="form-control" id="ddlTypesReserve">
                                <option value="0">-Select-</option>
                                <option value="Conservation Reserve">Conservation Reserve</option>
                                <option value="Community Reserve">Community Reserve</option>
                                <option value="Notified Bio-Diversity Area">Notified Bio-Diversity Area</option>
                            </select>
                        </div>
                                </div>
                            </div>
                            </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop10"></div>
                </div>
            </div>
            <%--<div class="col-md-12 col-lg-12 box-container mtop10">
                <div class="box-heading">
                    <h4 class="box-title manadatory register-num" id="lblDeclaration">
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
            </div>--%>
            <%---Start of Declaration----%>
            <div class="col-md-12 box-container mtop5">
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
                
                
                 </div>
            <%----End of Declaration-----%>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center mb20">
                <input type="button" id="btnSubmit2" class="btn btn-primary" value="SUBMIT" onclick="SubmitData();" />
                <input type="button" id="btClear" class="btn btn-danger" value="RESET" onclick="Reset();" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HDNFNM" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
</asp:Content>
