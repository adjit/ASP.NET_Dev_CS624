using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;

namespace Ch11Cart
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public string HeaderText {
            set { lblPageHeader.Text = value;  }
        }

        protected void Page_Load(object sender, EventArgs e)
        {            

        }

    }
}