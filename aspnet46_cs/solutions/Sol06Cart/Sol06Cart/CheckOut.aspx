<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Ch06Cart.CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch06: Shopping Cart</title>
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
        <form id="form1" runat="server" class="form-horizontal" 
            defaultfocus="txtEmail1" defaultbutton="btnCheckOut">
   
            <h1>Check Out Page</h1>
            <h3>Contact Information</h3>

            <div class="form-group">
                <label class="control-label col-sm-3">Email Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" 
                        ErrorMessage="Email is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmail1"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Email Re-entry:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" 
                        ErrorMessage="Email is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmail2"></asp:RequiredFieldValidator> 
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">First Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>  
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ErrorMessage="First name is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Last Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ErrorMessage="Last name is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Phone Number:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" 
                        ErrorMessage="Phone number is required." CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                </div>
            </div>        

            <h3>Billing Address</h3>
            <div class="form-group">
                <label class="control-label col-sm-3">Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" 
                        ErrorMessage="Street Address is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">City:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                        ErrorMessage="City is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">State:</label>
                <div class="col-sm-5">
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
                        DataTextField="StateName" DataValueField="StateCode">
                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                        SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateCode]">
                    </asp:SqlDataSource>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                        ErrorMessage="State is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="ddlState"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Zip code:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                        ErrorMessage="Zip is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                </div>
            </div>  

            <h3>Optional data</h3>
            <div class="form-group">
                <div class="col-sm-12">
                    <label>Please let me know about:</label>
                    <asp:CheckBoxList ID="cblAboutList" runat="server" RepeatColumns="2">
                        <asp:ListItem Value="New" Selected="True">New products</asp:ListItem>
                        <asp:ListItem Value="Special">Special offers</asp:ListItem>
                        <asp:ListItem Value="Revisions">New editions</asp:ListItem>
                        <asp:ListItem Value="Local">Local events</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <label>Please contact me via:</label>
                    <asp:RadioButtonList id="rblContactVia" runat="server" RepeatDirection="Horizontal">
                        <asp:listitem selected="true">Twitter</asp:listitem>
                        <asp:listitem>Facebook</asp:listitem>
                        <asp:listitem value="text">Text message</asp:listitem>
                        <asp:listitem>Email</asp:listitem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn"
                        CommandName="Confirm" OnCommand="SaveData" />
                    <asp:Button ID="btnSaveContinue" runat="server" Text="Save and Continue Shopping" CssClass="btn"
                        CommandName="Continue" OnCommand="SaveData" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn"
                        CausesValidation="False" OnClick="btnCancel_Click" />
                    <asp:LinkButton ID="lbtnContinueShopping" runat="server" CssClass="btn"
                        PostBackUrl="~/Order.aspx" CausesValidation="False">Continue Shopping</asp:LinkButton>
                </div>
            </div>
    
        </form>
    </main>
</div>
</body>
</html>
