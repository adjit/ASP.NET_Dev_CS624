<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch14CustomerList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch14: Customer List</title>
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
            <div class="col-xs-12 table-responsive">
                <asp:GridView ID="grdCustomers" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    AllowPaging="True" PageSize="8" AllowSorting="True" 
                    CssClass="table table-bordered table-striped table-condensed" 
                    OnPreRender="grdCustomers_PreRender">
                    <Columns>
                        <asp:BoundField DataField="LastName" HeaderText="LastName" 
                            SortExpression="LastName"> 
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName"> 
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" 
                            SortExpression="State, City"> 
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City">
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <PagerSettings Mode="NextPreviousFirstLast" />
                    <PagerStyle CssClass="pagerStyle" BackColor="#8c8c8c" HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                    SelectCommand="SELECT [LastName], [FirstName], [State], 
                        [City] FROM [Customers] ORDER BY [LastName]">
                </asp:SqlDataSource>    
            </div>  
        </form>
    </main>
</div>
</body>
</html>