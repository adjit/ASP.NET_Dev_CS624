using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch15ProductMaintenance
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

        protected void dvCustomer_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
                grdCustomers.DataBind();
        }

        protected void dvCustomer_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
                grdCustomers.DataBind();
        }

        protected void dvCustomer_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
            else
                grdCustomers.DataBind();
        }

        protected void dvCustomer_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            if (e.Values["UnitPrice"] != null)
                e.Values["UnitPrice"] =
                    e.Values["UnitPrice"].ToString().Substring(1);
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }
        
    }
}