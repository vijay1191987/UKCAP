<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKCommon.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.Register" %>

<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script type="text/javascript">

        function fnRedirectProfile(regType)
        {
            var rtnurl;
            var KF = $('#ContentPlaceHolder1_HFCPDetail').val();
            var qs = getQueryStrings();
            if (qs["UserID"] != null && qs["UserID"] != "")
            {
                var UserID = qs["UserID"];
            }
            if (regType == 'UID')
            {
                alertPopup("Aadhaar Registration!!!", "<BR> Aadhaar Based Profile Creation Is Not Avaliable!!!<BR> Please Try Manual Profile Creation Process!!!");
                //alert(regType);
                //rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                //window.location.href = rtnurl + "?UserID=" + UserID + "&SvcID=992";
                return false;
            }
            else
            {
                //alert(regType);
                rtnurl = "/WebApp/Citizen/Forms/CitizenProfile.aspx";
                //window.location.href = rtnurl + "?UID=" + UserID + "&SvcID=992";
                window.location.href = rtnurl + "?UID=" + UserID + "&SvcID=992" + "&KF=" + KF;
                //window.location.href = rtnurl + "?UID=" + UserID + "&SvcID=992" +"&From=CP&EmailID=" + EmailID + "&MobileNo="+ MobileNo + "&Name=" + Name ;
            }
        }
    </script>
    <style>
        .user_info {
            width: 100%;
            background-color: cornflowerblue;
            color: #fff;
            line-height: 22px;
            box-shadow: 2px 2px 12px rgba(0,0,0,0.4);
        }

            .user_info > tbody > tr > td, .user_info > tbody > tr > th, .user_info > tfoot > tr > td, .user_info > tfoot > tr > th, .user_info > thead > tr > td, .user_info > thead > tr > th {
                padding: 10px 15px;
                width: 25%;
            }

                .user_info > tbody > tr > td span {
                    font-size: 1.3em;
                }

        .auto-style1 {
            /*font-weight: bold;*/
            font-size: 1.3em;
        }
    </style>
    <link href="/WebApp/Citizen/Styles/usrreg.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="maindtl_container">
        <div class="row" style="width: 90%; margin: 0 auto;">
            <div class="box-container">
                <table class="user_info">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>&nbsp;:&nbsp;
                                    <asp:Label ID="lblName" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Login ID"></asp:Label>&nbsp;:&nbsp;
                                    <asp:Label ID="lblUserID" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Mobile No"></asp:Label>
                            &nbsp;:&nbsp;
                                    <asp:Label ID="lblMobile" runat="server" Text="" CssClass="auto-style1">></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Email ID"></asp:Label>&nbsp;:&nbsp;
                                    <asp:Label ID="lblEmail" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                        </td>
                    </tr>
                </table>
                <h1 style="font-weight: bolder;">Citizen Profile Creation</h1>
                <div class="col-lg-12 pleft0">
                    <div class="text-danger register-note">
                        <ul>
                            <li>Please take time to complete the profile to avail the services.</li>
                            <li>Information entered while creating the profile shall be used as basic information in all the services.</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-12 mtop15 mbtm10 pleft0">
                    <p><b class="ftcl_black" style="font-size: 19px !important;">Profile not completed. Please select below option to complete it</b></p>
                    <div class="col-lg-6 pleft0" onclick="fnRedirectProfile('UID');">
                        <a href="#">
                            <div class="reg_opt1">
                                <div class="icon">
                                    <img src="/WebApp/Citizen/Images/ekyc_opt1.png" />
                                </div>
                                <div class="txt">
                                    <h2 style="background-color: #D52736;">Create profile</h2>
                                    <p><b>using Aadhaar Number</b></p>
                                    <p>Your information will be fetched from Aadhaar Database after eKYC, and the profile shall be created based on Aadhaar data.</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-6 pright0" onclick="fnRedirectProfile('DOC');">
                        <a href="#">
                            <div class="reg_opt1">
                                <div class="icon">
                                    <img src="/WebApp/Citizen/Images/photo_icon_opt2.png" />
                                </div>
                                <div class="txt">
                                    <h2>Create profile</h2>
                                    <p><b>Manually</b></p>
                                    <p>Need to enter the information manually (personal details, photo, address etc).</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <asp:HiddenField ID="HFCPDetail" runat="server" />
</asp:Content>