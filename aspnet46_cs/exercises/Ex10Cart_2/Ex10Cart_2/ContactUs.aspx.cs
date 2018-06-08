using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch10Cart
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.HeaderText = "Contact Us";

            Master.AddBreadcrumbLink("/Order.aspx", "Home");
            Master.AddCurrentPage("Contact Us");
        }
    }
}