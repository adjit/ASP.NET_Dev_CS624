using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch08Cart
{
    public partial class CheckOut : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                DateTime expiry = DateTime.Now.AddMinutes(5);
                SetCookie("FirstName", txtFirstName.Text, expiry);
                SetCookie("LastName", txtLastName.Text, expiry);
            }
            Response.Redirect("~/Order.aspx");
        }

        private void SetCookie(string name, string value, DateTime expiry)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            cookie.Expires = expiry;
            Response.Cookies.Add(cookie);
        }

    }
}