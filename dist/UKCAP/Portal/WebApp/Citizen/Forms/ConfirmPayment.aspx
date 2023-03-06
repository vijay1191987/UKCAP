<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="ConfirmPayment.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.ConfirmPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .instruction {
            background: #fff;
            opacity: 0.89;
            border: 4px solid #ddd;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid ptop15">
            <div class="col-lg-12">
                <h3 class="form-heading register-num">Confirm Payment</h3>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7">
                <div class="table-responsive">
                    <table cellpadding="0" cellspacing="0" style="border: 1px solid #a8a8a8; width: 100%; font-family: Arial; font-size: 12px; padding: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="background-color: #ddd; border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px; margin: 0;"><b>Applicant Name</b></td>
                                <td style="border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px;">
                                    <span id="lblName"></span>
                                </td>
                                <td style="background-color: #ddd; border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px; margin: 0;"><b>Application Date</b></td>
                                <td style="border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px;">
                                    <span id="lblBooking"></span>
                                </td>
                            </tr>
                            <tr>

                                <td style="background-color: #ddd; border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px; margin: 0;"><b>Service Name</b></td>
                                <td style="border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px;">
                                    <span id="lblServiceName"></span>
                                </td>
                                <td style="background-color: #ddd; border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px; margin: 0;"><b>Beneficiary Name</b></td>
                                <td style="border-bottom: 1px solid #a8a8a8; padding: 5px;">
                                    <span id="lblBenfName"></span>
                                </td>
                            </tr>

                           

                            <tr>
                                <td style="background-color: #ddd; border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px; margin: 0;"><b>Mobile</b></td>
                                <td style="border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px;">
                                    <span id="lblMobile"></span>
                                </td>
                                <td style="background-color: #ddd; border-right: 1px solid #a8a8a8; border-bottom: 1px solid #a8a8a8; padding: 5px; margin: 0;"><b>Alternate No</b></td>
                                <td style="border-bottom: 1px solid #a8a8a8; padding: 5px;">
                                    <span id="lblAltNo"></span>
                                </td>
                            </tr>

                            <tr>
                               
                                <td style="background-color: #ddd; border-right: 1px solid #a8a8a8; padding: 5px; margin: 0;"><b>Applicant Email ID</b></td>
                                <td colspan="3" style="padding: 5px;">
                                    <span id="lblemailID"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br/>
                    
                </div>
                <div class="clearfix"></div>
                <div class="ptop15"></div>


            </div>
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-lg-push-1 instruction">
                <h4>Click to proceed for payment options:-</h4>
                <p>
                    <img src="/WebAppUK/img/payment_option.jpg" />
                </p>
                <div class="mtop20 mbtm20">
                    <input type="submit" name="" value="Proceed >>" id="ConfirmPassport" class="proceed-btn" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
