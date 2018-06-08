using System;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

[DataObject]
public class CustomerDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllStates()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel =
            "SELECT StateCode, StateName FROM States " +
            "ORDER BY StateName";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        return rdr;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetCustomersByState(string state)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel =
            "SELECT LastName, FirstName, PhoneNumber FROM Customers " +
            "WHERE State = @State " +
            "ORDER BY LastName";
        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("@State", state);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        return rdr;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings[
            "HalloweenConnection"].ConnectionString;
    }
}