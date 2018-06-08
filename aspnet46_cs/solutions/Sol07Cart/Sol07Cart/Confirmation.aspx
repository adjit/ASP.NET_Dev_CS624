<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Ch07Cart.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch07: Shopping Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.2.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server">
    
            <div class="form-group">
                <asp:TextBox ID="txtData" runat="server" TextMode="MultiLine" CssClass="form-control" 
                    Columns="50" Rows="25"></asp:TextBox>  
            </div>

            <div class="form-group">
                <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-default"
                    PostBackUrl="~/Order.aspx" Text="Continue Shopping" />
            </div>

        </form>
    </main>
</div>
</body>
</html>
