using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch10Cart
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Order.aspx", "Home");

            string header = "Our Products";
            string catID = Request.QueryString["catID"];

            // assign data source based on whether there's a catID query string value
            if (string.IsNullOrEmpty(catID))
            {
                Repeater1.DataSourceID = "SqlDataSourceAll";
                Master.AddCurrentPage("Products");
            }  
            else
            {
                Repeater1.DataSourceID = "SqlDataSourceByCategory";
                Master.AddBreadcrumbLink("/Products.aspx", "Products");

                // amend header string to include category 
                switch (catID)
                {
                    case "fx":
                        header += " - Special Effects";
                        Master.AddCurrentPage("Special Effects");
                        break;
                    case "costumes":
                        header += " - Costumes";
                        Master.AddCurrentPage("Costumes");
                        break;
                    case "masks":
                        header += " - Masks";
                        Master.AddCurrentPage("Masks");
                        break;
                    case "props":
                        header += " - Props";
                        Master.AddCurrentPage("Props");
                        break;
                }
            }

            // set page header text 
            Master.HeaderText = header;
        }
    }
}