<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Ch10Cart.Products" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src='/Images/Products/<%# Eval("ImageFile") %>' 
                            alt='<%# Eval("Name") %>' />
                        <div class="caption">
                            <h4 class="text-center"><%# Eval("Name") %></h4>
                        </div>
                    </div>
                </div>            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1"
        ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>'
        SelectCommand="SELECT [ProductID], [Name], [LongDescription], 
        [UnitPrice], [ImageFile] FROM [Products] ORDER BY [Name]">
    </asp:SqlDataSource>
    
</asp:Content>
