<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="LicenseForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.Forest.Sawmill.LicenseForm" %>
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
    <script src="/WebAppUK/Forest/SawMill/SawMill.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

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
    <div id="costumModal2" class="modal" data-easein="flipXIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center ">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h2 class="box-heading">Instruction</h2>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12 instruction_txt">
                        <span style="font-weight: bold;">HOW TO FILL THE FORM:</span>
                        <ol>
                            <li>Read the Prospectus 2018-19 carefully and follow the instructions therein while filling the application form. The candidate can have access to the Application Form by visiting the website  <a href="https://www.sambalpur.lokaseba-odisha.in" target="_blank">https://www.sambalpur.lokaseba-odisha.in</a> and clicking on a link <b>“Submission of Online Application Form For Admission into SAMBALPUR UNIVERSITY P.G. Courses, 2018-19”.</b></li>
                            <li>The candidate has to enter the correct mobile number and validate it through OTP generated in the mobile number. Mobile number validation is important because all communication regarding admission will be sent as SMS to the valid mobile number entered by the candidate. The candidate should not change the mobile number till the end of Admission process.</li>
                            <li>The candidates are advised to be careful while filling in the online Application Form. He/She must enter correct  Mobile Number which is in use &amp; valid e-Mail ID. </li>
                            <li>Please fill all the remaining details mentioned in the online application form, otherwise the application will not be accepted.</li>
                            <li>Full signature (file size 10 –20KB) and recent passport size color photograph (file size 20–50KB) both scanned in the “jpg/jpeg” format should be uploaded. Photograph and full signature scanned for uploading must be clearly identifiable /visible, otherwise the application will not be considered. No correspondence after submission of application form on this account shall be entertained. All the documents should be scanned in <b>72 dpi resolution.</b></li>
                            <li>Fill in the Present Address for correspondence.</li>
                            <li>You must click on self-declaration. By clicking this, you are accepting that all the information entered are true and you will be responsible for any false or misleading information.</li>
                            <li>After that, please click on <b>‘’submit’’</b> button at the bottom. You will receive a login ID, password and an Application number on your mobile and e-mail ID.</li>
                            <li>Then the system will instruct you to upload the necessary document.  </li>
                            <li>After that the system will redirect you to the application fee payment page through online payment gateway to make the payment.</li>
                            <li>Don’t share the login ID and password with others as it may be misused by others to tamper your data for which the University will not be responsible.</li>
                        </ol>
                    </div>
                    <div class="col-lg-12 text-center ptop10">
                        <p style="font-size: 1.5em; font-weight: bold;">
                            <label class="mychckbx">
                                <input type="checkbox" />
                                <span class="checkmark"></span>
                            </label>
                            I have read all the terms & conditions
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary">PROCEED</button>
                </div>
            </div>
        </div>
    </div>
 
        <div class="container-fluid ptop15">
            <div class="col-lg-12">
                <h3 class="form-heading">
                    <i class="fa fa-pencil-square-o fa-fw"></i>ISSUE/RENEW LICENSE FORM <span class="pull-right "><a href="#costumModal2" class="readinst" data-toggle="modal"><i class="fa fa-info-circle fa-fw"></i>Read Instructions</a></span>
                </h3>
            </div>
            <br />
            <br />
            <div class="clearfix"></div>
                <div class="box-body box-body-open">
                            <div class="form-group">
            <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />
                                </div>
                    </div>
                   
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 p0">
                <div class="col-lg-12 box-container mtop10">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Industry Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Type of Renewal</label>
                                <select class="form-control" id="ddlRenewalType">
                                    <option value="0">-Select-</option>
                                    <option value="Issue">Issue</option>
                                    <option value="Renew">Renew</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Type of Industry</label>
                                <select class="form-control" id="ddlIndustryType">
                                    <option value="0">-Select-</option>
                                    <option value="Proprietor">Proprietor</option>
                                    <option value="Company">Company</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Name of the Industry</label>
                                <input type="text" id="txtIndustryName" class="form-control" placeholder="Name of the Industry" maxlength="40" onkeypress="ForName(event)" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Date of Application</label>
                                <input type="text" id="txtAppDate" class="form-control" placeholder="DD/MM/YYYY" onkeypress="return false" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Industry TAN/PAN No. </label>
                                <input type="text" id="txtTanPanNo" class="form-control" maxlength="15" placeholder="Industry TAN/PAN No." />
                            </div>
                        </div>
                      <%--  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" > GPS Location </label> <span style="display:none" class="pull-right">
                                    <a href="#" style="text-decoration: underline; color: #D40000;" onclick="showPosition();">
                                        <i  class="fa fa-globe fa-fw"></i>Get Location</a></span>
                                <div class="col-lg-6 pleft0">
                                    <input type="text" id="txtGPSLocLong" maxlength="2" class="form-control" placeholder="Degree" onkeypress="ForNumber(event);"/>
                                </div>
                                <div class="col-lg-6 pright0">
                                    <input type="text" id="txtGPSLocLati" maxlength="2" class="form-control" placeholder="Minute" onkeypress="ForNumber(event);"/>
                                </div>
                                  <div class="col-lg-6 pright0">
                                    <input type="text" id="txtSecond" maxlength="2" class="form-control" placeholder="Second" onkeypress="ForNumber(event);"/>
                                </div>
                            </div>
                        </div>--%>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Proprietor/Managing Director Name</label>
                                <input type="text" id="txtIPropMDName" class="form-control" placeholder="Proprietor/Managing Director Name" onkeypress=" return ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Prop./MD Aadhaar No</label>
                                <input type="text" id="txtIPropMDUIDNo" class="form-control" maxlength="12" placeholder="Prop./MD Aadhaar No" onkeypress="return isNumber(event, this);" onchange="AadhaarValidation(this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Establishment Date</label>
                                <input type="text" id="txtEstDate" class="form-control" placeholder="DD/MM/YYYY" onkeypress="return false"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Registration No</label>
                                <input type="text" id="txtIndusRegNo" class="form-control" placeholder="Registration No" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Address</label>
                                <input type="text" id="txtIndusAddress" class="form-control" placeholder="Enter Address" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Pincode</label>
                                <input type="text" id="txtIndusAddressPin" class="form-control" placeholder="Enter Pincode" maxlength="6" onkeypress="return isNumber(event, this);" onchange="PinCodeValidation(this);"  />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Industry Landline No</label>
                                <input type="text" id="txtIndusLandlineNo" class="form-control" maxlength="12" placeholder="" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Whether Notified Industrial Area</label>
                                <select id="ddlNotIndusArea" class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Whether Municipal Area</label>
                                <select id="ddlMunicipalArea" class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Prop./MD Mobile No</label>
                                <input type="text" id="txtMDMobileNo" class="form-control" placeholder="Enter Mobile No" onchange="MobileValidation(txtMDMobileNo);" onkeypress="return isNumber(event, this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Prop./MD Email ID</label>
                                <input type="text" id="txtMDEMailID" class="form-control" placeholder="Prop./MD Email ID" onchange="ValiateEmail();"  />
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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Latitute</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtGPSLocLong" type="text"  class="form-control" maxlength="2" placeholder="Degree" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4">
                                <input id="txtGPSLocLati" type="text" class="form-control" maxlength="2" placeholder="Minute" onkeypress="return isNumberKey(event);" />
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor1LatdSecond" type="text" class="form-control"  maxlength="2" placeholder="Second" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory">Longitude</label>
                            <div class="col-lg-4 pleft0">
                                <input id="txtCornor1LongDegree" type="text" class="form-control"  maxlength="2" placeholder="Degree" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4">
                                <input id="txtCornor1LongMinute" type="text" class="form-control"  maxlength="2" placeholder="Minute" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-lg-4 pright0">
                                <input id="txtCornor1LongSecond" type="text" class="form-control"  maxlength="2" placeholder="Second" onkeypress="return isNumberKey(event);"/>
                            </div>
                        </div>
                    </div>
                      

                          
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 pright0">
                <div id="divPhoto" class="col-md-12 box-container mtop10">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Prop./MD Photograph</h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 200px" id="myImg" />
                            <input class="camera" id="File1" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <div id="divSign" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Prop./MD  Signature</h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 142px" id="mySign" />
                            <input class="camera" id="File2" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container mtop10">
                <div class="box-heading">
                    <h4 class="box-title manadatory">Raw Material Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Type of Wood</label>
                            <select class="form-control" id="ddlWoodType">
                                <option value="0">-Select-</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Species of Wood used</label>
                            <input type="text" id="txtSpeciesWood" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Type of wood used</label>
                            <input type="text" id="txtWoodUsed" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Source of Wood</label>
                            <input type="text" id="txtWoodSource" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Installed Capacity</label>
                            <input type="text" id="txtInstallCap" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Equipments Used</label>
                            <input type="text" id="txtIEqupUsed" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Power Consumption</label>
                            <input type="text" id="txtPowerConsump" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Type of Saw Used</label>
                            <input type="text" id="txtSawUsedType" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Dimension of Saw</label>
                            <input type="text" id="txtSawDimension" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Products Manuf.</label>
                            <input type="text" id="txtProdManuf" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Averg./Est. Wood Consumption(p.a.)</label>
                            <input type="text" id="txtAnnualConsump" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container mtop10">
                <div class="box-heading">
                    <h4 class="box-title manadatory">Industry Bank Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Bank Name</label>
                            <input type="text" id="txtIndusBankName" class="form-control" placeholder="Bank Name" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Account Number</label>
                            <input type="text" id="txtIndusACNo" class="form-control" placeholder="Account Number" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">IFS Code</label>
                            <input type="text" id="txtIndusIFSCCode" class="form-control" placeholder="Bank IFSC Code" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Place</label>
                            <input type="text" id="txtIndusBankPlace" class="form-control" placeholder="Place" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container mtop10">
                <div class="box-heading">
                    <h4 class="box-title manadatory">
                        <span id="BA">Whether Access and Benefit sharing agreement done with producer /State Biodiversity Board?
                        </span>
                        <span class="pull-right" style="font-size: 14px;">
                            <input type="radio" name="BoardAgreement" value="Yes" />Yes
                            <input type="radio" name="BoardAgreement" value="No" class="ml5" />No
                        </span>
                    </h4>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container mtop10">
                <div class="box-heading">
                    <h4 class="box-title manadatory">
                        <span id="CA">Whether Consent to Establish & Constent to Operate granted by Uttarakhand State Pollution Control Board?
                        </span>
                        <span class="pull-right" style="font-size: 14px;">
                            <input type="radio" name="ConcentEstablish" value="Yes" />Yes
                            <input type="radio" name="ConcentEstablish" value="No" class="ml5" />No
                        </span>
                    </h4>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container mtop10" style="display: none">
                <div class="box-heading">
                    <h4 class="box-title manadatory">
                        <input type="checkbox" name="chckDeclaration" />Declaration</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-lg-12">
                        <label>
                            I <span id="propmdName">__________ </span>Proprietor/Managing Director of <span id="industryName">___________</span>,
                            Situated at <span id="industryPlaceName">__________ </span>declare that the aforesaid details are true to
                            my knowledge and no information has been concealed from being disclosd.</label>
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
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center mb20">
                <input type="button" id="btnSubmit2" class="btn btn-primary" value="SUBMIT" onclick="SubmitData();" />
                <input type="button" id="btClear" class="btn btn-danger" value="RESET" onclick="Reset();" />
            </div>
        </div>
    </div>
    <script src="/WebAppUK/DashboardV3/js/velocity.min.js"> </script>
    <script src="/WebAppUK/DashboardV3/js/velocity.ui.min.js"></script>
    <script src="/WebAppUK/DashboardV3/js/modaleffect.js"></script>
    <asp:HiddenField ID="HDNFNM" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
</asp:Content>