<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="ConfirmPaymentCOD.aspx.cs" Inherits="CitizenPortal.WebAppUK.forms.ConfirmPaymentCOD" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>   
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../css/common.css" rel="stylesheet" />
    <script src="ConfirmPayment.js"></script>
    <script type="text/javascript">
        function ReturnSubmit() {
            debugger;
            var qs = getQueryStrings();
            var uid = qs["UID"];
            window.location = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
        }
    </script>
     <script type="text/javascript">
         function getQueryStrings() {
             var assoc = {};
             var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
             var queryString = location.search.substring(1);
             var keyValues = queryString.split('&');

             for (var i in keyValues) {
                 var key = keyValues[i].split('=');
                 if (key.length > 1) {
                     assoc[decode(key[0])] = decode(key[1]);
                 }
             }
             return assoc;
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mtop15" style="min-height:490px;">
        <div class="col-lg-12 box-container">
            <div class="box-heading">
            <h4 class="box-title register-num">Confirm Payment</h4>
                </div>
             <div class="box-body box-body-open">
                 <div class="table-responsive">
                 <table class="confirm_payment_Tble">
                     <tr>
                         <td style="background-color:#e9e9e9; width:10%;">Application Date</td>
                          <td style="width:38%;"><label runat="server" id="lblAppdate"></label></td>
                          <td style="background-color:#e9e9e9; width:10%;">Application Number</td>
                          <td style="width:38%;"><label runat="server" id="lblAppID"></label></td>
                     </tr>
                     <tr>
                         <td style="background-color:#e9e9e9;">Service Name</td>
                          <td colspan="3"><label runat="server" id="lblAppName"></label></td>
                     </tr>
                     <tr>
                         <td style="background-color:#e9e9e9;">Amount to Pay</td>
                          <td><label runat="server" id="lblTotal"></label></td>
                         <td style="background-color:#e9e9e9;">Applied By</td>
                          <td><label runat="server" id="lblCreatedBy"></label></td>
                     </tr>
                 </table>
                     <br />
                     <table class="confirm_payment_Tble">
                     <tr>
                         <td colspan="6" style="background-color:#e0e0e0;">Verify Your Mobile</td>
                     </tr>
                     <tr>
                         <td style="background-color:#e9e9e9; width:15%;">Mobile No</td>
                          <td style="width:15%;">
                              <input type="text" id="MobileNo" class="form-control" 
                              placeholder="Enter your registered mobile no."  readonly="true"
                               maxlength="10" runat="server"/></td>
                          <td style="width:15%; text-align:center;"><input type="button" class="btn btn-info" id="btnsendotp" value="SendOtp" onclick="sendotp();" /></td>
                         <td style="background-color:#e9e9e9; width:10%;">Enter OTP</td>
                          <td style="width:8%;"><input type="text" id="verifyOTP" class="form-control" runat="server" placeholder="Enter OTP" ClientIDMode="Static"  maxlength="6" /></td>
                         <td style="width:15%; text-align:center;"><input type="button" id="btnverifyotp" class="btn btn-info" value="Verfiy" onclick="verifyotp()" /></td>
                     </tr>
                 </table>
                     </div>
             </div>

            
        </div>
        <div class="col-md-12 box-container" id="Div2">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Declaration</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-sm-6 col-md-6 col-lg-12">
                            <p class="text-justify">
                                <input type="checkbox" name="checkbox" id="FormDeclaration"  ClientIDMode="Static"  onclick="calc();" runat="server"  />
                                <b>This is a Cash On Delivery Services.The Certificate Will be Delivered On Your Registerd Address. 
                                   Upon Delivery You Have to Pay Res 50/- As Cash.
                            </b>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
        <div class="col-lg-12 box-container">
                <div class="box-body box-body-open" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success" 
                                 Text="Confirm Payment" OnClick="btnSubmit_Click" ClientIDMode="Static" />
            <%--       <input type="button" name="Button1" value="Cancel" id="Button1" class="btn btn-danger" onclick="ReturnSubmit();" />
                    --%>
                            <asp:Button ID="btnHome" runat="server"  ClientIDMode="Static"
                                CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page"
                                Text="Home" />
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HFServiceID" runat="server"/>
    <asp:HiddenField ID="HFUserType" runat="server" />
     <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" />
</asp:Content>
