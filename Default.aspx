<%@ Page Title="Business Licensing Homepage" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1 {
            font-size: medium;
        }
        .style2
        {
            font-size: 9pt;
        }
        .style3
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style1">
        &nbsp;<strong>Welcome</strong>
    </p>
    <p>
        &nbsp;If you have recieved a letter from the City of Hayden with your Business 
        License ID and PIN numbers, please provide those numbers in the 
        boxes below to begin the licensing process.
    </p>

    <table>
        <tr>
            <td class="style2" align="center"><strong>Business ID</strong></td>
            <td class="style2" align="center"><strong>PIN Number</strong></td>
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
                <asp:Button ID="Button1" runat="server" Text="Begin Registration" 
                    onclick="Button1_Click" />
            </td>
            <td>
                <asp:Label ID="lblError" runat="server" style="color: #FF0000; font-size: small" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    
    <p>
        &nbsp;</p>
    <p>
        If you did not receive a licensing letter or if you would like to make your 
        application in person or via an alternate method, please contact the City at:<br />
    </p>
    <p>
        <br />
        Department of Community and Economic Development<br />
        8930 N. Government Way<br />
        Hayden, Idaho&nbsp;
        83835<br />
        (208) 209-2022<br />
        <span class="style3"></span><a 
            href="mailto:businesslicensing@cityofhaydenid.us">businesslicensing@cityofhaydenid.us</a><br />
    </p>
    
<p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

</asp:Content>

