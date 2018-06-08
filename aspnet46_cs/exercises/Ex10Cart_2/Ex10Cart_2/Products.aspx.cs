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
            Master.HeaderText = "Our Products";

            Master.AddBreadcrumbLink("/Order.aspx", "Home");
            Master.AddCurrentPage("Products"); 
        }

    }
}