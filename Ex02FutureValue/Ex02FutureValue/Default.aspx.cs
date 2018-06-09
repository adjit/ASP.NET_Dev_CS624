using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ex02FutureValue
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                for(int i = 50; i < 500; i+=50)
                {
                    MonthlyInvestment.Items.Add(i.ToString());
                }
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                int monthlyInvestment = Convert.ToInt32(MonthlyInvestment.SelectedValue);
                decimal yearlyInterestRate = Convert.ToDecimal(txtInterestRate.Text);
                int years = Convert.ToInt32(txtYears.Text);
                decimal futureValue = this.CalculateFutureValue(monthlyInvestment, yearlyInterestRate, years);
                lblFutureValue.Text = futureValue.ToString("c");
            }
        }

        protected decimal CalculateFutureValue(int monthlyInvestment, decimal yearlyInterestRate, int years)
        {
            decimal futureValue = 0;

            int months = years * 12;
            decimal monthlyInterestRate = yearlyInterestRate / 12 / 100;

            for(int i = 0; i < months; i++)
            {
                futureValue = (futureValue + monthlyInvestment) * (1 + monthlyInterestRate);
            }

            return futureValue;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            MonthlyInvestment.SelectedIndex = 0;
            txtInterestRate.Text = "";
            txtYears.Text = "";
            lblFutureValue.Text = "";
        }
    }
}