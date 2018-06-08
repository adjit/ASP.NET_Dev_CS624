using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sol18CustomerList.Models;
using System.Web.ModelBinding;

namespace Sol18CustomerList
{
    public partial class Default : System.Web.UI.Page
    {
        HalloweenEntities db = new HalloweenEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdCustomers_PreRender(object sender, EventArgs e)
        {
            grdCustomers.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        public IQueryable<State> ddlState_GetData()
        {
            return from s in db.States
                   orderby s.StateName
                   select s;
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Customer> grdCustomers_GetData([Control] string ddlState)
        {
            if (ddlState == null)
                ddlState = (from s in db.States
                            orderby s.StateName
                            select s).FirstOrDefault().StateCode;
            return from c in db.Customers
                   where c.State == ddlState
                   orderby c.LastName
                   select c;
        }
    }
}