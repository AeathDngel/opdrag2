using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Scheduler
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                      
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connectionString;
            SqlConnection cnn;

            //connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Substring(6).Replace("bin", "App_Data") + "\\Process_DB.mdf;Integrated Security=True";

            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            //connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Process_DB.mdf;Integrated Security=True";

            //connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Process_DB; Integrated Security=SSPI; User Id= sa; Password= Password123";

            cnn = new SqlConnection(connectionString);

            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql = "";
            int id = gviewProcess.Rows.Count + 1;
            sql = "INSERT INTO process_info (process_id, process_name, process_start, process_time) VALUES ("+id+", '" + txtName.Text + "', " + int.Parse(txtStart.Text) + ", " + int.Parse(txtTime.Text) + ")";

            cnn.Open();

            command = new SqlCommand(sql, cnn);

            adapter.InsertCommand = new SqlCommand(sql, cnn);
            adapter.InsertCommand.ExecuteNonQuery();

            command.Dispose();

            cnn.Close();

            txtName.Text = "";
            txtStart.Text = "";
            txtTime.Text = "";

            gviewProcess.DataBind();
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Process_Scheduler.aspx");
        }
    }
}