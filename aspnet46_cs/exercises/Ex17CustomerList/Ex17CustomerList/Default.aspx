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

                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-9 table-responsive">

                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>