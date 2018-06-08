using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sol18CustomerList
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdCustomers_PreRender(object sender, EventArgs e)
        {
            grdCustomers.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

    }
}