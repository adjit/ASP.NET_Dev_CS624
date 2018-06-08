<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Ch10Cart.ContactUs" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        <div class="col-xs-12 table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Type</th>
                        <th>Number/Address</th>
                        <th>Extension</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>General</td><td>555-555-5555</td><td>0</td>
                    </tr>
                    <tr>
                        <td>Customer Service</td><td>555-555-5555</td><td>10</td>
                    </tr>
                    <tr>
                        <td>Billing & Accounts</td><td>555-555-5555</td><td>20</td>
                    </tr>
                    <tr>
                        <td>Mailing Address</td><td>123 SE 4th Ave</td><td></td>
                    </tr>
                    <tr>
                        <td>Email Address</td><td>info@halloween.com</td><td></td>
                    </tr>
                    <tr>
                        <td>Facebook</td><td>www.facebook.com/halloween</td><td></td>
                    </tr>
                    <tr>
                        <td>Twitter</td><td>www.twitter.com/halloween</td><td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
