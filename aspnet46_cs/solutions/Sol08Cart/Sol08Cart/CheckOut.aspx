<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Ch08Cart.CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch08: Shopping Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" defaultfocus="txtFirstName" class="form-horizontal">

            <h1>Check Out Page</h1>
            <h3>Please log in...</h3>

            <div class="form-group">
                <label class="control-label col-sm-2">First Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ErrorMessage="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Last Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-5">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ErrorMessage="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator> 
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="btn" 
                        OnClick="btnContinue_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn"
                        CausesValidation="False" PostBackUrl="~/Order.aspx" />
                </div>
            </div>
    
        </form>
    </main>
</div>
</body>
</html>
