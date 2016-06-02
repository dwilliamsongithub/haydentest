using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtBusinessID.Focus();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SearchForApplication();
    }

    private void SearchForApplication()
    {
        lblError.Text = "";

        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = ConfigurationManager.ConnectionStrings["BusinessRegistrationDataReader"].ConnectionString;

        SqlDataAdapter da;
        SqlParameter workParam;

        da = new SqlDataAdapter("sproc_GetApplicationDataByTempKeyAndPIN", conn);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        //add the @TempKey input parameter 
        workParam = new SqlParameter("@TempKey", System.Data.SqlDbType.Int);
        workParam.Direction = ParameterDirection.Input;
        try
        {
            workParam.Value = Convert.ToInt32(txtBusinessID.Text);
        }
        catch (Exception e)
        {
            string strErr1 = e.Message;
            lblError.Text = "The data supplied does not match a record in the database. ";
            workParam.Value = DBNull.Value;
        }
        da.SelectCommand.Parameters.Add(workParam);

        //add the @ApplicationPIN input parameter 
        workParam = new SqlParameter("@ApplicationPIN", System.Data.SqlDbType.NVarChar);
        workParam.Direction = ParameterDirection.Input;
        workParam.Value = txtBusinesPIN.Text;
        da.SelectCommand.Parameters.Add(workParam);

        //execute the stored procedure
        DataSet ds = new DataSet();
        try
        {
            da.Fill(ds);
        }
        catch (Exception e)
        {
            string strErr = e.Message;
            lblError.Text += " There was a problem connecting to the data source.";
        }

        DataTable dt = new DataTable();

        //create and populate the table that will be used to store the results
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            if (lblError.Text.Length < 1)
            {
                Response.Redirect("Exemptions.aspx?TempKey=" + dt.Rows[0]["TempID"].ToString() + "&PIN=" + dt.Rows[0]["ApplicationPIN"].ToString());
                //Response.Redirect("ApplicationStep1.aspx?TempKey=" + dt.Rows[0]["TempID"].ToString() + "&PIN=" + dt.Rows[0]["ApplicationPIN"].ToString());
            }
        }
        else
        {
            lblError.Text = "The data supplied does not match a record in the database. ";
        }

    }


}