<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch11Cart.Default" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <%-- Mixed - most URLs handled by ASP.NET routing --%>
            <p>This version of the Shopping Cart application adds custom 
                routes for the Order, Products, and Cart pages 
                (see RouteConfig.cs in the App_Start folder).
                And, it overrides the ConvertToFriendlyUrl method of the
                WebFormsFriendlyUrlResolver object so that it maps to
                the custom routes. Thus, most of the URLs use the custom
                ASP.NET "Shop" routes, but some of them still use the 
                default FriendlyUrl routes.
            </p>
        </div>
        <div class="col-sm-6">
            <h4>URLs handled by FriendlyUrls</h4>
            <p class="small">(Final URL won't contain <i>Shop/</i>)</p>
            <asp:HyperLink NavigateUrl="~/Order/cat01" runat="server">
                ~/Order/cat01</asp:HyperLink><br />
            <asp:HyperLink NavigateUrl="~/Products" runat="server">
                ~/Products</asp:HyperLink><br />
            <asp:HyperLink NavigateUrl="~/Cart" runat="server">
                ~/Cart</asp:HyperLink><br />
        </div>
        <div class="col-sm-6">
            <h4>URLs handled by ASP.NET routing</h4>
            <p class="small">(Final URL will contain <i>Shop/</i>)</p>
            <asp:HyperLink NavigateUrl="~/Order.aspx" runat="server">
                ~/Order.aspx</asp:HyperLink>
                <span class="small">(Because of the overridden ConvertToFriendlyUrl method)</span>
                <br />
            <asp:HyperLink NavigateUrl="~/Order" runat="server">
                ~/Order</asp:HyperLink>
                <span class="small">(Because Order page reloads the custom route if no id parameter)</span>
                <br />
            <asp:HyperLink NavigateUrl="~/Shop/Order" runat="server">
                ~/Shop/Order</asp:HyperLink><br />
            <asp:HyperLink NavigateUrl="~/Shop/Order/cat01" runat="server">
                ~/Shop/Order/cat01</asp:HyperLink><br />
            <asp:HyperLink NavigateUrl="~/Products.aspx" runat="server">
                ~/Products.aspx</asp:HyperLink><br />
            <asp:HyperLink NavigateUrl="~/Shop/Products" runat="server">
                ~/Shop/Products</asp:HyperLink><br />
            <asp:HyperLink NavigateUrl="~/Cart.aspx" runat="server">
                ~/Cart.aspx</asp:HyperLink><br />
            <asp:HyperLink NavigateUrl="~/Shop/Cart" runat="server">
                ~/Shop/Cart</asp:HyperLink><br />
            <br />
        </div>
    </div>
</asp:Content>
