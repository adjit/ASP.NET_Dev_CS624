using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch06Cart
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var customer = (Customer)Session["Customer"];

            string message =
                "Contact information\n" +
                "    Email: " + customer.EmailAddress + "\n" +
                "    First name: " + customer.FirstName + "\n" +
                "    Last name: " + customer.LastName + "\n" +
                "    Phone number: " + customer.Phone + "\n" +
                "Billing address\n" +
                "    Address: " + customer.Address + "\n" +
                "    City: " + customer.City + "\n" +
                "    State: " + customer.State + "\n" +
                "    Zip code: " + customer.Zip + "\n" +
                "Let me know about\n" +
                "    New products: " + customer.NewProductsInfo + "\n" +
                "    Special offers: " + customer.SpecialPromosInfo + "\n" +
                "    New editions: " + customer.NewRevisionsInfo + "\n" +
                "    Local events: " + customer.LocalEventsInfo + "\n" +
                "Contact me via: " + customer.ContactVia + "\n";

            txtData.Text = message;
        }
    }
}