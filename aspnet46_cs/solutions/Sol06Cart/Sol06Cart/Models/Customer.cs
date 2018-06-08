using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Customer
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string EmailAddress { get; set; }
    public string Phone { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    // values for "Please let me know about"
    public bool NewProductsInfo { get; set; }
    public bool NewRevisionsInfo { get; set; }
    public bool SpecialPromosInfo { get; set; }
    public bool LocalEventsInfo { get; set; }
    // values for "Please contact me via"
    public string ContactVia { get; set; }
}
