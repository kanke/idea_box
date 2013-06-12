using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (!Page.IsValid) return;
        
        try
        {
            string insertSql;
            string conn = ConfigurationManager.ConnectionStrings["IdeaConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conn);

            insertSql = "insert into idea.idea_box(staff_id,staff_name,idea_text,staff_unit_id,concen_unit,dept_id,date)";
            insertSql += "VALUES (@staff_id,@staff_name,@idea_text,@staff_unit_id,@concen_unit,@dept_id,@date)";

            SqlCommand insertcommand = new SqlCommand(insertSql, connection);
            connection.Open();

            SqlParameter param1 = new SqlParameter("@staff_id", null);
            param1.SqlDbType = SqlDbType.VarChar;

            SqlParameter param2 = new SqlParameter("@staff_name", null);
            param2.SqlDbType = SqlDbType.VarChar;

            SqlParameter param3 = new SqlParameter("@idea_text", null);
            param3.SqlDbType = SqlDbType.VarChar;

            SqlParameter param4 = new SqlParameter("@staff_unit_id", null);
            param4.SqlDbType = SqlDbType.VarChar;

            SqlParameter param5 = new SqlParameter("@concen_unit", null);
            param5.SqlDbType = SqlDbType.Int;

            SqlParameter param6 = new SqlParameter("@dept_id", null);
            param6.SqlDbType = SqlDbType.Int;

            SqlParameter param7 = new SqlParameter("@date", null);
            param6.SqlDbType = SqlDbType.VarChar;

            insertcommand.Parameters.Clear();
            insertcommand.Parameters.Add(param1);
            insertcommand.Parameters.Add(param2);
            insertcommand.Parameters.Add(param3);
            insertcommand.Parameters.Add(param4);
            insertcommand.Parameters.Add(param5);
            insertcommand.Parameters.Add(param6);
            insertcommand.Parameters.Add(param7);

            insertcommand.Parameters["@staff_id"].Value = IDTextBox.Text;
            insertcommand.Parameters["@staff_name"].Value = NameTextBox.Text;
            insertcommand.Parameters["@staff_unit_id"].Value = UnitDropDownList.SelectedValue;
            insertcommand.Parameters["@idea_text"].Value = Idea_TextTextBox.Text;
            insertcommand.Parameters["@dept_id"].Value = DeptconDropDownList.SelectedValue;
            insertcommand.Parameters["@concen_unit"].Value = ConDropDownList.SelectedValue;
            insertcommand.Parameters["@date"].Value = DateTime.Now.ToString();
            insertcommand.ExecuteNonQuery();

            connection.Close();
            Response.Redirect("Endpage.aspx", true);
        }
            catch (Exception ex)
        {
            Label1.Text = ex.Message;
            Label1.Visible = true;
            }
        
    }
    protected void DeptconDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DeptconDropDownList_DataBound(object sender, EventArgs e)
    {
        DeptconDropDownList.Items.Insert(0, new ListItem("-- Select Department of Concentration --", "0"));
    }
    protected void ConDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ConDropDownList_DataBound(object sender, EventArgs e)
    {
        ConDropDownList.Items.Insert(0, new ListItem("-- Select Unit of Concentration --", "0"));
    }
    protected void UnitDropDownList_DataBound(object sender, EventArgs e)
    {
      UnitDropDownList.Items.Insert(0, new ListItem("-- Select Your Unit --", "0"));
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        IDTextBox.Focus();
        IDTextBox.Text = "";
        NameTextBox.Text = "";
        UnitDropDownList.SelectedIndex = -1;
        Idea_TextTextBox.Text = "";
        DeptconDropDownList.SelectedIndex = -1;
        ConDropDownList.SelectedIndex = -1;
       
    }
}
