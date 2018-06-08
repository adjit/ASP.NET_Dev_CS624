<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Ch07Cart.Order" %>

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
        <form id="form1" runat="server" class="form-horizontal">
    
            <div class="row"><%-- row 1 --%>
                <div class="col-sm-8"><%-- product drop down and info column --%>
                    <div class="form-group">
                        <label class="col-sm-5">Please select a product:</label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="Name" 
                                DataValueField="ProductID" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>' 
                                SelectCommand="SELECT [ProductID], [Name], [ShortDescription], 
                                [LongDescription], [ImageFile], [UnitPrice] FROM [Products] 
                                ORDER BY [Name]">
                            </asp:SqlDataSource>
                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-sm-12"><h4><asp:Label ID="lblName" runat="server"></asp:Label></h4></div></div>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Label ID="lblShortDescription" runat="server"></asp:Label></div></div>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Label ID="lblLongDescription" runat="server"></asp:Label></div></div>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Label ID="lblUnitPrice" runat="server"></asp:Label></div></div>
                </div>
                <div class="col-sm-4"><%-- product image column --%>
                    <asp:Image ID="imgProduct" runat="server" />
                </div>
            </div><%-- end of row 1 --%>

            <div class="row"><%-- row 2 --%>
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-1">Quantity:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtQuantity" runat="server" 
                                CssClass="form-control"></asp:TextBox></div>
                        <div class="col-sm-8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                                runat="server" ControlToValidate="txtQuantity" Display="Dynamic" 
                                ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" 
                                ControlToValidate="txtQuantity" Display="Dynamic" 
                                ErrorMessage="Quantity must range from 1 to 500."
                                MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator></div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" 
                                onclick="btnAdd_Click" CssClass="btn" />
                            <asp:Button ID="btnCart" runat="server" Text="Go to Cart" 
                                PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn" />
                        </div>
                    </div>
                </div>
            </div><%-- end of row 2 --%>

        </form>
    </main>
</div>
</body>
</html>