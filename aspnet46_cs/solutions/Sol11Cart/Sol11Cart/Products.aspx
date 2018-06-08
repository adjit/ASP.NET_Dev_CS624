<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Ch11Cart.Products" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <a href='/Order/<%# Eval("ProductID") %>'>
                            <img src='/Images/Products/<%# Eval("ImageFile") %>' 
                                alt='<%# Eval("Name") %>' /></a>
                        <div class="caption">
                            <h3><%# Eval("Name") %></h3>
                            <p><b>Price: <%# Eval("UnitPrice", "{0:c}") %></b>
                            <br><br><%# Eval("LongDescription") %></p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" 
            ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>' 
            SelectCommand="SELECT [ProductID], [Name], [LongDescription], 
            [UnitPrice], [ImageFile] FROM [Products] ORDER BY [Name]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
