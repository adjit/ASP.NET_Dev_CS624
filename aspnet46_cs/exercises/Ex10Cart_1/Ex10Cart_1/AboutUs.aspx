<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Ch10Cart.AboutUs" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h4>About this version of the Shopping Cart application:</h4>
    <ul class="list-group">
        <li class="list-group-item">It has a master page with Bootstrap navbar, glyphicons, and breadcrumb</li>
        <li class="list-group-item">The number of cart items displays in a badge in the navbar</li>
        <li class="list-group-item">The navbar has dropdown for Product subcategories</li>
        <li class="list-group-item">The master page code-behind has a PreRender event handler that:<br /><br />
            <div class="row">
                <div class="col-sm-offset-1 col-sm-10">
                    <ul class="list-group">
                    <li class="list-group-item">sets the value to display the current number of cart items in the badge</li>
                    <li class="list-group-item">determines the current page and sets the navigation link for that page in the 
                        navbar as active
                    </li>
                    <li class="list-group-item">creates and displays the breadcrumb segments based on the current page</li>
                </ul>
                </div>
            </div>
        </li>
        <li class="list-group-item">The Product page has 2 SqlDataSource controls, one that uses a querystring value to filter
            the products and one that doesn't. Code-behind determines which control to use based
            on whether or not there's a querystring value.
        </li>
        <li class="list-group-item">The Product page also builds the header text for the page based on the category id value
            in the querystring.
        </li>
    </ul>
</asp:Content>
