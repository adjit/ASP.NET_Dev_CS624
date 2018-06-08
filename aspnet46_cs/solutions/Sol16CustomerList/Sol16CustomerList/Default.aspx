<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sol16CustomerList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch16: Customer List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script></head>
<body>
    <div class="container">
        <header class="jumbotron"><%-- image set in site.css --%></header>
        <main>
            <form id="form1" runat="server">
                    
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" class="col-xs-12 table-responsive">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" class="table table-bordered table-striped">
                                        <thead>
                                            <tr runat="server" style="">
                                                <th runat="server" class="col-xs-3">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" 
                                                        CommandName="Sort" CommandArgument="LastName">LastName
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server" class="col-xs-2">FirstName</th>
                                                <th runat="server" class="col-xs-1">
                                                    <asp:LinkButton ID="LinkButton2" runat="server" 
                                                        CommandName="Sort" CommandArgument="State">State
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server" class="col-xs-3">
                                                    <asp:LinkButton ID="LinkButton3" runat="server" 
                                                        CommandName="Sort" CommandArgument="City">City
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server" class="col-xs-3">PhoneNumber</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id="itemPlaceholder" runat="server"></tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="" class="text-center" id="pager">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button"
                                                ButtonCssClass="btn btn-default" 
                                                ShowFirstPageButton="True" ShowNextPageButton="False" 
                                                ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button"
                                                ButtonCssClass="btn btn-default" 
                                                ShowLastPageButton="True" ShowNextPageButton="False" 
                                                ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                    SelectCommand="SELECT [LastName], [FirstName], [State], [City], [PhoneNumber] 
                    FROM [Customers] ORDER BY [LastName]">
                </asp:SqlDataSource>
                    
            </form>
        </main>
    </div>
</body>
</html>
