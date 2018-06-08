using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch06Cart
{
    public partial class CheckOut : System.Web.UI.Page
    {
        private Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                customer = (Customer)Session["Customer"];
                this.LoadCustomerData();
            }
        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                this.GetCustomerData();
                Response.Redirect("~/Confirmation.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Session.Remove("Customer");
            Response.Redirect("~/Order.aspx");
        }
        private void LoadCustomerData()
        {
            if (customer != null)
            {
                txtFirstName.Text = customer.FirstName;
                txtLastName.Text = customer.LastName;
                txtEmail1.Text = customer.EmailAddress;
                txtPhone.Text = customer.Phone;
                txtAddress.Text = customer.Address;
                txtCity.Text = customer.City;
                txtZip.Text = customer.Zip;
                ddlState.SelectedValue = customer.State;
                rblContactVia.SelectedValue = customer.ContactVia;
                cblAboutList.Items[0].Selected = customer.NewProductsInfo;
                cblAboutList.Items[1].Selected = customer.SpecialPromosInfo;
                cblAboutList.Items[2].Selected = customer.NewRevisionsInfo;
                cblAboutList.Items[3].Selected = customer.LocalEventsInfo;
            }
        }
        private void GetCustomerData()
        {
            if (customer == null) customer = new Customer();
            customer.FirstName = txtFirstName.Text;
            customer.LastName = txtLastName.Text;
            customer.EmailAddress = txtEmail1.Text;
            customer.Phone = txtPhone.Text;
            customer.Address = txtAddress.Text;
            customer.City = txtCity.Text;
            customer.Zip = txtZip.Text;
            customer.State = ddlState.SelectedValue;
            customer.ContactVia = rblContactVia.SelectedValue;
            customer.NewProductsInfo = cblAboutList.Items[0].Selected;
            customer.SpecialPromosInfo = cblAboutList.Items[1].Selected;
            customer.NewRevisionsInfo = cblAboutList.Items[2].Selected;
            customer.LocalEventsInfo = cblAboutList.Items[3].Selected;
            
            Session["Customer"] = customer;
        }
    }
}