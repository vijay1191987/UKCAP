<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnglingOutputForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.Forest.Angling.AnglingOutputForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Angling Permission Permit </title>
    <script type="text/javascript">
        function CallPrint(strid) {
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
            width: 65%;
            height: 28px;
        }
        .auto-style2 {
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint">
           
            <div style="margin: 0 auto; height: 1150px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial; background-image:url(../img/certificate_logo_bg.png); background-repeat:no-repeat; background-size:contain; background-position:center;">
                <div style="width: 788px; height: 99.5%; border: 1px solid #000; margin: 2px auto;">
                    <div>
                        <table style="width: 100%; font-family: Arial; text-align: center; font-size: 13px;">
                            <tbody>
                                <tr>
                                    <td colspan="2" style="font-size: 28px; padding-top: 10px; font-weight:bold;">DUPLICATE FORM B FISHING</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-family: Times New Roman; font-size: 15px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left; padding-left: 10px;">Book No.<asp:Label ID="lblBookNo" runat="server"></asp:Label></td>
                                    <td style="text-align: right; padding-right: 10px;">Permit No.<asp:Label ID="lblPermitNo" runat="server"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="height: 880px;">
                        <table style="width: 100%; font-family: Arial; text-align: center; font-size: 14px; line-height: 24px;">
                            <tbody>
                                <tr>
                                    <td style="font-size: 22px; padding: 20px 10px; font-weight:bold;">Ramnagar Forest Division U.P.</td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify; padding: 0 10px;"><p>Permit issued under rules made under section 32 sub-section(1) Clause (i) and section 32 sud - section (i) of the Indian Forest Act [1927 as notified G.O. No. 39/XIV-296, dated the 21st October 1938.</p>

	<p style="text-indent:50px;">(1) In consideration of payment of Rs...........Permission is hereby granted to............accompanied by ................ elephants and ......................................retainers of followers or fish with road line/nots of mesh not less then 1<small>1/2"</small> in the ................River of</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table style="width: 100%; font-family: Arial; text-align: center; font-size: 14px; line-height: 24px;">
                            <tbody>
                                <tr>
                                    <td style="font-size: 22px; padding: 20px 10px; font-weight:bold;">RAMNAGAR FOREST DIVISION</td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify; padding: 0 10px;"><p>Subject to the conditions noted on the reverse.</p>

	<p style="text-indent:50px;">(Netting small fish for bait is permitted/NOT permitted) (2) The Permit is to be returned to the Ramnagar forest officer, Ramnagar
	<br />N.B. - Forest rest house compounds are not camping grounds.</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <table style="width: 100%; font-family: Arial; font-size: 14px; line-height: 24px;">
                            <tbody>

                                <tr>
                                    <td colspan="2" style="text-align: justify; padding: 0 10px;">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1"></td>
                                    <td style="font-size: 18px; text-align: center;" class="auto-style2">
                                        <asp:Label ID="lblSignDirector" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 68%; text-align: justify; padding: 0 10px;">Dated........................<br />
                                        The..................2018
                                    </td>
                                    <td valign="bottom" style="font-size: 16px; text-align: center;">Divisional Forest Officer<br />
                                        Ramnagar Forest Division<br />
                                       Ramnagar (Nainital)</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center;"><p style="text-indent:50px;">Copy forwarded to Range Officer.....................Range for information and necessary action.s</p></td>
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
