<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="customError.aspx.cs" Inherits="CitizenPortal.WebApp.customeError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pgntfdERR {
            background-color: #F0F8FF;
            padding: 115px;
            
        }

        .bdrrdus {
            border-radius: 100px;
            /* Firefox 1-3.6 */
            -moz-border-radius: 100px;
            /* Opera 10.5, IE 9, Safari 5, Chrome, Firefox 4, iOS 4, Android 2.1+ */
            border-radius: 100px;
        }

        .hidePanel {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="col-lg-12 talgncenter pgntfdERR">
            <%--<h3 class="bdrrdus" style="background-color: #5F9EA0; font-size: 50px; color: #fff; padding:10px 0 10px 0;">404. PAGE NOT FOUND</h3>--%>
            <p style="color: #000; letter-spacing: 0.1em;">As some error has occured while processing your request. Please try again.<span>
                <asp:LinkButton runat="server" ID="lnk_home" style="color: #338EE7 !important; font-weight:bold; text-decoration: underline;" OnClick="lnk_home_Click" >Home Page.</asp:LinkButton>
            <%--<a href="http://localhost:53056/g2c/forms/index.aspx" style="color: #338EE7 !important; font-weight:bold; text-decoration: underline;">Home Page.</a>--%>
            </span></p>
            <asp:Panel ID="pnlError" runat="server" CssClass="hidePanel" />
        </div>
    </div>
</asp:Content>
