using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// make sure to include these namespaces
using System.Data;
using System.Web.Caching;

namespace Ch08Cart
{
    public partial class Order : System.Web.UI.Page
    {
        private Product selectedProduct;

        protected void Page_Load(object sender, EventArgs e)
        {
            // bind drop-down list and update page hit count on first load  
            if (!IsPostBack)
            {
                ddlProducts.DataBind();

                // get hit count from application state or set to 1
                //Application.Lock();
                //    int hitCount = Convert.ToInt32(Application["HitCount"]);
                //    hitCount++;
                //    Application["HitCount"] = hitCount.ToString();
                //Application.UnLock();

                // get hit count from cache or set to 1
                int hitCount = Convert.ToInt32(Cache.Get("HitCount"));
                hitCount++;
                Cache.Insert("HitCount", hitCount, null, DateTime.Now.AddMinutes(5), Cache.NoSlidingExpiration);

                lblPageHits.Text = hitCount.ToString();
            }
            // get and show product data on every load  
            selectedProduct = this.GetSelectedProduct();
            lblName.Text = selectedProduct.Name;
            lblShortDescription.Text = selectedProduct.ShortDescription; 
            lblLongDescription.Text = selectedProduct.LongDescription;
            lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c") + " each";
            imgProduct.ImageUrl = "Images/Products/" + selectedProduct.ImageFile;

            // get firstname cookie and set welcome message if it exists
            //HttpCookie firstName = Request.Cookies["FirstName"];
            //if (firstName != null)
            //    lblWelcome.Text = "<h4>welcome back, " + firstName.Value + "!</h4>";


            // get first name from session state and set welcome message if it exists
            string firstName = (string)Session["FirstName"];
            if (firstName != null)
                lblWelcome.Text = "<h4>welcome back, " + firstName + "!</h4>";

            // get timestamp from cache, then display it
            // or set timestamp in cache to now plus 10, then display
            object cacheTimestamp = Cache.Get("Timestamp");
            if (cacheTimestamp == null)
            {
                cacheTimestamp = DateTime.Now;
                Cache.Insert("Timestamp", cacheTimestamp, null,
                    DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);
            }
            lblCacheTimestamp.Text = cacheTimestamp.ToString();
        }

        private Product GetSelectedProduct()
        {
            //get row from AccessDataSource based on value in dropdownlist
            DataView productsTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter =
                "ProductID = '" + ddlProducts.SelectedValue + "'";
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
                //get cart from session and selected item from cart
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                //if item isn’t in cart, add it; otherwise, increase its quantity
                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct,
                                 Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }
                Response.Redirect("Cart.aspx");
            }
        }
    }
}