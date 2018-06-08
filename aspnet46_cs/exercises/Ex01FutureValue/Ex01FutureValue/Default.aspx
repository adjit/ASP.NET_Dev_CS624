<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch01FutureValue.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 1: Future Value</title>
    <style type="text/css">
        .style1 {
            width: 150px;
            height: 65px;
        }
        .style2 {
            width: 100%;
        }
        .style3 {
            width: 140px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img alt="Murach" class="style1" src="Images/MurachLogo.jpg"  /><br />
        <h1>401K Future Value Calculator</h1>
        <table class="style2">
            <tr>
                <td class="style3">Monthly investment</td>
                <td><asp:DropDownList ID="ddlMonthlyInvestment"
                    runat="server" Width="106px"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="style3">Annual interest rate</td>
                <td><asp:TextBox ID="txtInterestRate" runat="server"
                        Width="100px" TextMode="Number">3.0</asp:TextBox></td>
            </tr>
            <tr>
                <td class="style3">Number of years</td>
                <td><asp:TextBox ID="txtYears" runat="server"
                        Width="100px" TextMode="Number">10</asp:TextBox></td>
            </tr>
            <tr>
                <td class="style3">Future value</td>
                <td><asp:Label ID="lblFutureValue" runat="server"
                        Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td class="style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style3"><asp:Button ID="btnCalculate" runat="server"
                                       Text="Calculate" Width="100px" 
                        OnClick="btnCalculate_Click" /></td>
                <td><asp:Button ID="btnClear" runat="server"
                        Text="Clear" Width="100px" OnClick="btnClear_Click" CausesValidation="False" /></td>
            </tr>
        </table><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Interest rate is required." 
            ControlToValidate="txtInterestRate" Display="Dynamic" ForeColor="Red">
        </asp:RequiredFieldValidator>&nbsp;
        <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ControlToValidate="txtInterestRate" Display="Dynamic" 
            ErrorMessage="Interest rate must range from 1 to 20." MaximumValue="20" 
            MinimumValue="1" Type="Double" ForeColor="Red">
        </asp:RangeValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtYears" Display="Dynamic" 
            ErrorMessage="Number of years is required." ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" 
            ControlToValidate="txtYears" Display="Dynamic" 
            ErrorMessage="Years must range from 1 to 45." MaximumValue="45" 
            MinimumValue="1" Type="Integer" ForeColor="Red">
        </asp:RangeValidator>
    </div>
    </form>
</body>
</html>
