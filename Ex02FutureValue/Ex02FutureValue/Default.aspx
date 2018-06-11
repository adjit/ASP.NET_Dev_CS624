<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ex02FutureValue.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 2 Future Value</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 335px;
            margin-left: 40px;
        }
        #Select1 {
            width: 264px;
        }
    </style>
</head>
<body>
    <img alt="Murach Logo" src="Images/MurachLogo.jpg" />
    <h1>401K Future Value Calculator</h1>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Monthly Investment</td>
                    <td>
                        <asp:DropDownList ID="MonthlyInvestment" runat="server" Width="145px" EnableViewState="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Annual Interest Rate</td>
                    <td>
                        <asp:TextBox ID="txtInterestRate" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Number of Years</td>
                    <td>
                        <asp:TextBox ID="txtYears" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Future Value</td>
                    <td>
                        <asp:Label ID="lblFutureValue" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnCalculate" runat="server" OnClick="btnCalculate_Click" Text="Calculate" />
                    </td>
                    <td>
                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" OnClick="btnClear_Click" Text="Clear" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInterest" runat="server" ControlToValidate="txtInterestRate" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Interest Rate is Required.</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidatorInterest" runat="server" ControlToValidate="txtInterestRate" Display="Dynamic" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="20" MinimumValue="1" Type="Double">Interest Rate must range from 1 to 20.</asp:RangeValidator>
        <p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorYears" runat="server" ControlToValidate="txtYears" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Number of years is required.</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidatorYears" runat="server" ControlToValidate="txtYears" Display="Dynamic" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="45" MinimumValue="1" Type="Double">Years must range from 1 to 45.</asp:RangeValidator>
        </p>
    </form>
</body>
</html>
