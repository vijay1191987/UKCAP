<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="MasterDataTable.aspx.cs" Inherits="CitizenPortal.WebApp.Login.MasterDataTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <link href="css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />

    <%--    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/scroller/1.4.2/js/dataTables.scroller.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/scroller/1.4.2/css/scroller.dataTables.min.css" />--%>

    <script type="text/javascript">

        $(document).ready(function () {
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Login/MasterDataTable.aspx/GetDataFromDB',
                data: '{}',
                processData: false,
                processData: true,
                async: true,
                dataType: "json",
                success: function (response) {
                    var item = $.parseJSON(response.d);

                    if (item != null && item.length > 0) {
                        //Get dynmmic column.
                        var dynamicColumns = [];
                        var i = 0;
                        $.each(item[0], function (key, value) {
                            var obj = { sTitle: key };
                            dynamicColumns[i] = obj;
                            i++;
                        });
                        //fetch all records from JSON result and make row data set.
                        var rowDataSet = [];
                        var i = 0;
                        $.each(item, function (key, value) {
                            var rowData = [];
                            var j = 0;
                            $.each(item[i], function (key, value) {
                                rowData[j] = value;
                                j++;
                            });
                            rowDataSet[i] = rowData;
                            i++;
                        });      //These are dynamically created columns present in JSON object.

                        //$("table[id$='DataGridView']").DataTable({
                        $("table[id$='DataGridView']").DataTable({
                            "processing": true,
                            "ServerSide": true,
                            "bDestroy": true,
                            "bScrollCollapse": true,
                            //"bJQueryUI": true,
                            "bPaginate": true,
                            "scrollY": 600,
                            "scroller": { loadingIndicator: true },
                            //"sScrollY": "400px",
                            "bInfo": true,
                            "bFilter": true,
                            "bSort": true,
                            "aaData": rowDataSet,
                            "aoColumns": dynamicColumns,
                        });
                        //DisplayDiv.style.display = "block";
                       
                        //var DisplayDiv = document.getElementById('cphbody_DisplayGrid');
                        //DisplayDiv.style.display = "block";
                        //$('#cphbody_DisplayGrid').show(500);
                        //$('#DataGridView').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                    }
                }
            });
        });

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1">
        <title></title>
    </head>
    <body>
        <div>
            <asp:GridView ID="DataGridView" Font-Names="Calibri" Font-Size="11pt" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server"></asp:GridView>
        </div>
    </body>
    </html>
</asp:Content>
