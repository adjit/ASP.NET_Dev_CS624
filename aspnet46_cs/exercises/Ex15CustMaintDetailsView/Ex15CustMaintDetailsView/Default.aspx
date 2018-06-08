<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch15ProductMaintenance.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch15: Product Maintenance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main class="row">
        <form id="form1" runat="server">

            <div class="col-sm-5 table-responsive">
                <asp:GridView ID="grdCustomers" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="Email" 
                    DataSourceID="SqlDataSource1" AllowPaging="True" 
                    SelectedIndex="0" UseAccessibleHeader="True" 
                    CssClass="table table-bordered table-striped table-condensed" 
                    OnPreRender="grdCustomers_PreRender">
                    <Columns>
                        <asp:BoundField DataField="Email" HeaderText="Email" 
                            ReadOnly="True" Visible="false">
                        </asp:BoundField>
                        <asp:BoundField DataField="LastName" HeaderText="Last Name">
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name"> 
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <PagerSettings Mode="NextPreviousFirstLast" />
                    <PagerStyle CssClass="pagerStyle" 
                        BackColor="#8c8c8c" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                    SelectCommand="SELECT [Email], [LastName], [FirstName] 
                        FROM [Customers] ORDER BY [LastName]">
                </asp:SqlDataSource>    
            </div>  

            <div class="col-sm-7">

                <p><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        CssClass="text-danger" />
                <p><asp:Label ID="lblError" runat="server" 
                    EnableViewState="false" CssClass="text-danger"></asp:Label></p>

            </div>

        </form>
    </main>
</div>
</body>
</html>