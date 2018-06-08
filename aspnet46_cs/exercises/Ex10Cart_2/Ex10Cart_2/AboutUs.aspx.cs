using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch10Cart
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.HeaderText = "About Us";

            Master.AddBreadcrumbLink("/Order.aspx", "Home");
            Master.AddCurrentPage("About Us");
        }
    }
}