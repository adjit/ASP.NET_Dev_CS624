using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Ex04Cart
{
    public partial class Order : System.Web.UI.Page
    {
        private Product selectedProduct;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) ddlProducts.DataBind();
            selectedProduct = this.GetSelectedProduct();
            lblName.Text = selectedProduct.Name;
            lblShortDescription.Text = selectedProduct.ShortDescription;
            lblLongDescription.Text = selectedProduct.LongDescription;
            lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c") + " each";
            imgProduct.ImageUrl = "Images/Products/" + selectedProduct.ImageFile;
        }

        private Product GetSelectedProduct()
        {
            DataView productsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter = string.Format("ProductID = '{0}'", ddlProducts.SelectedValue);
            DataRowView row = productsTable[0];

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
            if (IsValid)
            {
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct, Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }
                Response.Redirect("~/Cart.aspx");
            }
        }
    }
}