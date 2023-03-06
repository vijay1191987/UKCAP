<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="CitizenPortal.WebAppUK.BirthCertificate.Certificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery-ui-1.11.4.min.js"></script>
    <script src="../../../Scripts/angular.min.js" type="text/javascript"></script>
       <script src="../../PortalScripts/ServiceLanguage.js"></script>

           <script type="text/javascript">
        function ChangeLanguage(p_Lang) {
            debugger;

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

</head>
<body>

    <form id="form1" runat="server">
        <div id="intrnlContent" ng-app="appmodule">
            <div ng-controller="ctrl">
                <div style="text-align: center; margin: 0 auto;">
                    <table align="center" style="width: 750px; border: 4px solid #000; padding: 15px;">
                        <tr>
                            <td>
                                <table style="width: 700px; border: 2px solid #212121; font-family: Arial, Helvetica, sans-serif; background-image: url(../img/certificate_logo_bg.png); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                                    <tr>
                                        <td colspan="1" style="padding: 8px 0; text-align: left;"><span style="font-size: 15px; padding: 15px;">S.NO 434369</span></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="width: 108px; text-align: left; padding: 0 8px;">
                                            <img src="../img/uttarakhand_state_logo.png" style="width: 75px;" /></td>
                                        <td style="text-align: center; width: 429px; height: 32px;"><span style="font-size: 24px; padding-bottom: 10px;">GOVERNMENT OF UTTARAKHAND</span>
                                            <span style="margin-top: 20px;">{{resourcesData.lblDMA}}</span></td>
                                        <td style="width: 94px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td style="text-align: center;"><span style="font-size: 20px; font-weight: bold;">BIRTH CERTIFICATE</span></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="padding: 8px; text-align: justify; font-size: 14px;">({{resourcesData.lblIUs}}
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                           {{resourcesData.lblofregistration}})</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="padding: 8px; text-align: justify; font-size: 14px;">{{resourcesData.lblThisiscerified}}<asp:Label ID="lblBirth" runat="server"></asp:Label>
                                           {{resourcesData.lbluttrajhandnagar}}<asp:Label ID="lblUttarkhandZone" runat="server"></asp:Label>
                                            {{resourcesData.lblzone}}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblname}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label2" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblAppGender}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label3" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblAppDOB}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label4" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblplaceofbirth}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label5" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblDateofRegistration}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label6" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblRegistrationNo}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label7" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblfathername}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label9" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblAppMotherName}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label8" runat="server"></asp:Label></td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">{{resourcesData.lblpresentAddress}}</td>
                                        <td colspan="2" style="padding: 8px; text-align: left;">
                                            <asp:Label ID="Label10" runat="server"></asp:Label></td>
                                    </tr>
                                    <%-- <tr>
                                <td style="padding: 15px; font-size: 13px; text-align:left;">Permanent Address</td>
                                <td colspan="2" style="padding: 8px; text-align:left;"><asp:Label ID="Label11" runat="server"></asp:Label></td>
                            </tr>--%>
                                    <tr>
                                        <td style="padding: 15px; text-align: left;">&nbsp;</td>

                                        <td style="padding: 8px; text-align: right; font-size: 14px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0 15px; text-align: left;">
                                            <asp:Label ID="Label13" runat="server"></asp:Label></td>
                                        <td colspan="2" style="padding: 8px; text-align: right; font-size: 14px;">{{resourcesData.lblsubregister}}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0 15px; font-size: 13px; border-bottom: 1px solid #000; text-align: left;">{{resourcesData.lblDateofissue}}</td>
                                        <td colspan="2" style="padding: 8px; font-size: 13px; text-align: right; border-bottom: 1px solid #000;">Seal &amp; {{resourcesData.AddressoftheIssuingAuthority}}</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 15px; font-size: 13px; text-align: left;">English Version</td>
                                        <td colspan="2" style="padding: 8px; font-size: 13px; text-align: right;">{{resourcesData.lbleverydeathandbirth}}</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
         <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    </form>
   
</body>

</html>
