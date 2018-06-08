using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// make sure to include these namespaces
using System.Data;
using Microsoft.AspNet.FriendlyUrls;

namespace Ch11Cart
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProducts.DataBind();

                string id = "";
                if (RouteData.Values.ContainsKey("productID"))
                {
                    id = RouteData.Values["productID"].ToString();
                }
                else
                {
                    var segments = Request.GetFriendlyUrlSegments();
                    if (segments.Count > 0) id = segments[0];
                }

                if (id == "") Reload();
                else ShowSelectedProduct(id);
            }
			//ShowSelectedProduct(ddlProducts.SelectedValue);
        }

        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            Reload();
        }

        private void Reload()
        {
            var id = ddlProducts.SelectedValue;
            var url = FriendlyUrl.Href("~/Shop", "Order", id);
            Response.Redirect(url);
        }

        private void ShowSelectedProduct(string id)
        {
            var product = GetSelectedProduct(id);
            lblName.Text = product.Name;
            lblShortDescription.Text = product.ShortDescription;
            lblLongDescription.Text = product.LongDescription;
            lblUnitPrice.Text = product.UnitPrice.ToString("c") + " each";
            imgProduct.ImageUrl = "Images/Products/" + product.ImageFile;
            ddlProducts.SelectedValue = product.ProductID;
        }

        private Product GetSelectedProduct(string id)
        {
            //get row from SqlDataSource based on value in dropdownlist
            DataView productsTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter = $"ProductID = '{id}'";
            DataRowView row = productsTable[0];

            //create a new product object and load with data from row
            Product p = new Product();
            p.ProductID = row["ProductID"].ToString();
            p.Name = row["Name"].ToString();
            p.ShortDescription = row["ShortDescription"].ToString();
            p.LongDescription = row["LongDescription"].ToString();
            p.UnitPrice = (decimal)row["UnitPrice"];
            p.ImageFile = row["ImageFile"].ToString();
            return p;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //get selected product
                var product = GetSelectedProduct(ddlProducts.SelectedValue);

                //get cart from session and selected item from cart
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[product.ProductID];

                //if item isn’t in cart, add it; otherwise, increase its quantity
                if (cartItem == null)
                {
                    cart.AddItem(product, Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }
				//Response.Redirect("~/Cart.aspx");
                Response.Redirect("~/Shop/Cart");
            }
        }

        

    }
}