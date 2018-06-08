<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch17ProductList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch17: Product List</title>
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
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblState" class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a state:</label>
                <div class="col-xs-8 col-sm-5">
                    <asp:DropDownList ID="ddlStates" runat="server" 
                        AutoPostBack="True" DataSourceID="ObjectDataSource1" 
                        DataTextField="StateName" DataValueField="StateCode">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetAllStates" TypeName="CustomerDB">
                    </asp:ObjectDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-9 table-responsive">
                    <asp:GridView ID="grdCustomers" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" 
                        OnPreRender="grdCustomers_PreRender" 
                        CssClass="table table-bordered table-striped table-condensed">
                        <Columns>
                            <asp:BoundField DataField="LastName" HeaderText="Last Name">
                                <itemStyle CssClass="col-xs-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name">
                                <itemStyle CssClass="col-xs-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number">
                                <itemStyle CssClass="col-xs-3" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomersByState" TypeName="CustomerDB">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlStates" Name="state" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>