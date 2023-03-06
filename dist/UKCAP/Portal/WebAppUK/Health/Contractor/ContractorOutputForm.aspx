<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractorOutputForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.Health.Contractor.ContractorOutputForm" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contractor Output</title>
    <script type="text/javascript">
        function CallPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 42px;
        }
        .auto-style2 {
            float: right;
            height: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint">
            <div style="width: 950px; border: 3px solid #000; padding: 3px; font-family: Arial; margin: 0 auto;">
                <table cellpadding="0" cellspacing="0" style="width: 100%; font-size: 14px; padding: 0; margin: 0 auto;">
                    <tbody>
                        <tr>
                            <td colspan="2" style="text-align:center; font-size: 20px; font-weight:bold; padding: 15px 5px;">
                                &nbsp;<table style="width: 100%; font-family: Arial; text-align: center; font-size: 13px; border-bottom-style: solid;">
                            <tbody>
                                
                                            <tr>
                                                <td style="width: 80%; padding-left: 100px;">
                                                    &nbsp;
                                                    <h2 style="margin-bottom: 4px;">कार्यालय महानिर्देशक,चिकित्सा स्वास्थ्य एवम परिवार कल्याण, उत्तराखंड,</h2>
                                                    <h2 style="margin: 0px auto;">
                                                        <asp:Label runat="server" ID="lblTaluka"
                                     style="font-weight: 700" ></asp:Label>
                       
                                                    </h2>
                                                </td>
                                                <td style="width: 20%">
                                                    <uc1:qrcode runat="server" ID="QRCode1" />
                                                </td>
                                                </tr>
                                </tbody>
                            </table>
                            </td>
                            
                             </tr>
                        <tr>
                            <td style="padding: 5px;" class="auto-style1">पत्र संख्या : <asp:Label runat="server" ID="lblappid" style="font-weight: 700" ></asp:Label></td>
                            <td style="padding: 5px;" class="auto-style2">दिनाक : <asp:Label runat="server" ID="lbldate" style="font-weight: 700" ></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="padding: 5px; vertical-align:top; line-height:28px;">प्रमाणित किया जाता है कि श्री/मैं  <asp:Label runat="server" ID="lblname" style="font-weight: 700" ></asp:Label>  को अधिकतम सीमा 10 लाख तक इस महानिर्देशालय के अधीनस्थ कार्यालयो में  <asp:Label runat="server" ID="lblcivil" style="font-weight: 700" ></asp:Label>  के अनुरक्षण एवं रखरखाव कार्यो की अधिप्राप्ति हेतु उत्तराखंड अधिप्राप्ति नियमवाली,2017 के अध्याय-1 के नियम-24(1) में उल्लिखित प्रक्रिया के आधार पर विश्वसनीय सामग्री की अधिप्राप्ति के लिये श्रोतो को स्थापित करने हेतु निर्धारित शर्तो के आधीन निर्गत होने की तिथि से 01 वर्ष तक के लिये पंचीकरण किया जाता है |
                                <br />
                                पंचीकरण की शर्ते:-
                                <ol>
                                    <li>कार्य असंतोषजनक पाये जाने पर पंचीकरण कभी भी निरस्त किया जा सकता है |</li>
                                    <li>महानिर्देशालय के द्वारा समय-समय पर निर्गत की जाने वाली शर्ते ठेकेदार मानने हेतु बाध्य है |</li>
                                    <li>निर्माण कार्य उच्च गुणवत्ता, समय्बधता तथा मित्वयता के साथ पूरण न किये जाने की स्थिति में पंचीकरण निरस्त किया जा सकता है |</li>
                                    <li>पंचीकरण की अवधि समाप्त होने के पश्चात् पंचीकरण का नवनीकरण नहीं किया जायेगा, अपितु पुनः आवेदन करना होगा |</li>
                                    <li>पंचीकरण की वैधता अवधि समाप्त होने से पूर्व नियमानुसार पुन: आवेदन करना होगा |</li>
                                    <li>ठेकेदार द्वार दिये गये अभिलेखों में यदि कोई त्रुटी पायी जाती है तो उसका सम्पूर्ण उतरदायित्व सम्बंधित ठेकेदार का होगा, जिसके आधार पर सम्बंधित ठेकेदार का पंचीकरण निरस्त करते हुये भविष्य के लिये सम्बंधित ठेकेदार का नाम काली सूची में डाल दिया जायेगा |</li>
                                </ol>
                            </td>
                            <td style="float:right; padding: 5px;"><table cellpadding="0" cellspacing="0" style="width:120px; height:150px; border: 2px solid #999;">
                                <tbody>
                                    <tr>
                                        <td style="text-align:center;"><img id="ImgPhoto" runat="server" src="data:image/png;base64,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" name="ProfilePhoto" style="margin: 1px; width: 148px;" /></td>
                                    </tr>
                                </tbody>
                                                                   </table></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="font-size:16px; font-weight:bold; text-align:right; padding:5px;"> महानिर्देशक |</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="font-size:14px;  padding:5px;">
                                <h3 style="font-weight:bold;">पंचीकरण हेतु शर्ते</h3> 
                                <ol style="line-height:22px;">
                                    <li>हैसियत प्रमाण पत्र - <br />(क) सिविल कार्यो हेतु न्यूनतम रु0 0.50 लाख |<br />
                                                        (ख) विघुत कार्यो हेतु न्यूनतम रु0 1.00 लाख |
                                    </li>
                                    <li>जिला अधिकारी द्वारा निर्गत वैघ चरित्र प्रमाण पत्र (Character Certificate should not be dated over 6 months)</li>
                                    <li>आयकर पेन कार्ड |</li>
                                    <li>व्यापार कर का टिन नंबर/जीoएसoटीo नंबर |</li>
                                    <li>जमानत धनराशी को महानिर्देशक चिकित्सा स्वास्थ्य एवम परिवार कल्याण, देहरादून के नाम एफoडीoआरo / एनoएसoसीo बंधक हो | <br />
                                        (क) सिविल कार्यो हेतु रु0 5,000.00 मात्र |<br />
                                                        (ख) विघुत कार्यो हेतु रु0 20,000.00 मात्र |

                                    </li>
                                    <li>जिला पंचायत द्वारा ठेकेदारों हेतु निर्गत वैघ लाइसेंस |</li>
                                    <li>पंचीकरण हेतु आवेदन शुल्क रु0 500.00 मात्र|</li>
                                    <li>विघुत कार्यो के  पंचीकरण हेतु चीफ इलेक्ट्रिकल इंस्पेक्टर/ विघुत सुरक्षा निर्देशक द्वारा प्रदत्त केटेगरी 'ए' का वैघ लाइसेंस |</li>
                                    <li>पते से सम्बंधित प्रपत्र एवम नोटरी द्वारा सत्यापित कि ठेकेदार / फर्म को किसी भी विभाग द्वारा काली सूची में नहीं डाला गया है | तथा राज्य सरकार / केन्द्र सरकार का कोई बकाया शेष नहीं है |</li>
                                    <%--<li>पंचीकरण प्रमाण पत्र पर चस्पा किये जाने हेतु आवेदक की दो पासपोर्ट साइज़ फोटो जो नोटरी द्वारा सत्यापित हो |</li>--%>
                                    <li>गत वर्षो में चिकित्सा विभाग में किये गये कार्यो का सम्पूर्ण विवरण तथा कार्य संतोषजनक होने का प्रमाण पत्र जो सम्बंधित आहरण वितरण अधिकारी (drawing and disbursing officer) दुवार प्रदत्त हो | (पूर्व में पंचीकृत ठेकेदारो हेतु अनिवार्य) </li>
                                </ol>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
         <div style="text-align: center; margin: 10px auto;">
            <input type="button" id="btnSubmit" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; border-radius: 2px; padding: 8px; min-width: 120px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
