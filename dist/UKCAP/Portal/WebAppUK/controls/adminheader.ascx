<%@ Control Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="adminheader.ascx.cs" Inherits="CitizenPortal.WebAppUK.controls.adminheader" %>

<style>
    .user_img {
        border-radius: 200px;
        height: 100px;
        width: 100px;
    }

    .wlc_user {
        position: relative;
        /* bottom: 20px; */
        top: 20px;
        left: 5px;
        font-size: 20px;
        color: #fff;
    }
</style>
<script type="text/javascript">
    function ReturnSubmit() {
             <% if ((string)Session["UserType"] == "CITIZEN")
    {%>
        var qs = getQueryStrings();
        var uid = qs["UID"];
        window.location = '/WebAppUK/DashboardV3/Dashboard.aspx?UID=' + uid;
        <% } %>
             <% if ((string)Session["UserType"] == "KIOSK")
    {%>
        var id = <%=Session["Id"]%>
            window.location = '/WebApp/Kiosk/Forms/DashboardChart.aspx?UID=' + id;
                    <% } %>
    }
</script>
<script type="text/javascript">
    function getQueryStrings() {
        var assoc = {};
        var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
        var queryString = location.search.substring(1);
        var keyValues = queryString.split('&');

        for (var i in keyValues) {
            var key = keyValues[i].split('=');
            if (key.length > 1) {
                assoc[decode(key[0])] = decode(key[1]);
            }
        }
        return assoc;
    }
</script>
<nav class="navbar navbar-inverse navbar-fixed-top toppanel_box" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">
            <img src="/WebAppUK/DashboardV3/img/dashborad_logo.png" class="img-responsive" />
            <span>
                <asp:LinkButton runat="server" ID="btnDashboard" OnClick="btnDashboard_Click" CssClass="wlc_user">Uttarakhand Common Application Portal</asp:LinkButton></span>
        </a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">

        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user fa-fw"></i><span id="lblName" runat="server"></span><b class="fa fa-angle-down"></b></a>
            <ul class="dropdown-menu">

                <li>
                    <asp:LinkButton runat="server" ID="LinkButton3" OnClick="btnProfile_Click"><i class="fa fa-fw fa-user"></i>Edit Profile</asp:LinkButton></li>
                <li class="divider"></li>
                <li>
                    <asp:LinkButton runat="server" ID="LinkButton2" OnClick="btnChgPass_Click"><i class="fa fa-fw fa-cog"></i>Change Password</asp:LinkButton></li>
                <li class="divider"></li>
                <li>
                    <asp:LinkButton runat="server" ID="LinkButton1" OnClick="btnLogout_Click"><i class="fa fa-fw fa-power-off"></i>Logout</asp:LinkButton></li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav new_leftnav" style="background-color: #32468B; background-image: url('/WebAppUK/DashboardV3/img/leftpanel_bg.jpg'); background-repeat: no-repeat; background-size: cover;">
            <li class="userdtlbox text-center">
                <img src="/WebAppUK/DashboardV3/img/dummy_userpic.png" class="img-responsive user_img" id="userImg" runat="server" />
                <span class="wlcmemsg">Welcome</span> <span class="usernmetxt" id="lblUserName" runat="server"></span><span class="useremailid" id="lblEmailID" runat="server"><i class="fa fa-fw fa-envelope"></i></span></li>
            <li>
                <asp:LinkButton runat="server" ID="LinkButton4" OnClick="btnDashboard_Click"><i class="fa fa fa-bank fa-fw"></i>DEPARTMENT SERVICES</asp:LinkButton>
            </li>
            <%--<li>
                <a href="#" data-toggle="collapse" data-target="#submenu-1" class="" aria-expanded="true"><i class="fa fa-fw fa-dashboard"></i>DASHBOARD<i class="fa fa-fw fa-angle-down pull-right"></i></a>
                <ul id="submenu-1" class="collapse">

                </ul>
            </li>--%>
            <li>
                <asp:LinkButton runat="server" ID="btnTransDetail" OnClick="btnTransDetail_Click"><i class="fa fa-book fa-fw"></i>TRANSACTION DETAIL</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton runat="server" ID="btnProfile" OnClick="btnProfile_Click"><i class="fa fa-fw fa-user"></i>EDIT PROFILE</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton runat="server" ID="btnChgPass" OnClick="btnChgPass_Click"><i class="fa fa-fw fa-cog"></i>CHANGE PASSWORD</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton runat="server" ID="btnBriefcase" OnClick="btnBriefcase_Click"><i class="fa fa-briefcase fa-fw"></i>DOCUMENT BRIEFCASE</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton runat="server" ID="btnLogout" OnClick="btnLogout_Click"><i class="fa fa-fw fa-lock"></i>LOGOUT</asp:LinkButton>
            </li>
            <li style="color: #fff; padding-top: 40%; padding-left: 5%;">© All rights reserved CSC, SPVC.</li>
        </ul>
        <asp:HiddenField ID="HFServiceID" runat="server" />
        <asp:HiddenField ID="HFUID" runat="server" />
    </div>
    <!-- /.navbar-collapse -->
</nav>