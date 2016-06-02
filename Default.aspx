<%@ Page Title="Business Licensing Homepage" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" language="javascript">
        function RefreshImage(valImageId) {
            var objImage = document.getElementById(valImageId)
            if (objImage == undefined) {
                return;
            }
            var now = new Date();
            objImage.src = objImage.src.split('?')[0] + '?x=' + now.toUTCString();
        }
    </script>

    <script type="text/JavaScript">

        function getFrameContents() {
            alert("Hi");
            var iframe = document.getElementById('iframe1');
            var theHtml = iframe.contentWindow.document.body.innerHTML;
            alert(theHtml);
        }
</script>
    

    <style type="text/css">      
        
        
        
        .auto-style1 {
            font-size: medium;
        }
        
        
        
        .auto-style2 {
            text-decoration: underline;
        }
        .auto-style3 {
            font-size: 11pt;
        }
        
        
        
        .auto-style4 {
            font-size: small;
        }
        
        
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >

    <div style="padding-left:50px;padding-right:50px;">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate >

            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>    
        <strong><span class="auto-style1" >Welcome!</span></strong>
    
            <asp:Panel ID="Panel2" runat="server" >
                
            <br />
            <span ><span class="auto-style3">After two decades of rapid growth, the City of Hayden has changed from a small rural community into a city of nearly 14,000 people with a wide variety of commercial and industrial business activities. As a result of this growth, there is a need to better understand the City&#39;s business base for a variety of purposes, including, but not limited to: emergency response, infrastructure needs, enhancing economic development opportunities to attract more high quality jobs, and for other similar purposes. To address this need, the City Council has adopted a business licensing program and businesses are required to be licensed with the City.&nbsp;
                <br />
                <br />
                <span class="auto-style2">Who this applies to</span>:&nbsp;
                <br />
                All persons and entities that are engaged in business activities within Hayden city limits, including those coming inside the city to perform work, sales, or services. The licensing requirement also applies to in-home businesses.
                <br />
                <br />
                For more information, please contact us at (208) 209-2022 or <a  style="color:navy" href="mailto:businesslicensing@cityofhaydenid.us" target="_top">businesslicensing@cityofhaydenid.us</a>.</span>
            <br />
            <br />
            <a style="color:navy" href="pdfs/Business%20License%20FAQs.pdf" target="_blank"><span class="auto-style4"><strong>*Link*</strong></span></a><span class="auto-style4"> &nbsp;- Frequently Asked Questions<br /> <a href="pdfs/Business%20License%20Ordinance.pdf" style="color:navy" target="_blank"><strong>*Link*</strong></a> &nbsp;- Business License Ordinance</span><br /> 
            <br />
            Clicking on the link for each of the actions below will display the information input form and action button for taking you to the next step in the process.</span><br /> </span><br />
            </asp:Panel>   
            


                    <strong>
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="#000099" OnClick="LinkButton2_Click" Font-Size="Medium">Businesses contacted by letter</asp:LinkButton>
                    <br />
                    </strong>
                
                    <font size="2">If you have recieved a letter from the City of Hayden with your Temporary Business ID and PIN number,<br /> please enter those numbers in the boxes below to proceed to the next step in the licensing process.</font><br /> &nbsp;
                
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" Visible="false">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" ><strong>Temp BusinessID</strong></td>
                                <td align="center" ><strong>PIN</strong></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtBusinessID" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBusinesPIN" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnBeginRegistration" runat="server" onclick="btnBeginRegistration_Click" Text="Begin Registration" />
                                </td>
                                <td>
                                    <asp:Label ID="lblError" runat="server" style="color: #FF0000; font-size: small" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                        &nbsp;&nbsp;&nbsp;
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <hr />
                
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#000099" OnClick="LinkButton1_Click" >New Businesses</asp:LinkButton>
                
                
                    <br />
                
                
                    <font size="2">If you have not yet contacted the City of Hayden regarding a Business License Application,<br /> but would like to begin the Application process, please create a new Business Contact record,<br /> and then proceed with completing the License Application pages.</font><br /> 
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <br />
                    <asp:Button ID="btnCreateBusinessContact" runat="server" OnClick="btnCreateBusinessContact_Click" Text="Create Business Contact record" />
                    <br />
                    </asp:Panel>
                    
                <br />
                
                <hr />
                
                    <strong>
                    <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="#000099" Font-Size="Medium" OnClick="LinkButton4_Click">Businesses Renewing their License</asp:LinkButton>
                    <br />
                    </strong>
                
                    <font size="2">Business Licenses expire on December 1st, and should be renewed on or before December 1st for the next year.<br />If you are renewing your license, please enter your enter your PIN Number and your most recent Business License Number below,
                    <br />
                    and click the Renewal License button below to update your license information and make payment arrangements.</font><br /> <br />
                
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" Visible="false">
                        <ContentTemplate>
                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" style="font-size: 9pt; font-weight: 700" Text="PIN Number"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" style="font-size: 9pt; font-weight: 700" Text="Business License Number"></asp:Label>
                            <br />
                            &nbsp;<asp:TextBox ID="txtRenewBusinessPIN" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtRenewBusinessLicenseNumber" runat="server" Width="160px"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnRenewLicense" runat="server" Text="Renew License" OnClick="btnRenewLicense_Click" />
                            <asp:Label ID="lblError4" runat="server" style="color: #FF0000; font-size: small" Text=""></asp:Label>
                            <br />
                            <br />
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                
                        
                <asp:Panel ID="pnlUpdateAppBLInfo" runat="server">
                <hr />                    
                    <br />
                    <strong>
                    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="#000099" Font-Size="Medium" 
                        OnClick="LinkButton3_Click">Update Application or Business License Information</asp:LinkButton>
                    <br />
                    </strong>
                
                    <font size="2">If you need to update your application information, or if you have updated information for your Business License,
                        <br /> click on the link above to enter your PIN, your Business ID (for application updates) or your Business License Number (for license updates)
                        <br /> and click the Update Information button to take you to the record(s) to update:

                    </font>
                    <br /> &nbsp;
                    
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" Visible="false">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" class="style2"><strong>PIN Number</strong></td>
                                <td align="center" class="style2"><strong>Business ID</strong></td>
                                <td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Business License Number</strong></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtUpdatePIN" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUpdateAPPID" runat="server"></asp:TextBox>
                                    &nbsp; </td>
                                <td>OR
                                    <asp:TextBox ID="txtUpdateLicenseNumber" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnUpdateAppLicense" runat="server" OnClick="btnUpdateAppLicense_Click" Text="Update Information" />
                                </td>
                                <td>
                                    <asp:Label ID="lblError3" runat="server" style="color: #FF0000; font-size: small" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                        
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <br />
                </asp:Panel>
                
                </ContentTemplate>
            </asp:UpdatePanel>
                    <hr />
                    
                        I<font size="2">f you did not receive a licensing letter or if you would like to make your application in person or via an alternate method, please contact the City at:<br />
            <br />
            Department of Community and Economic Development<br /> 8930 N. Government Way<br /> Hayden, Idaho&nbsp; 83835<br /> (208) 209-2022</font><br />
                    
                        <span class="style3"></span><a href="mailto:businesslicensing@cityofhaydenid.us">businesslicensing@cityofhaydenid.us</a><br />
                    
                    

        </ContentTemplate>
</asp:UpdatePanel>

</div>

</asp:Content>

