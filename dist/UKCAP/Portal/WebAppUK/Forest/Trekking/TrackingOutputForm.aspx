<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrackingOutputForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.Forest.Trekking.TrackingOutputForm" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tracking Permit</title>
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
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint">
            <div style="margin: 0 auto; height: 1150px; width: 850px; border: 3px solid #000; padding: 1px; font-family: Arial">
                <div style="width: 844px; height: 99.5%; border: 1px solid #000; margin: 2px auto;">
                    
                        <table cellpadding="0" cellspacing="0" style="width: 794px; font-family: Arial; text-align: center; font-size: 13px; border-bottom-style: solid; margin: 0;">
                            <tbody>

                                <tr>
                                    <td style="width: 80%; padding-left: 100px;">&nbsp;
                                                    <h2 style="margin-bottom: 4px;">OFFICE OF DEPUTY DIRECTOR
                                                    </h2>
                                        <h2 style="margin: 0px auto;">
                                            <asp:Label runat="server" ID="lblTehsil"></asp:Label></h2>
                                    </td>
                                    <td style="width: 20%">
                                        <uc1:QRCode runat="server" ID="QRCode1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 100px;"><strong>TRACKING PERMIT</strong></td>
                                    <td style="padding-right: 20px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; padding-left: 10px;"><strong>&nbsp;Tracking Permit No.</strong>&nbsp;
                                        <asp:Label ID="lblAppID" runat="server"></asp:Label></td>
                                    <td style="text-align: right; padding-right: 10px;"><strong>Application Date </strong>
                                        <asp:Label ID="lblAppDate" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                  
                    <div style="min-height:700px;">
                        <table cellpadding="0" cellspacing="0" style="width: 788px; font-family: Arial; text-align: center; font-size: 14px; line-height: 24px; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td style="font-family: Times New Roman; font-size: 22px; padding: 20px 10px; text-decoration: underline;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify; padding: 0 10px;">Permission is being granted under section 28 (i) (ii) of Wild Life Protection Act, 1972 to following
                                <asp:Label ID="lblNoofPersons" runat="server"></asp:Label>
                                        &nbsp;Number of persons for entry to
                                        <asp:Label ID="lbldivisionnew" runat="server"></asp:Label>&nbsp; on
                                <asp:Label ID="lblTrackingDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 780px; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                                            <tbody>
                                                <tr>
                                                    <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; -webkit-print-color-adjust: exact;" colspan="4">Tracking Booked By</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Booked By</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblBookedBy" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Gender</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblGender" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Mobile No.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblMobileNo" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Email ID</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblEmailId" runat="server"></asp:Label></td>
                                                </tr>
                                            </tbody>
                                        </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 780px; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                                            <tbody>
                                                <tr>
                                                    <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; -webkit-print-color-adjust: exact;" colspan="4">Booking Detail</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Division</td>
                                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDivision" runat="server"></asp:Label></td>
                                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Area</td>
                                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAea" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Start Date</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblStartDate" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">End Date</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblEndDate" runat="server"></asp:Label></td>
                                                </tr>
                                            </tbody>
                                        </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 780px; line-height: 18px; border: none; margin: 0 auto;">
                                            <tbody>
                                                <tr>
                                                    <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; line-height: 18px; font-weight: bold; -webkit-print-color-adjust: exact;" colspan="4">Trackers Details</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GridTrackerDetail" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0;" ClientIDMode="Static" Width="780px" BorderStyle="Solid" Font-Strikeout="False">
                                                            <HeaderStyle BackColor="#CCCCCC" Font-Size="11px" ForeColor="Black" />
                                                            <RowStyle Font-Size="11px" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                        </div>
                    <div style="width: 790px; margin: 0 auto;">
                        <table cellpadding="0" cellspacing="0" style="width: 785px; font-family: Arial; font-size: 14px; line-height: 24px; margin: 0 3px;">
                            <tbody>

                                <tr>
                                    <td colspan="2" style="text-align: justify; padding: 0 10px;">Conditions:-<br />
                                        1. Payment of requisite fees at Konku forest check post.<br />
                                        2. Carrying arms, domestic pet and polythene is banned.<br />
                                        3. Movement of mule and horses banned.<br />
                                        4. Tent pitching at Bhojbasa and Chirbasa only.<br />
                                        5. Maintain a distance of 500 Mtr. From Goumukh Glacier and snout point is forbidden area.<br />
                                        6. Trackking beyond goumukh need special permission.
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 75%;">&nbsp;</td>
                                    <td valign="bottom" style="font-size: 18px; text-align: center;">Deputy Director<br />
                                        <asp:Label ID="lblSignDirector" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div style="text-align: center; margin: 10px auto;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; border-radius: 2px; padding: 8px; min-width: 120px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
