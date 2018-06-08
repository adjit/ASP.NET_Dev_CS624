using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch07Cart
{
    public partial class CheckOut : System.Web.UI.Page
    {
        private Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                customer = (Customer)Session["Customer"];
                LoadCustomerData();
            }
        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                GetCustomerData();
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
                txtShipAddress.Text = customer.ShippingAddress;
                txtShipCity.Text = customer.ShippingCity;
                ddlShipState.SelectedValue = customer.ShippingState;
                txtShipZip.Text = customer.ShippingZip;
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
            customer.State = ddlState.SelectedValue;
            customer.Zip = txtZip.Text;
            
            if (chkSameAsBilling.Checked)
            {
                customer.ShippingAddress = customer.Address;
                customer.ShippingCity = customer.City;
                customer.ShippingState = customer.State;
                customer.ShippingZip = customer.Zip;
            }
            else
            {
                customer.ShippingAddress = txtShipAddress.Text;
                customer.ShippingCity = txtShipCity.Text;
                customer.ShippingState = ddlShipState.SelectedValue;
                customer.ShippingZip = txtShipZip.Text;
            }
            Session["Customer"] = customer;
        }

        protected void chkSameAsBilling_CheckedChanged(object sender, EventArgs e)
        {
            rfvShipAddress.Enabled = !rfvShipAddress.Enabled;
            rfvShipCity.Enabled = !rfvShipCity.Enabled;
            rfvShipState.Enabled = !rfvShipState.Enabled;
            rfvShipZip.Enabled = !rfvShipZip.Enabled;

            txtShipAddress.Enabled = !txtShipAddress.Enabled;
            txtShipCity.Enabled = !txtShipCity.Enabled;
            ddlShipState.Enabled = !ddlShipState.Enabled;
            txtShipZip.Enabled = !txtShipZip.Enabled;
        }
    }
}