﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="PensionForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MBPY.PensionForm" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/MBPY/MBPY.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
                    .form-heading {
        color: #820000;
        text-align: left;
        border-left: 15px solid #ce6d07;
        border-right: 2px solid #ce6d07;
        border-top: 1px solid #d8d8d8;
        border-bottom: 1px solid #d8d8d8;
        background: rgba(0, 0, 0, .075);
        padding: 10px 20px 10px 15px;
        border-top-right-radius: 2px;
        border-top-left-radius: 2px;
        text-transform: uppercase;
        font-weight: bold;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>  {{titleData.lblTitle}}
    </h2>
                <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />

                <div class="row" id="divPensionDetails" runat="server">
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title"><span class="col-md-6" style="padding: 0">INFORMATION</span> <span class="col-md-6" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i></span><span class="clearfix"></span>
                            </h4>
                        </div>
                        <%--<uc1:Declaration runat="server" id="Declaration" />--%>
                        <uc1:ServiceInformation runat="server" ID="ServiceInformation1" />
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <%---Start of BirthDetails----%>
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Pension Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="deceasedname">
                                                Pension Type</label>
                                            <select class="form-control" data-val="true" data-val-number="PensionType"
                                                data-val-required="Please Select Pension Type" id="ddlPension" name="PensionType" onchange="fnPensionType();">
                                                <option value="0">Select Pension Type</option>
                                                <option value="101">Old Age Pension(60 years and above)</option>
                                                <option value="102">Widow Pension</option>
                                                <option value="103">Disability Pension</option>
                                                <option value="104">Unmarried Women Pension</option>
                                                <option value="105">Specially Disability Pension </option>
                                                <option value="106">Cured Leprosy Patient</option>
                                                <option value="107">Old Age Pension(Greater than 80)</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3" id="divDisability" runat="server">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">
                                                Type of Disability for which allowance<%--/Pension applied--%></label>
                                            <select class="form-control" data-val="true" data-val-number="PensionType" autofocus="autofocus"
                                                data-val-required="Please Select Type of Disability" id="ddldiasbility" name="diasbilityType">
                                                <option value="0">Select Type of Disability</option>
                                                <option value="101">Blind</option>
                                                <option value="102">Cerebral Palasy</option>
                                                <option value="103">Handicapped Leprosy Patient</option>
                                                <option value="104">Physical Handicaped</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3" id="divpercentage">
                                        <div class="form-group">
                                            <label class="manadatory" for="diasbilitypercentage">
                                                Degree/Percentage of disability</label>
                                            <input id="diasbilityMPYpercentage" class="form-control" placeholder="Degree/Percentage of Disability" name="diasbilitypercentage" type="text" value="" onchange="validatedisablity();"
                                                onkeypress="return isNumberKey(event, this);" maxlength="2" autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2" id="divwidow" runat="server">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlwidow">
                                                Is a widow</label>
                                            <select class="form-control" data-val="true" data-val-number="WidowType"
                                                data-val-required="Please Select for widow" id="ddlwidow">
                                                <option value="0">Select </option>
                                                <option value="1">Yes</option>
                                                <option value="2">No</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOD">
                                                Total Income per Month</label>
                                            <input id="txtIncome" class="form-control" placeholder="Income Per Month" name="Income Per Month" type="text" value="" onchange="validateIncome();" maxlength="5"
                                                onkeypress="return isNumberKey(event, this);" autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label for="bplMBPYcardno" class="manadatory">
                                                {{resourcesData.bplcardno}}</label>
                                            <input id="bplMBPYcardno" class="form-control" placeholder="Enter BPL Card No." name="BPLCardNo" type="text" value="" onkeypress="return isNumberKey(event)" maxlength="6"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label for="BPLMPBYear" class="manadatory">
                                                {{resourcesData.bplYear}}</label>
                                            <select class="form-control" data-val="true" data-val-number="BPLYear."
                                                data-val-required="Please select gender." id="BPLMPBYear" name="BPLYear" runat="server">
                                                <option>Select BPL Year</option>
                                                <option>2016</option>
                                                <option>2015</option>
                                                <option>2014</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of BirthDetails-----%>
                        </div>

                    </div>
                </div>

                <%---Start of BankDetails----%>
                <div class="row" id="divBankDtls" runat="server">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Account Details of Beneficiary
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="AccountHolder" class="manadatory">
                                        Name of the Account Holder</label>
                                    <input id="AccountHolder" class="form-control" placeholder="Name of Account Holder" name="AccountHolder" type="text" value="" maxlength="25"
                                        onkeypress="return ValidateAlpha(event);" autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="AccountNumber" class="manadatory">
                                        Account Number</label>
                                    <input id="AccountNumber" class="form-control" placeholder="Account Number" name="AccNo" type="text" value="" maxlength="22"
                                        onkeypress="return isNumberKey(event)" autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="IFSCCode" class="manadatory">
                                        IFSC Code</label>
                                    <input id="IFSCCode" class="form-control"   placeholder="Enter IFSC Code" name="IFSCCode" type="text" value="" maxlength="11" 
                                      onchange="AllowIFSC()" autofocus />
                                     <label for="IFSCCODE" class="forerrormsg"  style="color: red;" ></label>                            
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----End of BankDetails-----%>

                <%---Start of Declaration----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblDeclaration}}
                            </h4>
                        </div>
                        <%--<uc1:Declaration runat="server" id="Declaration" />--%>
                        <uc1:Declaration runat="server" ID="Declaration" />
                    </div>
                </div>
                <%----End of Declaration-----%>


                <%---Start of Button----%>
                <div class="row" id="divButton" runat="server">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <%--<asp:Button ID="btnConfirm" runat="server" Text="Submit" class="btn btn-success"
                        OnClientClick="return checkDeclaration();" />--%>
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="SubmitData();" title="Proceed to Upload Necessary Document" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />
                            <asp:Button ID="btnHome" runat="server"
                                CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page"
                                Text="Home" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <asp:HiddenField ID="HiddenAge" runat="server" />
    <asp:HiddenField ID="Hiddengender" runat="server" />


    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
</asp:Content>
