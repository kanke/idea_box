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
using System.Data.SqlClient;
using System.Data.Sql;
using CarlosAg.ExcelXmlWriter;
using System.IO;
using System.Text;

public partial class report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        textDiv.Visible = false;

        dset = new DataTable();
        string conn = ConfigurationManager.ConnectionStrings["IdeaConnectionString"].ConnectionString;

        string sql = @"SELECT i.date
                    ,i.staff_id
                    ,i.staff_name
	                ,i.staff_unit_id      
	                ,i.idea_text
	                ,d.dept_name
	                ,u.unit_name
    
    
        from idea.idea_box i
        inner join idea.idea_dept d on i.dept_id = d.dept_id
        inner join idea.idea_unit u on i.concen_unit = u.unit_id
        order by i.staff_id,i.idea_text";

        SqlConnection connection = new SqlConnection(conn);
        SqlCommand selectcommand = new SqlCommand(sql, connection);

        SqlDataAdapter adap = new SqlDataAdapter(selectcommand);
        adap.Fill(dset);

        //fill dataset into gridview
        GridView1.DataSource = dset;

        //bind data to gridview nd display.
        GridView1.DataBind();
    }
    protected void SearchFieldDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (SearchFieldDropDown.SelectedValue == "date")
        {
            dateDiv.Visible = true;
            dateCompareValidator.Enabled = true;
            fromdateValidator.Enabled = true;
            todateValidator.Enabled = true;

            textDiv.Visible = false;
        }
        else
        {
            dateDiv.Visible = false;
            dateCompareValidator.Enabled = false;
            fromdateValidator.Enabled = false;
            todateValidator.Enabled = false;

            textDiv.Visible = true;
        }
    }

    protected DataTable dset
    {
        set
        {
            ViewState["dset"] = value;
        }
        get
        {
            return (ViewState["dset"] != null) ? (DataTable)ViewState["dset"] : new DataTable();
        }
    }


    protected void searchButton_Click(object sender, EventArgs e)
    {
        DisplayResults();
        searchTextBox.Text = "";
        fromTextBox.Text = "";
        toTextBox.Text = "";
    }

    private void DisplayResults()
    {
        //this method calls the getData metod and binds the data to the gridview
        GridView1.DataSource = GetData();
        GridView1.DataBind();

    }

     private DataTable GetData()
    {
        dset = new DataTable();
        string conn = ConfigurationManager.ConnectionStrings["IdeaConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(conn);

        string sql = @"SELECT i.date
                    ,i.staff_id
                    ,i.staff_name
	                ,i.staff_unit_id      
	                ,i.idea_text
	                ,d.dept_name
	                ,u.unit_name
    
        from idea.idea_box i
        inner join idea.idea_dept d on i.dept_id = d.dept_id
        inner join idea.idea_unit u on i.concen_unit = u.unit_id";

        switch (SearchFieldDropDown.SelectedValue)
        {
            case "staff_id":
            case "staff_name":
            case "staff_unit_id":
            case "idea_text":
                //op = "like";
                //searchField = "%" + searchField + "%";
                //convert = true;
                sql += " where " + SearchFieldDropDown.SelectedValue + " like '%" + searchTextBox.Text + "%'";
                break;
            case "date":
                //searchField = "'" + searchField + "'";
                sql += " where " + SearchFieldDropDown.SelectedValue + " between '" + fromTextBox.Text + "' and '" + toTextBox.Text + "'";
                //op = " <= ";
                break;
            case "dept_id":
            case "concen_unit":
                //op = "=";
                sql += " where " + SearchFieldDropDown.SelectedValue + " = " + searchTextBox.Text;
                break;
        }
        SqlCommand selectcommand = new SqlCommand(sql, connection);

        //selectcommand.Parameters.AddWithValue("@fromdate", fromTextBox.Text);
        //selectcommand.Parameters.AddWithValue("@todate", toTextBox.Text);

        connection.Open();

        SqlDataAdapter adap = new SqlDataAdapter(selectcommand);
        adap.Fill(dset);

        return dset;
    }

     protected void Button1_Click(object sender, EventArgs e)
     {
         textDiv.Visible = false;
         SearchFieldDropDown.Focus();
         searchTextBox.Text = "";
         fromTextBox.Text = "";
         toTextBox.Text = "";
      
     }
     protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
     {
         //calling the method Export Ex
         ExportEx();
     }

     private void ExportEx()
     {
         DataTable dt = GetData();

         Workbook book = new Workbook();

         //name the worksheet
         Worksheet sheet = book.Worksheets.Add("Idea_Box_Report");

         //create header styles
         WorksheetStyle style = book.Styles.Add("HeaderStyle");
         style.Font.FontName = "Tahoma";
         style.Font.Size = 14;
         style.Font.Bold = true;
         style.Alignment.Horizontal = StyleHorizontalAlignment.Center;
         style.Font.Color = "White";
         style.Interior.Color = "Blue";
         style.Interior.Pattern = StyleInteriorPattern.DiagCross;

         //Create the Default Style to use for everyone
         style = book.Styles.Add("Default");
         style.Font.FontName = "Tahoma";
         style.Font.Size = 10;


         WorksheetRow wsrow = sheet.Table.Rows.Add();
         //foreach (DataColumn TCol in dt.Columns) {

         //add the Excel headers using the header style
         wsrow.Cells.Add("Date", DataType.String, "HeaderStyle");
         wsrow.Cells.Add("Staff ID", DataType.String, "HeaderStyle");
         wsrow.Cells.Add("Staff Name", DataType.String, "HeaderStyle");
         wsrow.Cells.Add("Staff Unit", DataType.String, "HeaderStyle");
         wsrow.Cells.Add("Idea", DataType.String, "HeaderStyle");
         wsrow.Cells.Add("Department of Concen", DataType.String, "HeaderStyle");
         wsrow.Cells.Add("Unit of Concen", DataType.String, "HeaderStyle");

         //add column and row 
         foreach (DataRow Row in dt.Rows)
         {
             wsrow = sheet.Table.Rows.Add();
             foreach (DataColumn TCol in dt.Columns)
             {
                 wsrow.Cells.Add(Row[TCol].ToString());
             }
         }

         //Export the grid data to excel sheet
         Response.ClearContent();
         Response.ClearHeaders();
         Response.ContentType = "application/vnd.ms-excel";

         //name the excel file
         Response.AddHeader("Content-Disposition", "attachment;filename=Idea_Box_Report" + DateTime.Now.ToString("yyyyMMddhhmm") + ".xls");
         book.Save(Response.OutputStream);
         Response.End();
     }
}
