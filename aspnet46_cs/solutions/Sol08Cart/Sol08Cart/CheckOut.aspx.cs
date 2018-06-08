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
            if (!IsPostBack)
            {
                // get the names from the cookies
                //HttpCookie firstName = Request.Cookies["FirstName"];
                //HttpCookie lastName = Request.Cookies["LastName"];
                //txtFirstName.Text = firstName?.Value;
                //txtLastName.Text = lastName?.Value;

                // get the names from session state
                string firstName = (string)Session["FirstName"];
                if (firstName != null)
                    txtFirstName.Text = (string)Session["FirstName"];
                string lastName = (string)Session["FirstName"];
                if (lastName != null)
                    txtLastName.Text = (string)Session["LastName"];
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // load names into cookies
                //DateTime expiry = DateTime.Now.AddMinutes(5);
                //SetCookie("FirstName", txtFirstName.Text, expiry);
                //SetCookie("LastName", txtLastName.Text, expiry);

                // load names into session state
                Session["FirstName"] = txtFirstName.Text;
                Session["LastName"] = txtLastName.Text;
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