<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PGResponse.aspx.cs" Inherits="CitizenPortal.PG.PGResponse" %>

<%@ Import Namespace="CitizenPortalLib" %>
<%@ Import Namespace="CitizenPortalLib.BLL" %>
<%@ Import Namespace="CitizenPortalLib.DataStructs" %>
<%@ Import Namespace="CitizenPortal.Models" %>

<script runat="server">
    string t_URL = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string ServiceID = "";
        string AppID = "";
        string RefID = "";
        string TransDate = "";
        string Amount = "";
        string PMode = "";
        string PGName = "";
        decimal DecimalAmount = 00.0M;
        ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();
        string PGstatus = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Status"]));
        if (PGstatus == "E000")
        {

            ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
            AppID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["AppID"]));
            RefID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["TransID"]));
            TransDate = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Transdate"]));
            Amount = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["TransAmt"]));
            PMode = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PaymentMode"]));
            PGName = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PGName"]));
            DecimalAmount =Convert.ToDecimal(Amount);
        }
        else {

            ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
            AppID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["AppID"]));
            RefID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["TransID"]));
            TransDate = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Transdate"]));
            PMode = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PaymentMode"]));
            PGName = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PGName"]));

        }

        string Result = "";
        string[] AFields = {
                "ServiceID"
                , "AppID"
                ,"ReferenceNo"
                , "CreatedBy"
                , "BankResponseCode"
                , "PGName"
                , "PGStatus"
                , "Amount"
                , "ServiceTax"
               , "PortalFee"
               ,"Bank_TransDate"
                };

        PGAppResponse_DT ObjPGAppResponse_DT = new PGAppResponse_DT();
        ObjPGAppResponse_DT.AppID = AppID;
        ObjPGAppResponse_DT.ServiceID = ServiceID;
        ObjPGAppResponse_DT.ReferenceNo = RefID;
        ObjPGAppResponse_DT.PGName = PGName;
        ObjPGAppResponse_DT.BankResponseCode = PGstatus;
        ObjPGAppResponse_DT.CreatedBy = AppID;
        ObjPGAppResponse_DT.PGStatus = PGstatus;
        ObjPGAppResponse_DT.Amount = DecimalAmount;
        ObjPGAppResponse_DT.ServiceTax = 0.00M;
        ObjPGAppResponse_DT.PortalFee = 0.00M;
        ObjPGAppResponse_DT.Bank_TransDate = TransDate;
        Result = m_ConfirmPaymentBLL.PGAppResponseInsert(ObjPGAppResponse_DT, AFields);
        string URl = ConfigurationManager.AppSettings["SuccessUrl"].ToString();
        t_URL += URl+"?" + Request.QueryString.ToString();

        Response.Redirect(t_URL);

    }



</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
