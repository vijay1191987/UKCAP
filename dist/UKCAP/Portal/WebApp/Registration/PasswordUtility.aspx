<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordUtility.aspx.cs" Inherits="CitizenPortal.WebApp.Registration.PasswordUtility" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="form-group">
            <label class="col-lg-4" for="rbtCitizen" id="Label4" runat="server">
                <asp:RadioButton ID="rbtCitizen" runat="server" GroupName="grpPass" />
                Citizen Master
            </label>
            <label class="col-lg-4" for="rbtDept" id="Label3" runat="server">
                <asp:RadioButton ID="rbtDept" runat="server" GroupName="grpPass" />
                Department Master
            </label>
            <label class="col-lg-4" for="rbtUser" id="Label1" runat="server">
                <asp:RadioButton ID="rbtUser" runat="server" GroupName="grpPass" />
                User Master
            </label>
             
        </div>
        <div>
            <asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_click" />
        </div>
        <div>
            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
