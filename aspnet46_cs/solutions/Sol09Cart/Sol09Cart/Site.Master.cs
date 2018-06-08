using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch09Cart
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public string HeaderText {
            set { lblPageHeader.Text = value;  }
        }

        public string FormClass
        {
            set
            {
                if (value.StartsWith("form-"))
                    form1.Attributes["class"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (lblDaysUntilHalloween != null)
            {
                int daysUntil = DaysUntilHalloween();
                switch (daysUntil)
                {
                    case 0:
                        lblDaysUntilHalloween.Text = "Happy Halloween!";
                        break;
                    case 1:
                        lblDaysUntilHalloween.Text = "Tomorrow is Halloween!";
                        break;
                    default:
                        lblDaysUntilHalloween.Text = 
                            $"There are only {daysUntil} days until Halloween!";
                        break;
                }
            }
        }

        private int DaysUntilHalloween()
        {
            DateTime today = DateTime.Today;
            DateTime halloween = new DateTime(today.Year, 10, 31);
            if (today > halloween) halloween = halloween.AddYears(1);
            TimeSpan span = halloween - today;
            return span.Days;
        }
    }
}