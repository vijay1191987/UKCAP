<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="ProgressBar.aspx.cs" Inherits="CitizenPortal.WebAppUK.ProgressBar.ProgressBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <link href="/g2c/css/formSteps.css" rel="stylesheet" />
    <style>
        .mtop10 {
            margin-top: 10px !important;
        }

        .mbtm20 {
            margin-bottom: 20px !important;
        }

        .wizard_inston {
            width: 95%;
            margin: 0 auto;
            padding: 0;
        }

            .wizard_inston p {
                text-align: left;
                line-height: 30.5px;
                font-family: Arial;
                color: #000 !important;
            }

                .wizard_inston p a {
                    color: #337ab7;
                    font-size: 15px;
                }

        p {
            color: #000 !important;
        }

        .dsplynone {
            display: none !important;
        }
    </style>
    <script type="text/javascript">
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="DivFormB" runat="server" class="container mtop10 hldshdw" style="padding-right: 0; padding-left: 0; width: 99%;">
            <div class="col-lg-12 wizard_hd">
                <i class="fa fas fa-user-secret fa-fw fa-2x"></i><span id="lblTitle" runat="server"></span>
            </div>
            <div class="row bs-wizard" style="border-bottom: 0;">
                <div class="col-xs-2 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">Step 1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Application Saved</div>
                </div>
                <div class="col-xs-2 bs-wizard-step disabled" style="display: block;">
                    <!-- complete -->
                    <div class="text-center bs-wizard-stepnum">Step 2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Upload Documents</div>
                </div>
                <div class="col-xs-2 bs-wizard-step disabled" style="display: block;">
                    <!-- active -->
                    <div class="text-center bs-wizard-stepnum">Step 3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Make Payment For Application</div>
                </div>
                <div class="col-xs-2 bs-wizard-step disabled" style="display: block;">
                    <!-- active -->
                    <div class="text-center bs-wizard-stepnum">Step 4</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Get Payment Receipt</div>
                </div>
                <div class="col-xs-2 bs-wizard-step disabled" style="display: block;">
                    <!-- complete -->
                    <div class="text-center bs-wizard-stepnum">Step 5</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Acknowledgement Page</div>
                </div>
            </div>
            <br />
            <br />
            <div>
                <div class="wizard_inston text-left">
                    <p>
                        1. Dear,
                        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="20px" ForeColor="#990000"></asp:Label>
                        your Application is saved.<br />
                        &nbsp;&nbsp;&nbsp;
                        The Application Number
                                     <b>
                                         <asp:Label ID="lblAppID" runat="server" Font-Bold="True" Font-Size="20px" ForeColor="#990000"></asp:Label></b> Submitted on <b>
                                             <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Size="20px" ForeColor="#990000"></asp:Label></b>
                        please note down the number for future use.
                        <br />
                        2. Please upload all relevant documents against the Application Number.
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="20px"></asp:Label>
                    </p>
                    <p style="display: block;">
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        Payment can be done through Online (Payment Gateway) or at any CSC centers (<a href="/g2c/forms/CenterList.aspx" target="_blank">CSC centers in Uttrakhand</a>)<br />
                        3. Check your Application status after login through your Login ID (detailed SMS and email)
                    </p>
                </div>
                <p style="color: maroon !important; width: 90%; margin: 0 auto; font-family: Arial; text-align: center; font-size: 20px; display: none;">
                    <b style="font-size: 20px;">Please Note: </b>Your Application is <b style="font-size: 20px;">NOT VALID</b>
                    unless the payment is done
                        <br />
                    CAP Portal - <b style="font-size: 25px; color: maroon !important;">www.ukcaptest.uniso.in</b>
                </p>
            </div>
            <div class="clearfix"></div>
            <div class="row mtop10 mbtm20">
                <div class="form-group mtop10">
                    <div class="col-md-4">
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="box-body box-body-open" style="text-align: center; margin-top: 25px;">
            <asp:Button ID="btnSubmit" CausesValidation="False" CssClass="btn btn-success" Text="Proceed" OnClick="btnSubmit_Click" runat="server" />
            <input type="button" id="print" class="btn btn-primary" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <%--<input type="submit" value="Home" id="btnHome" class="btn btn-danger" />--%>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>