<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebAppUK.DomicileCertificate.Acknowledgement" %>

<!DOCTYPE html>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function CallPrint(strid) {
            debugger;
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .t_trans {
            text-transform: capitalize;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="box-body box-body-open">
            <div id="Panel2" style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">

                <div id="divPrint" style="margin: 0 auto; height: 1360px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 1355px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                        <div style="height: 115px; width: 785px; border-bottom: 1px solid #999;">
                           <div style="width: 165px; float: left; height: 115px;">
                                  <img alt="logo" src="../img/uttarakhand_state_logo.png" style="width: 100px; margin: 5px 0px 0px 33px;" />
                            </div>
                            <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                    Trans. No.
                                </div>
                                <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                    <span id="Label1" style="font-weight: bold;"></span>
                                </div>
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                    Trans. Date
                                </div>
                                <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                    <span id="Label2" style="font-weight: bold;"></span>
                                </div>
                            </div>
                            <div style="height: 47px; float: right; margin: 5px 31px 0 0;">
                                <uc1:QRCode runat="server" ID="QRCode" />
                            </div>
                        </div>

                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <span id="lblCertificateName" style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Acknowledgement (Domicile)</span>
                            <br>
                            <span id="lblDeptName" style="font-size: 15px">Revenue Department</span>
                        </div>
                        <div style="margin: 0 auto; width: 708px; font-size: 13px;">
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tbody>
                                    <tr>
                                        <td style="background-color: #E4E4E4; padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b>Beneficiary Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">
                                            <span id="Child">Beneficiary Full Name</span>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight: bold;">Father/Husband Name
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Mother Name
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMother" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight: bold;">DOB</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Beneficiary Birth Place</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblBirthPlace" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight: bold;">Father Birth Place</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFatherBirthPlace" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Gender</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Mobile</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Email Id</td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEmailID" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tbody>
                                    <tr>
                                        <td colspan="5" style="background-color: #E4E4E4; border-style: solid solid  solid; border-width: 1px; border-color: #999; border-bottom: 1px solid #999; padding: 5px; text-align: left; width: 135px;"><b>Beneficiary Address Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px; font-weight: bold;">Beneficiary Address</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <asp:Label ID="lblAddressLine1" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 12px; line-height: 11.5px; text-align: left; width: 135px; vertical-align: top; font-weight: bold;" rowspan="3">
                                            <span id="Label5">House / Apartment No.<br />
                                                No. / Name of Building
                                                <br />
                                                Locality / Landmark<br />
                                                Road / Street Name </span>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px; font-weight: bold;">State</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblStateName" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 145px; font-weight: bold;">District</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                            <asp:Label ID="lblDistrictName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight: bold;">Block/Taluka/Sub District</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblSubDistrictName" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight: bold;">Gram Panchayat</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGramPanchayatName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight: bold;">Pincode</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="lblPincode" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight: bold;"></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="lblMunsiPatwariChowkiName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tbody>
                                    <tr>
                                        <td style="background-color: #E4E4E4; padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b>Reason for Apply Domicile Certificate</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">
                                            <span id="Reason">Reason</span>
                                        </td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblReasonForDomicile" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tbody>
                                    <tr>
                                        <td style="background-color: #E4E4E4; padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b>Other Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 480px; font-weight: bold;">1.Are you a resident of Uttarakhand?</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="IsResidentofUK" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <div id="ResidentOfUK" runat="server">
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">For how many years have you been residing in Uttarakhand?</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblYearsInUK" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </div>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">2. Have you or your father/mother/grandfather any property?</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblHasMomDadProperty" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <div id="HasMomDadProperty" runat="server">
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">Please Describe Property</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblDescribeProperty" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">Please Describe Property Value</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblDescribeValue" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </div>

                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">3. Wheather the parent of the applicant are earning livinghood in their native place?</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="isParentEarningUK" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <div id="ParentEarning" runat="server">
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">If no, please describe where they earning their livinghood. </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblIfNoDescribe" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">From When  </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblFromWhen" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">Type of Bussiness </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblTypeOfBussiness" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </div>

                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">4.  Wheather the parents of the applicant are working in Govt.Sector?</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblisParentWorkingGovt" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <div id="ParentWorkingGovt" runat="server">
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">If Yes, In which district</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblIfYesDistrict" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">In which Department </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblGovtDepartment" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 15px; border: 1px solid #999; text-align: left; width: 135px;">In which Post </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                <asp:Label ID="lblGovtPost" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </div>
                                </tbody>
                            </table>
                            <br />
                            <table cellpadding="0" cellspacing="0" width="100%" style="">
                                <tbody>
                                    <tr>
                                        <td style="background-color: #E4E4E4; padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div>
                                <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static" Width="100%">
                                </asp:GridView>
                            </div>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tbody>
                                    <tr>
                                        <td style="background-color: #E4E4E4; padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Payment Details<span id="AppName" class="lbl_value" style="white-space: normal !important;"></span>
                                        </b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Reference ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblReferenceID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Application Date</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="AppDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Transaction ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Transaction Date</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="display: none;">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold; display: none">Transaction Amount</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; display: none"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold; white-space: nowrap; display: none">Portal Fee + Service Tax</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; display: none;">
                                            <i class="fa fa-rupee"></i><span id="lblPortalFee">Rs. 02.75</span>
                                            + <i class="fa fa-rupee"></i><span id="lblServTax">Rs. 02.75</span></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Total Amount</td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblAmt" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        
                            <br/>
                    
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center; margin: 10px auto;">
            <input type="button" id="btnSubmit" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border:none; border-radius:2px; padding:8px; min-width:120px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="Cancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
        </div>
    </form>
</body>
</html>
