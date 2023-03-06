<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="MISReport2.aspx.cs" Inherits="CitizenPortal.WebApp.MIS.MISReport2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .abc
        {
            overflow: hidden;
        }
        a:link
        {
            color: blue;
        }
        /* default link */
        a:visited
        {
            color: blue;
        }
        /* link that you already visited */
        a:active
        {
            color: blue;
        }
        /* active link */
        
        .h
        {
            display: none;
            width: 100%;
            white-space: nowrap;
        }
        .tdRT
        {
            text-align: right;
        }
        .tdLT
        {
            text-align: left;
        }        a:hover
        {
            color: blue;
        }

    </style>
    <script language="javascript" type="text/javascript">
        function SetValue(s, e) {
            document.getElementById('HiddenField1').value = "Y";
            return true;
        }
        function DrillDown(p_Code, p_Value) {
            var t_Level = document.getElementById('HFLevel').value;
            var t_Code = "";
            var t_Value = "";

            t_Code = document.getElementById('HFPathCode').value;
            t_Value = document.getElementById('HFPathValue').value;

            if (t_Level != "") {
                t_Level = parseInt(t_Level);
            }

            if (t_Code != "" && t_Value != "") {
                t_Code = t_Code + "^" + p_Code;
                t_Value = t_Value + "^" + p_Value;
            }
            else {
                t_Code = p_Code;
                t_Value = p_Value;
            }

            document.getElementById('HFPathCode').value = t_Code;
            document.getElementById('HFPathValue').value = t_Value;

            t_Level = t_Level + 1;

            document.getElementById('HFLevel').value = t_Level;

            document.forms[0].submit();
            return true;
        }
        function Navigate(p_Code, p_Level) {
            var t_Level = "";
            var t_Code = "";
            var t_Value = "";
            var t_CodeArr, t_ValueArr;
            var t_NewCode, t_NewValue = "";
            var t_NewLevel = 1;
            var t_Separator = "^";

            t_Level = document.getElementById('HFLevel').value;
            t_Code = document.getElementById('HFPathCode').value;
            t_Value = document.getElementById('HFPathValue').value;

            if (t_Level != "") {
                t_Level = parseInt(t_Level);
            }

            if (p_Code == "-" || p_Level == "-") {
                t_Code = "";
                t_Value = "";
                t_Level = 1;
            }
            else {
                t_CodeArr = t_Code.split(t_Separator);
                t_ValueArr = t_Value.split(t_Separator);

                for (var i = 0; i < t_CodeArr.length - 1; i++) {
                    if (i == 0) {
                        t_NewCode = t_CodeArr[i];
                        t_NewValue = t_ValueArr[i];
                    }
                    else {
                        t_NewCode = t_NewCode + "^" + t_CodeArr[i];
                        t_NewValue = t_NewValue + "^" + t_ValueArr[i];
                    }
                    t_NewLevel++;
                }
            }

            document.getElementById('HFPathCode').value = t_NewCode;
            document.getElementById('HFPathValue').value = t_NewValue;
            document.getElementById('HFLevel').value = t_NewLevel;

            document.forms[0].submit();
            return true;
        }
        function SetValues() {
            //document.getElementById('HFSearch').value = 'Y';            
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>--%>
    <div class="wrapper">
        <div class="form-wrapper">
            <table style="width: 100%">
                <tr>
                    <td align="center" width="50px">
                        <a href="../HOME/Menu.aspx">
                            <img alt="Home" src="../Images/btnHome.png" width="25px" /></a>
                    </td>
                    <td width="50px">
                        <asp:ImageButton ID="btnExportXLS" runat="server" ImageUrl="~/Images/exportxls.png"
                            Width="25px" alt="Export to Excel" ToolTip="Export to Excel" />
                    </td>
                    <td align="center">
                        <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                            Style="font-family: Arial, Helvetica, sans-serif; font-size: large"></asp:Label>
                        <br />
                        <asp:Label ID="lblAddTitle" runat="server" Style="font-family: Arial, Helvetica, sans-serif;
                            font-size: large"></asp:Label>
                    </td>
                    <td width="50px">
                        &nbsp;
                    </td>
                    <td width="50px">
                        &nbsp;
                    </td>
                </tr>
            </table>
            <div class="popup">
                <table cellspacing="0" align="center">
                    <tbody class="wrapper-border">
                        <tr class="wrapper-border">
                            <td class="top-left bordercommon">
                            </td>
                            <td class="top-middle bordercommon">
                            </td>
                            <td class="top-right bordercommon">
                            </td>
                        </tr>
                        <tr class="wrapper-border">
                            <td class="left-middle bordercommon">
                            </td>
                            <td align="center" class="middle-middle">
                                <asp:Panel ID="paneldate" runat="server" CssClass="abc">
                                    <fieldset>
                                        <legend class="field-lable">Filter : </legend>
                                        <table width="100%" cellpadding="0" cellspacing="10" border="0" align="center">
                                            <tr>
                                                <td>
                                                    <table align="center" style="font-family: arial, Helvetica, sans-serif; font-size: 12px">
                                                        <tr>
                                                            <td>
                                                                <div id="divDate" runat="server">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td width="20px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="center" width="20px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                Select Duration
                                                                            </td>
                                                                            <td width="20px">
                                                                                :
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddlDuration" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDuration_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                    <asp:ListItem Value="1">Day</asp:ListItem>
                                                                                    <asp:ListItem Value="2">Week</asp:ListItem>
                                                                                    <asp:ListItem Value="3">FortNight</asp:ListItem>
                                                                                    <asp:ListItem Value="4">Month</asp:ListItem>
                                                                                    <asp:ListItem Value="5">Quarter</asp:ListItem>
                                                                                    <asp:ListItem Value="6">Half Year</asp:ListItem>
                                                                                    <asp:ListItem Value="7">Year</asp:ListItem>
                                                                                    <asp:ListItem Value="8">Custom</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                Select Date
                                                                            </td>
                                                                            <td align="center" width="20px">
                                                                                :
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox ID="txtDate" runat="server" AutoPostBack="True" Enabled="False" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                                                                                <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate" />--%>
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td width="20px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="center" width="20px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left" width="100px">
                                                                                <asp:Button ID="btnFilter" runat="server" OnClick="btnFilter_Click" OnClientClick="return SetValues();"
                                                                                    Text="Apply Filter" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <asp:Label ID="CO8_lbl_fullNameE" runat="server" Text="From Date"></asp:Label>
                                                                            </td>
                                                                            <td width="20px">
                                                                                :
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox ID="txtFrmDate" runat="server" Enabled="False"></asp:TextBox>
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:Label ID="lbltodate" runat="server" Text="To Date"></asp:Label>
                                                                            </td>
                                                                            <td align="center" width="20px">
                                                                                :
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox ID="txtToDate" runat="server" Enabled="False"></asp:TextBox>
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td width="20px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="center" width="20px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left" width="50px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="left">
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:HiddenField ID="HFPathCode" runat="server" ClientIDMode="Static" />
                                                    <asp:HiddenField ID="HFPathValue" runat="server" ClientIDMode="Static" />
                                                    <asp:HiddenField ID="HFLevel" runat="server" ClientIDMode="Static" />
                                                    <asp:HiddenField ID="HFSearch" runat="server" ClientIDMode="Static" />
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </asp:Panel>
                                <fieldset id="fldChart" runat="server">
                                    <legend class="field-lable">Report : </legend>
                                    <table width="99%">
                                        <tr>
                                            <td align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblReportTitle" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <div style="float: left; width: 700px;">
                                                    <asp:Panel ID="pnlLinks" runat="server">
                                                    </asp:Panel>
                                                </div>
                                                <div style="float: right; white-space: nowrap; vertical-align: top">
                                                    <span style="font-size: 15px">Page Size : </span>
                                                    <asp:DropDownList ID="ddlPaging" runat="server">
                                                        <asp:ListItem>10</asp:ListItem>
                                                        <asp:ListItem>20</asp:ListItem>
                                                        <asp:ListItem Selected="True">50</asp:ListItem>
                                                        <asp:ListItem>100</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Panel ID="pnlCharts" runat="server" Style="padding: 10px">
                                    </asp:Panel>
                                    <asp:Panel ID="pnlGrid" runat="server" Style="padding: 10px">
                                    </asp:Panel>
                                </fieldset>
                            </td>
                            <td class="right-middle bordercommon">
                            </td>
                        </tr>
                        <tr class="wrapper-border bordercommon">
                            <td class="bottom-left bordercommon">
                            </td>
                            <td class="bottom-middle bordercommon">
                            </td>
                            <td class="bottom-right bordercommon">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
