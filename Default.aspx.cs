using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Security;

using Win = System.Windows.Forms;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtBusinessID.Focus();

        pnlUpdateAppBLInfo.Visible = false;
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


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if(Panel1.Visible)
        {
            Panel1.Visible = false;
        }
        else { Panel1.Visible = true; UpdatePanel2.Visible = false; UpdatePanel3.Visible = false; UpdatePanel4.Visible = false; }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (UpdatePanel2.Visible)
        {
            UpdatePanel2.Visible = false;
        }
        else { Panel1.Visible = false; UpdatePanel2.Visible = true; UpdatePanel3.Visible = false; UpdatePanel4.Visible = false; }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if (UpdatePanel3.Visible)
        {
            UpdatePanel3.Visible = false;
        }
        else { Panel1.Visible = false; UpdatePanel2.Visible = false; UpdatePanel3.Visible = true; UpdatePanel4.Visible = false; }
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if (UpdatePanel4.Visible)
        {
            UpdatePanel4.Visible = false;
        }
        else { Panel1.Visible = false; UpdatePanel2.Visible = false; UpdatePanel3.Visible = false; UpdatePanel4.Visible = true; }
    }

    protected void btnBeginRegistration_Click(object sender, EventArgs e)
    {  
        SearchForApplication();
    }

    protected void btnCreateBusinessContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewBusinessContact.aspx");
        
    }

    protected void btnUpdateAppLicense_Click(object sender, EventArgs e)
    {
        lblError3.Text = "";
        string PIN = "noPIN";
        Int32 APPID = 0;
        string LicenseNumber = "noLicense";
        
        if(String.IsNullOrEmpty(txtUpdatePIN.Text))
        {
            lblError3.Text = "Enter PIN; ";            
        }
        else 
        {
            PIN = txtUpdatePIN.Text;
        }

        int num;
        bool value = int.TryParse(txtUpdateAPPID.Text, out num);
        if (value == false)
        {
            //Label3.Text += "Enter Business ID; ";
        }
        else
        {
            APPID = Int32.Parse(txtUpdateAPPID.Text);
        }

        if (String.IsNullOrEmpty(txtUpdateLicenseNumber.Text))
        {
            //Label3.Text += "Enter License number;";
        }
        else
        {
            LicenseNumber = txtUpdateLicenseNumber.Text;
            
            //Win.MessageBox.Show(APPID.ToString());

        }
        
        if(APPID==0 && LicenseNumber == "noLicense" )
        {
            lblError3.Text += "Enter Business ID or License number;";
        }
        else if (APPID != 0 && LicenseNumber != "noLicense")
        {
            lblError3.Text += "Enter Business ID or License number (not both);";
        }
        else if (APPID != 0 && LicenseNumber == "noLicense" && PIN != "noPIN")
        {
            lblError3.Text += "Update Application - PIN-" + PIN + " and BusinessID-" + APPID.ToString();
            //Win.MessageBox.Show("ApplicationStep1.aspx?PIN=" + PIN + "&APPID=" + APPID);
            Response.Redirect("ApplicationStep1.aspx?PIN=" + PIN + "&APPID=" + APPID.ToString() + "&Action=Update");
        }
        else if (APPID == 0 && LicenseNumber != "noLicense" && PIN != "noPIN")
        {

            APPID = Convert.ToInt32(LicenseNumber.Substring(5,LicenseNumber.Length - 5));
            Response.Redirect("ApplicationStep1.aspx?PIN=" + PIN + "&APPID=" + APPID.ToString() + "&LicenseNumber=" + LicenseNumber + "&Action=Update");
        }

    }

    protected void btnRenewLicense_Click(object sender, EventArgs e)
    {
        lblError4.Text = "";
        string PIN = "noPIN";
        string LicenseNumber = "noLicense";

        if (String.IsNullOrEmpty(txtRenewBusinessPIN.Text))
        {
            lblError4.Text = "Enter PIN; ";
        }
        else
        {
            PIN = txtRenewBusinessPIN.Text;
        }
        
        if(String.IsNullOrEmpty(txtRenewBusinessLicenseNumber.Text))
        {
            lblError4.Text += "Enter License Number; ";
        }
        else         
        {
            LicenseNumber = txtRenewBusinessLicenseNumber.Text;
        }

        if (LicenseNumber != "noLicense" && PIN != "noPIN")
        {
            Response.Redirect("ApplicationStep1.aspx?PIN=" + PIN + "&LicenseNumber=" + LicenseNumber + "&Action=Renew");
        }


    }
}