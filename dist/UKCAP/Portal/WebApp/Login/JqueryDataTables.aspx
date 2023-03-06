<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JqueryDataTables.aspx.cs" Inherits="CitizenPortal.WebApp.Login.JqueryDataTables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>

    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript">

        $(document).ready(function () {
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Login/MasterDataTable.aspx/GetDataFromDB',
                data: '{}',
                //processData: false,
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
                        $('#DataGridView').DataTable({
                            "processing" : true,
                            "ServerSide": true,
                            "bDestroy": true,
                            "bScrollCollapse": true,
                            //"bJQueryUI": true,
                            "bPaginate": true,
                            //"sScrollY": "400px",
                            "bInfo": true,
                            "bFilter": true,
                            "bSort": true,
                            "aaData": rowDataSet,
                            "aoColumns": dynamicColumns,
                        });
                        //$('#DataGridView').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                    }
                }
            });
        });

    </script>

    <style>
        .CscDataGrid table {
            border: 1px solid #ddd;
            font-family: Calibri;
        }

            .CscDataGrid table tr:nth-child(even) {
                background-color: #fef6b7;
            }

            .CscDataGrid table tr:nth-child(odd) {
                background-color: #d6ebf3;
            }

            .CscDataGrid table td, th {
                border: 1px solid #ddd;
            }

        .fg-toolbar {
            background-color: #000000 !important;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div>
            <asp:GridView ID="DataGridView" Font-Names="Calibri" Font-Size="11pt" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server">
                <%--<Columns>
                <asp:BoundField DataField="District Name" HeaderText="District Name" />
                <asp:BoundField DataField="Block Name" HeaderText="Block Name" />
                <asp:BoundField DataField="Grampanchayat Name" HeaderText="Grampanchayat Name" />
                <asp:BoundField DataField="CSC ID" HeaderText="CSC ID" />
                <asp:BoundField DataField="CSC Name" HeaderText="CSC Name" />
                <asp:BoundField DataField="Contact No" HeaderText="Contact No" />
            </Columns>--%>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
