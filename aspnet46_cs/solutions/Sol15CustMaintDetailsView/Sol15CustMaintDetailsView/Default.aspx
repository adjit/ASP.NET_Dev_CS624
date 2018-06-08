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
                        <asp:CommandField ButtonType="Link" ShowSelectButton="true"> 
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:CommandField>
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
                <asp:DetailsView ID="dvCustomer" runat="server" 
                    DataSourceID="SqlDataSource2" DataKeyNames="Email" 
                    AutoGenerateRows="False"  
                    CssClass="table table-bordered table-condensed" 
                    OnItemDeleted="dvCustomer_ItemDeleted" 
                    OnItemDeleting="dvCustomer_ItemDeleting" 
                    OnItemInserted="dvCustomer_ItemInserted" 
                    OnItemUpdated="dvCustomer_ItemUpdated">
                    <Fields>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:Label runat="server" ID="lblEmail"
                                    Text='<%# Eval("Email") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtEmail" 
                                        Text='<%# Bind("Email") %>' MaxLength="25" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" CssClass="text-danger"
                                    ErrorMessage="Email is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblEmail" 
                                    Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtLastName"
                                        Text='<%# Bind("LastName") %>' MaxLength="20" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                    ControlToValidate="txtLastName" CssClass="text-danger"
                                    ErrorMessage="LastName is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtLastName" 
                                        Text='<%# Bind("LastName") %>' MaxLength="20" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                    ControlToValidate="txtLastName" CssClass="text-danger"
                                    ErrorMessage="LastName is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblLastName"
                                    Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtFirstName" 
                                        Text='<%# Bind("FirstName") %>' MaxLength="20"
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                    ControlToValidate="txtFirstName" CssClass="text-danger"
                                    ErrorMessage="First Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtFirstName" 
                                        Text='<%# Bind("FirstName") %>' MaxLength="20"
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                    ControlToValidate="txtFirstName" CssClass="text-danger"
                                    ErrorMessage="First Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblFirstName" 
                                    Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtAddress" 
                                        Text='<%# Bind("Address") %>' MaxLength="40"
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                    ControlToValidate="txtAddress" CssClass="text-danger"
                                    ErrorMessage="Address is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtAddress" 
                                        Text='<%# Bind("Address") %>' MaxLength="40"
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                    ControlToValidate="txtAddress" CssClass="text-danger"
                                    ErrorMessage="Address is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAddress" 
                                    Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtCity" 
                                        Text='<%# Bind("City") %>' MaxLength="30"
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                    ControlToValidate="txtCity" CssClass="text-danger"
                                    ErrorMessage="City is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtCity" 
                                        Text='<%# Bind("City") %>' MaxLength="30"
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                    ControlToValidate="txtCity" CssClass="text-danger"
                                    ErrorMessage="City is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblCity" 
                                    Text='<%# Bind("City") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:DropDownList runat="server" ID="ddlStates" 
                                        DataSourceID="SqlDataSource3" 
                                        DataTextField="StateName" DataValueField="StateCode" 
                                        SelectedValue='<%# Bind("State") %>'
                                        CssClass="form-control"></asp:DropDownList>
                                </div>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:DropDownList runat="server" ID="ddlStates" 
                                        DataSourceID="SqlDataSource3" 
                                        DataTextField="StateName" DataValueField="StateCode" 
                                        SelectedValue='<%# Bind("State") %>'
                                        CssClass="form-control"></asp:DropDownList>
                                </div>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblState" 
                                    Text='<%# Bind("State") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip Code">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtZipCode" 
                                        Text='<%# Bind("ZipCode") %>' MaxLength="9" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtZipCode" 
                                        Text='<%# Bind("ZipCode") %>' MaxLength="9" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblZipCode" 
                                    Text='<%# Bind("ZipCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone Number">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtPhone" 
                                        Text='<%# Bind("PhoneNumber") %>' MaxLength="20" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPhone" CssClass="text-danger"
                                    ErrorMessage="Phone Number is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-edit-insert">
                                    <asp:TextBox runat="server" ID="txtPhone" 
                                        Text='<%# Bind("PhoneNumber") %>' MaxLength="20"
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPhone" CssClass="text-danger"
                                    ErrorMessage="Phone Number is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblUnitPrice" 
                                    Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Link" 
                            ShowDeleteButton="true" 
                            ShowEditButton="true" 
                            ShowInsertButton="true" />
                    </Fields>
                    <RowStyle BackColor="#e7e7e7" />
                    <CommandRowStyle BackColor="#8c8c8c" ForeColor="white" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber] FROM [Customers] WHERE ([Email] = @Email)" 
                    DeleteCommand="DELETE FROM [Customers] WHERE [Email] = @original_Email AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber" 
                    InsertCommand="INSERT INTO [Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (@Email, @LastName, @FirstName, @Address, @City, @State, @ZipCode, @PhoneNumber)" 
                    UpdateCommand="UPDATE [Customers] SET [LastName] = @LastName, [FirstName] = @FirstName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [PhoneNumber] = @PhoneNumber WHERE [Email] = @original_Email AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdCustomers" Name="Email" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_PhoneNumber" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />    
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="PhoneNumber" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_PhoneNumber" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="PhoneNumber" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>  
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>' 
                    SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]">
                </asp:SqlDataSource> 

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