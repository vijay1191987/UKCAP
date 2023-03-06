<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="ServerReport.aspx.cs" Inherits="CitizenPortal.WebApp.MIS.ServerReport" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="rptViewer" runat="server" Width="100%" Height="700px">
</rsweb:ReportViewer>
</asp:Content>
