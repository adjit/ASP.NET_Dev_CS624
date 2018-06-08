<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ex03FutureValue.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 3: Future Value</title>
</head>
<body>
    <header>
        <img id="logo" alt="Murach Logo" src="Images/MurachLogo.jpg" />
    </header>
    <main>
        <h1>401K Future Value Calculator</h1>
        <form id="form1" runat="server">
            <label for="ddlMonthlyInvestment">Monthly Investment:</label>
            <asp:DropDownList ID="ddlMonthlyInvestment" runat="server"></asp:DropDownList ><br />
            <label for="txtInterestRate">Annual interest rate:</label>
            <asp:TextBox ID="txtInterestRate" runat="server">3.0</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" 
					ErrorMessage="Interest rate is required." 
                    ControlToValidate="txtInterestRate" 
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="txtInterestRate" Display="Dynamic" 
                    ErrorMessage="Interest rate must range from 1 to 20." 
                    MaximumValue="20" MinimumValue="1" Type="Double">
                </asp:RangeValidator><br />
            <label for="txtYears">Number of years:</label>
            <asp:TextBox ID="txtYears" runat="server">10</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" 
					ControlToValidate="txtYears" Display="Dynamic" 
                    ErrorMessage="Number of years is required.">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                    ControlToValidate="txtYears" 
                    Display="Dynamic" 
                    ErrorMessage="Years must range from 1 to 45." 
                    MaximumValue="45" MinimumValue="1" Type="Integer">
                </asp:RangeValidator><br />
            <label for="lblFutureValue">Future Value:</label>
            <asp:Label ID="lblFutureValue" runat="server"></asp:Label><br />
            <asp:Button ID="btnCalculate" runat="server" Text="Calculate" 
                onclick="btnCalculate_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" 
                onclick="btnClear_Click" 
                CausesValidation="False" />
        </form>
    </main>
</body>
</html>
