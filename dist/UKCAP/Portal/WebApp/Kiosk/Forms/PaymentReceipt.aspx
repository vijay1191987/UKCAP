<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="PaymentReceipt.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.PaymentReceipt" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/CommonScript.js"></script>

    <script type="text/javascript">
        function SetTarget()
        {
            //document.forms[0].target = "_blank";
            document.getElementById("btnAckw").target = "_blank";
        }
    </script>
    <style>
        .form-group label {
            display: inline;
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%--<uc1:Infomation runat="server" ID="Infomation" />--%><%---Start of Application----%>
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Receipt
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" style="text-align: center;">
                        <div id="divPrint" style="">
                            <table cellpadding="5" cellspacing="0" class="table table-bordered table-striped" style="font-family: Arial; font-size: 12px; width: 750px; border: 0; margin: auto;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <table style="width: 100%; text-align: center;">
                                            <tr style="text-align: center;">
                                                <td style="width: 33%; text-align: left;">
                                                    <img src="../Images/ukservice_logo.png" style="width: 100px" /></td>
                                                <td style="width: 34%; text-align: center;">
                                                    <%--<img src="../Images/logo.png" style="width: 100px" />--%></td>
                                                <td style="width: 33%; text-align: right;">
                                                    <%--<img src="../Images/QRCode.png" style="width: 100px" />--%>
                                                    <uc1:QRCode runat="server" ID="QRCode1" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"></td>
                                </tr>
                                <tr>
                                    <th style="padding: 5px; border: 1px solid #999; text-align: center;" colspan="4">
                                        <strong>RECEIPT</strong></th>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <strong>Application Detail</strong></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="tokanno" runat="server" CssClass="lbl_property" Text="Application Number"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 235px;">
                                        <label runat="server" id="lblAppID"></label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label77" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 235px;">
                                        <label id="lblAppDate" runat="server">
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label82" runat="server" Text="Service Name"></asp:Label>
                                    </td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; width: 235px;">
                                        <label runat="server" id="lblServiceName"></label>
                                    </td>
                                    <td style="padding: 5px; display: none; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label87" runat="server" CssClass="lbl_property" Text="Concerned Office"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; display: none; border: 1px solid #999; text-align: left; width: 235px;">
                                        <asp:Label ID="lblOffice" runat="server" CssClass="lbl_property"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label88" runat="server" Text="Designated Officer"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 235px;">
                                        <asp:Label ID="lblOfficer" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label89" runat="server" Text="Officer Contact No."></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 235px;">
                                        <asp:Label ID="lblOfficerNo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label79" runat="server" CssClass="lbl_property" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 235px;">
                                        <label runat="server" id="lblAppName"></label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label81" runat="server" Text="Beneficiary Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 235px;">
                                        <label runat="server" id="lblBenificery"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label runat="server" id="appemail">Applicant Email ID</label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAppEmail" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label id="appmobile" runat="server">Applicant Mobile No.</label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAppMobile" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left;" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Payment Detail</strong></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label class="" for="ddlYearTerm">Transaction ID</label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label runat="server" id="lblTransactionID"></label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label class="" for="ddlYearTerm">Transaction Date</label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label class="" id="lblTransDate" runat="server"></label>
                                    </td>
                                </tr>
                                <tr runat="server" id="trKiosk1">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label class="" for="ddlYearTerm">Kiosk / OMT ID</label>
                                    </td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <label class="" id="lblCreatedBy" runat="server"></label>
                                    </td>
                                    <td style="padding: 5px; display: none; border: 1px solid #999; text-align: left;">
                                        <label class="" for="ddlYearTerm">
                                            Kiosk Name
                                        </label>
                                    </td>
                                    <td style="padding: 5px; display: none; border: 1px solid #999; text-align: left;">
                                        <label class="" id="lblKiosk" runat="server"></label>
                                    </td>
                                </tr>
                                <tr runat="server" id="trKiosk2">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label83" runat="server" CssClass="lbl_property" Text="Kiosk Email ID"></asp:Label>
                                    </td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblKioskEmail" runat="server" CssClass="lbl_property"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; display: none; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label84" runat="server" CssClass="lbl_property" Text="Kiosk Mobile No."></asp:Label>
                                    </td>
                                    <td style="padding: 5px; display: none; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblKioskMobile" runat="server" CssClass="lbl_property"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label2" runat="server" CssClass="lbl_property" Text="Payment Through"></asp:Label>
                                    </td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblPayThrough" runat="server" CssClass="lbl_property"></asp:Label>
                                    </td>
                                    <%--<td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>--%>
                                </tr>
                                <tr style="display: none;">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label5" runat="server" CssClass="lbl_property" Text="Dept. + Govt. + Other + Portal + Svc:"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                        <i class="fa fa-rupee"></i>
                                        <span runat="server" id="lblDeptFee"></span>
                                        + <i class="fa fa-rupee"></i>
                                        <span id="lblGovtFee" runat="server"></span>+<i class="fa fa-rupee"></i>
                                        <span id="lblOtherCharges" runat="server"></span>+ <i class="fa fa-rupee"></i>
                                        <span id="lblPortalFee" runat="server"></span>+ <i class="fa fa-rupee"></i>
                                        <span id="lblSvcTax" runat="server"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label6" runat="server" CssClass="lbl_property" Text="Total Amount:" Font-Bold="true"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Rs. <%--<i class="fa fa-rupee"></i>--%><span runat="server" id="lblTotal"></span>
                                        <%--<strong>(Thirty Three Rupees and Zero Paise)</strong>--%>
                                        <strong>(Rupees
                                            <asp:Label ID="lblAmtInText" runat="server" CssClass="lbl_property"></asp:Label>)</strong>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <asp:Button ID="btnAckw" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="View Acknowledgment" CssClass="btn btn-danger" PostBackUrl="" Text="View Acknowledgment" OnClick="btnAckw_Click" OnClientClick="SetTarget();" />
                    <%--<asp:Button ID="btnHome" runat="server" CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page" Text="Home" />--%>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <%----END of Button-----%>
    </div>
    </div>
</asp:Content>