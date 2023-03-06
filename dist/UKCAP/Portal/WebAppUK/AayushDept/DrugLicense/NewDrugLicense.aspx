<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="NewDrugLicense.aspx.cs" Inherits="CitizenPortal.WebAppUK.AayushDept.DrugLicense.NewDrugLicense" %>

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
    <script src="/WebAppUK/aayushDept/DrugLicense/DrugLicense.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript">
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
    </script>

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
     <div ng-app="appmodule">
    <div id="g207" style="display: none; z-index: 1000;">
        <p>
            Please wait...<br>
            <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br>
            while submitting form...
        </p>
    </div>
    <div id="page-wrapper" ng-controller="ctrl"  style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Application for the grant of a licence to manufacture for sale of ayuredic/siddha or Unani drugs<small class="pull-right txt_white pright10">
                Language :
                    <input type="button" id="btnLang" runat="server" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" />
                    <i class="fa fa-hand-o-up"></i></small></h2>
            </div>
            <br />
            <div class="clearfix"></div>
            <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />

            <div class="clearfix"></div>
            <br />
            <div class="col-lg-9 p0">
          
                <div class="col-md-12 box-container pright0 mtop5">
                    <div class="box-heading ">
                        <h4 class="box-title manadatory">Applicant Firm Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" >
                            <div class="form-group">
                                <label class="manadatory">Licence Type</label>
                                <select class="form-control" id="ddlLicenseType" onchange="dispanel();">
                                    <option value="0">-Select-</option>
                                    <option value="1">New</option>
                                    <option value="2">Renewal</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Authority Name</label>
                                <input type="text" class="form-control" placeholder="Authority Name" id="txtFullName" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                          
                            <div class="form-group">
                                <label class="manadatory">Company/Firm Name </label>
                                <input type="text" class="form-control" placeholder="Company/Firm Name " id="txtFirmName" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Licence No</label>
                                <input type="text" class="form-control" placeholder="Licence No" id="txtLicenseNo" maxlength="20"    />
                            </div>
                        </div>
                     
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppGender}}</label>
                                <select class="form-control" id="ddlGender">
                                    <option value="0">-Select-</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblAppEmail}}</label>
                                <input type="text" class="form-control" placeholder="Email Id" maxlength="40" id="txtEmailID" onchange="EmailValidation();" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">{{resourcesData.lblMobileNo}}</label>
                                <input type="text" class="form-control" placeholder="10 Digit Mobile No" id="txtMobileNo" onchange="MobileValidation(txtMobileNo)" onkeypress="return isNumber(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>Office Phone no</label>
                                <input type="text" class="form-control" placeholder="Office Phone no" maxlength="10" id="txtOfficeNo" onkeypress="return isNumber(event);" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                 <div class="col-md-12 box-container mtop10 ">
                <div class="box-heading">
                    <h4 class="box-title">Company Address Detail <small class="pull-right" style="color: #fff;">Choose Address : &nbsp;
                        <input type="radio" value="PreAdd" id="PreAdd" name="Address" />Present &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="PerAdd" id="PerAdd" name="Address" />Permanent</small></h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblFullAddressApp}}</label>
                            <input type="text" id="txtFullAddress" maxlength="150" placeholder="First Line Address" class="form-control" onkeypress="return Alphanumericspecialchar(event);" />
                        </div>
                    </div>
                   
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblAppDistrict}}</label>
                            <select class="form-control" name="district" id="drpDistrictName" onchange="GetUKBlock();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblBlockTalukaSubDistrict}}</label>
                            <select class="form-control" name="taluka" id="drpSubDistrictName" onchange="GetUKPanchayat();">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblGramPanchayat}}</label>
                            <select class="form-control" name="panchayat" id="drpGramPanchayatName">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">{{resourcesData.lblPincode}}</label>
                            <input type="text" class="form-control" id="txtPincode" maxlength="6" onchange="return PinCodeValidation(this);" onkeypress="return isNumber(event);" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            </div>
            <div class="col-lg-3 pright0">
                <div id="divPhoto" class="col-md-12 box-container mtop15">
                    <div class="box-heading">
                        <h4 class="box-title manadatory"> Photograph
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
                        <h4 class="box-title manadatory"> Signature
                        </h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 120px" id="mySign" />
                            <input class="camera" id="File2" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="clearfix"></div>
           
            <div id="divPartnerDetail" runat="server" style="display: none;">
                <div class="col-md-12 box-container mtop10">
                    <div class="box-heading">
                        <h4 class="box-title">Added Patent & Proprietary Detail</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-lg-12">
                            <div class="table table-bordered" id="divmore" runat="server" style="display: none; width: 100%;">0</div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div id="divPartnerTable" class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title manadatory">Patent & Proprietary Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                        <thead>
                            <tr>
                                <th style="width: 14%;">Ingredients</th>
                                <th style="width: 14%;">Latin Name</th>
                                <th style="width: 14%;">Part Used</th>
                                <th style="width: 14%;" >Quantity</th>
                                <th style="width: 14%;">Classical Properties/Users</th>
                                 <th style="width: 14%;">Refrence book with page no</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" id="txtIngredients" maxlength="40" class="form-control" onkeypress="ForName(event);" /></td>
                                <td>
                                    <input type="text" id="txtLatin" maxlength="40" class="form-control" /></td>
                                <td>
                                    <input type="text" id="txtPart" maxlength="10" class="form-control"  /></td>
                                <td>
                                    <input type="text" id="txtQuantity" maxlength="10" class="form-control" onkeypress="return isNumber(event);" /></td>
                                <td>
                                    <input type="text" id="txtClassical" maxlength="40" class="form-control"  /></td>
                                                                   <td>
                                    <input type="text" id="txtRefrence" maxlength="40" class="form-control"  /></td>
                                <td>
                                    <input type="button" class="btn btn-primary" value="ADD" onclick="AddPatentDetail('');" /></td>
                            </tr>
                        </tbody>
                    </table>
               <br />        
                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Product Name</label>
                                <input type="text" class="form-control" placeholder="Product Name" id="txtProduct" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5" style="display:none">
                              <div class="form-group">
                                <label class="manadatory">Composition</label>
                                <input type="text" class="form-control" placeholder="Composition" id="txtComposition" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>

                     <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Sub Category</label>
                                <input type="text" class="form-control" placeholder="Sub Category" id="txtSubCategory" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Use- Internal/External</label>
                                <select class="form-control" id="ddlUseInternal">
                                    <option value="0">-Select-</option>
                                    <option value="Internal">Internal</option>
                                    <option value="External">External</option>
                                </select>
                        
                            </div>
                        </div>

                     <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Method to Use</label>
                                <input type="text" class="form-control" placeholder="Method to Use" id="txtmuPreparation" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Method of Preparation(Stepwise)</label>
                                <input type="text" class="form-control" placeholder="Method of Preparation(stepwise)" id="txtPreparation" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                          
                            <div class="form-group">
                                <label class="manadatory">Indication</label>
                                <input type="text" class="form-control" placeholder="Indication" id="txtIndication" maxlength="40" />
                            </div>
                        </div>
                       <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Expiry Date</label>
                                <input type="text" class="form-control" placeholder="Expiry Date" id="txtExpiryDate" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>Packing Size</label>
                                <input type="text" class="form-control" placeholder="Packing Size" maxlength="10" id="txtPackSize" onkeypress="return isNumber(event);" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

            </div>
            <div class="clearfix"></div>
            <br />
               <div id="divPartnerDetailC" runat="server" style="display: none;">
                <div class="col-md-12 box-container mtop10">
                    <div class="box-heading">
                        <h4 class="box-title">Added Classical Medicine Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-lg-12">
                            <div class="table table-bordered" id="divmoreC" runat="server" style="display: none; width: 100%;">0</div>
                        </div>
                    </div>
                </div>
            </div>
            <br />

               <div id="divClinicalMethod" class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title manadatory">Classical Medicine Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                        <thead>
                            <tr>
                                <th style="width: 15%;">Name of Classical Medicines</th>
                                <th style="width: 40%;">Name of Refrence book with Page no</th>
                                <th>Packing Size</th>
                                <th>Expiry Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" id="txtCMedicines" maxlength="40" class="form-control" onkeypress="ForName(event);" /></td>
                                <td>
                                    <input type="text" id="txtCRefrence" maxlength="40" class="form-control" /></td>
                                <td>
                                    <input type="text" id="txtCPackSize" maxlength="10" class="form-control"  /></td>
                                <td>
                                    <input type="text" id="txtCExpirydate" maxlength="10" class="form-control"/></td>
                                 <td>   <input type="button" class="btn btn-primary" value="ADD" onclick="AddClassicalDetail('');" /></td>
                            </tr>
                        </tbody>
                    </table>
               <br />        
                        
                        <div class="clearfix"></div>
                    </div>

            </div>

               <div id="divPartnerDetailL" runat="server" style="display: none;">
                <div class="col-md-12 box-container mtop10">
                    <div class="box-heading">
                        <h4 class="box-title">Added Label Claim Detail</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-lg-12">
                            <div class="table table-bordered" id="divmoreL" runat="server" style="display: none; width: 100%;">0</div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div id="div" class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title manadatory">Label Claim </h4>
                </div>
                <div class="box-body box-body-open">
                    <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                        <thead>
                            <tr>
                                <th style="width: 15%;">Ingredients</th>
                                <th style="width: 40%;">Latin Name</th>
                                <th>Part Used</th>
                                <th>Quantity</th>
                               <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" id="txtYIngredients" maxlength="40" class="form-control" onkeypress="ForName(event);" /></td>
                                <td>
                                    <input type="text" id="txtYLatin" maxlength="40" class="form-control" /></td>
                                <td>
                                    <input type="text" id="txtYPart" maxlength="10" class="form-control"  /></td>
                                <td>
                                    <input type="text" id="txtYQuantity" maxlength="10" class="form-control" onkeypress="return isNumber(event);" /></td>
                                <td>
                                    <input type="button" class="btn btn-primary" value="ADD" onclick="AddLabelDetail('');" /></td>
                            </tr>
                        </tbody>
                    </table>
               <br />        
                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Product Name</label>
                                <input type="text" class="form-control" placeholder="Product Name" id="txtYProduct" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5"  style="display:none">
                              <div class="form-group">
                                <label class="manadatory">Composition</label>
                                <input type="text" class="form-control" placeholder="Composition" id="txtYComposition" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>

                     <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Sub Category</label>
                                <input type="text" class="form-control" placeholder="Sub Category" id="txtYSubCategory" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Use- Internal/External</label>
                                <select class="form-control" id="ddlYUseInternal">
                                    <option value="0">-Select-</option>
                                    <option value="External">Internal</option>
                                    <option value="External">External</option>
                                </select>
                            </div>
                        </div>

                       
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                          
                            <div class="form-group">
                                <label class="manadatory">Indication</label>
                                <input type="text" class="form-control" placeholder="Indication" id="txtYIndication" maxlength="40" />
                            </div>
                        </div>
                     <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label class="manadatory">Method to Use</label>
                                <input type="text" class="form-control" placeholder="Method to Use" id="txtYPreparation" maxlength="40" onkeypress="ForName(event);" />
                            </div>
                        </div>
                       <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Expiry Date</label>
                                <input type="text" class="form-control" placeholder="Expiry Date" id="txtYExpiryDate"  />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>Packing Size</label>
                                <input type="text" class="form-control" placeholder="Packing Size" maxlength="10" id="txtYPackSize"  />
                            </div>
                        </div>

                     <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>Dose</label>
                                <input type="text" class="form-control" placeholder="Dose" maxlength="10" id="txtYDose"  />
                            </div>
                        </div>

                    
                     <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>Precaution</label>
                                <input type="text" class="form-control" placeholder="Precaution" maxlength="10" id="txtYPrecaution"  />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

            </div>
            <div class="clearfix"></div>
            <br />
              <div id="div" class="col-md-12 box-container mtop5">
                <div class="box-heading ">
                    <h4 class="box-title manadatory">Patent & Proprietary testing protocol </h4>
                </div>
                <div class="box-body box-body-open">
                    <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                        <thead>
                            <tr>
                                <th style="width: 10%;">Sr No</th>
                                <th style="width: 30%;">Name Of Test</th>
                                <th style="width: 30%;">Product Result</th>
                                 <th style="width: 30%;">Specifications</th>
                             
                               
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                   <td><label>1.</label></td>
                                <td><label>Total Bacterial Count</label></td>
                                <td>
                                    <input type="text" id="txtPR1" maxlength="40" class="form-control" /></td>
                                <td>1*10(5) CFU/gm</td>
                          
                            </tr>
                              <tr>
                                  <td></td>
                                <td>Yeast & Mould</td>
                                <td>
                                    <input type="text" id="txtPR2" maxlength="40" class="form-control" /></td>
                                <td>1*10(3) CFU/gm</td>
                          
                            </tr>
                            <tr>
                                  <td></td>

                                <td>E.coli</td>
                                <td>
                                    <input type="text" id="txtPR3" maxlength="40" class="form-control" /></td>
                                <td>Absent</td>
                          
                            </tr>
                              <tr>
                                  <td></td>
                                <td>Salminella</td>
                                <td>
                                    <input type="text" id="txtPR4" maxlength="40" class="form-control" /></td>
                                <td>Absent</td>
                          
                            </tr>
                             <tr>   <td></td>
                                <td>P.aeruginosa</td>
                                <td>
                                    <input type="text" id="txtPR5" maxlength="40" class="form-control" /></td>
                                <td>Absent</td>
                          
                            </tr>
                              <tr>   <td></td>
                                <td>S.aureus</td>
                                <td>
                                    <input type="text" id="txtPR6" maxlength="40" class="form-control" /></td>
                                <td>Absent</td>
                          
                            </tr>

                             <tr>
                                    <td><label>2.</label></td>
                                <td><label>Pesticide Residue-Organo-chloro group</label></td>
                                <td>
                                    <input type="text" id="txtPR7" maxlength="40" class="form-control" /></td>
                                <td>Less than 1 ppm</td>
                          
                            </tr>
                                <tr>
                                       <td><label>3.</label></td>
                                <td><label>Heavy Metals</label></td>
                                <td>
                                    <input type="text" id="txtPRH" maxlength="40" class="form-control" /></td>
                                <td></td>
                          
                            </tr>
                             <tr>   <td></td>
                                <td>Lead</td>
                                <td>
                                    <input type="text" id="txtPR8" maxlength="40" class="form-control" /></td>
                                <td>10ppm</td>
                          
                            </tr>
                             <tr>   <td></td>
                                <td>Mercury</td>
                                <td>
                                    <input type="text" id="txtPR9" maxlength="40" class="form-control" /></td>
                                <td>01ppm</td>
                          
                            </tr>
                             <tr>   <td></td>
                                <td>Arsenic</td>
                                <td>
                                    <input type="text" id="txtPR10" maxlength="40" class="form-control" /></td>
                                <td>03ppm</td>
                          
                            </tr>

                               <tr>   <td></td>
                                <td>Cadmium</td>
                                <td>
                                    <input type="text" id="txtPR11" maxlength="40" class="form-control" /></td>
                                <td>0.3ppm</td>
                          
                            </tr>

                             <tr>
                                    <td><label>4.</label></td>
                                <td><label>Aflatoxin</label></td>
                                <td>
                                    <input type="text" id="txtPR12" maxlength="40" class="form-control" /></td>
                                <td>B1-0.5 ppb</td>
                          
                            </tr>

                            <tr>   <td></td>
                                <td></td>
                                <td>
                                    <input type="text" id="txtPR13" maxlength="40" class="form-control" /></td>
                                <td>G1-0.5 ppb</td>
                          
                            </tr>

                            <tr>   <td></td>
                                <td></td>
                                <td>
                                    <input type="text" id="txtPR14" maxlength="40" class="form-control" /></td>
                                <td>B2-0.1 ppb</td>
                          
                            </tr>
                              <tr>   <td></td>
                                <td></td>
                                <td>
                                    <input type="text" id="txtPR15" maxlength="40" class="form-control" /></td>
                                <td>G2-0.5 ppb</td>
                          
                            </tr>
                        </tbody>
                    </table>
               <br />        
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
                                {{resourcesData.lblI}}, <b><span id="lblUName" style="text-transform: uppercase; color: black; font-weight: bolder;"></span></b>
                                {{resourcesData.birthDeclaration}}
                            </p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="mtop20"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center mb20">
                <input type="button" id="btnSubmit2" class="btn btn-primary" value="SUBMIT" onclick="SubmitData();" />
                <input type="button" id="btClear" class="btn btn-danger" value="RESET" onclick="Reset();" />
            </div>
        </div>
    </div>
         </div>
    <asp:HiddenField ID="hdfPatent" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdfClassical" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdflabel" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdfTesting" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="HDNFNM" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" />
</asp:Content>
