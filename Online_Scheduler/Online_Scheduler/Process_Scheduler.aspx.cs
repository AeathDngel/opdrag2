using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;

namespace Online_Scheduler
{
    public partial class Process_Scheduler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbxProcesses.Items.Clear();
            lblDisplay.Text = "";

            string connectionString;
            SqlConnection cnn;

            connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename="+ System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Substring(6).Replace("bin", "App_Data") +"\\Process_DB.mdf;Integrated Security=True";
              
            cnn = new SqlConnection(connectionString);

            SqlCommand command;

            SqlDataReader reader;

            string sql = "";

            sql = "SELECT process_name, process_start, process_time FROM process_info ORDER BY process_start ASC";

            command = new SqlCommand(sql, cnn);

            cnn.Open();

            reader = command.ExecuteReader();





            int nrRows = 0;

            while (reader.Read())
            {
                nrRows++;
            }

            Session["RowCount"] = nrRows;

            Task[] tasks = new Task[nrRows];

            reader.Close();

            SqlDataReader reader2;

            reader2 = command.ExecuteReader();

            int counter = 0;

            while (reader2.Read())
            {

                string name = reader2.GetValue(0).ToString();
                string start = reader2.GetValue(1).ToString();
                string time = reader2.GetValue(2).ToString();

                lbxProcesses.Items.Add("Name: " + name + ",        Start: " + start + ",        Time: " + time);
                tasks[counter] = new Task(name, Convert.ToInt32(start), Convert.ToInt32(time));
                //lblDisplay.Text += tasks[counter].GetName();
                counter++;
            }

            Session["Tasks"] = tasks;

            reader2.Close();
            command.Dispose();
            cnn.Close();

           
            
        }

        protected void btnStep_Click(object sender, EventArgs e)
        {

            Step();
        }



        private void Step()
        {
            int currentTime = int.Parse(lblCurrentTime.Text) + 1;
            lblCurrentTime.Text = currentTime.ToString();
            Session["CurrentTime"] = currentTime;

            Task[] tasks = (Task[])Session["Tasks"];

            int rowCount = Convert.ToInt32(Session["RowCount"]);

            List<int> newTasks = GetNewTasks(tasks, rowCount);

            for (int i = 0; i < newTasks.Count; i++)
            {
                lbxQ1.Items.Add(tasks[newTasks[i]].GetName() + ", Time: " + tasks[newTasks[i]].GetTime());
            }

            GetNextProcessInfo();
        }



        private List<int> GetNewTasks(Task[] pTasks, int nrOfTasks)
        {
            List<int> indexes = new List<int>();
            int time = Convert.ToInt32(Session["CurrentTime"]);

            for (int i = 0; i < pTasks.Length; i++)
            {
                if (pTasks[i].GetStartTime() == time)
                {
                    indexes.Add(i);
                }
            }

            return indexes;
        }




        private void GetNextProcessInfo()
        {
            int currentQ = Convert.ToInt32(Session["CurrentQ"]);
            int currentTask = Convert.ToInt32(Session["CurrentTask"]);

            if (Session["CurrentTask"] == null)
            {
                currentTask = 0;
                Session["CurrentTask"] = currentTask;
            }

            if (Session["CurrentQ"] == null)
            {
                currentQ = 1;
                Session["CurrentQ"] = currentQ;
                
            }

            

            //if (Convert.ToInt32(Session["CurrentTime"]) != 1)
            //{
                runTask(currentTask, currentQ);
            //}


        }

        public void runTask(int curTask, int curQ)
        {
            try
            {
                if (curQ == 1)
                {
                    int quanta = Convert.ToInt32(Session["Q1"]);
                    string item = lbxQ1.Items[curTask].Text;
                    string noTime = item.Remove(item.LastIndexOf(' ') + 1);
                    int time = Convert.ToInt32(item.Substring(item.LastIndexOf(' ') + 1));
                    //Response.Write(time.ToString());

                    time -= 1;
                    int timeRan = Convert.ToInt32(Session["TimeRan"]);
                    timeRan += 1;
                    Session["TimeRan"] = timeRan;

                    lbxQ1.Items[curTask].Text = item = noTime + "" + time;

                    //int curTime = Convert.ToInt32(Session["CurrentTime"]) + quanta - 1;
                    //Session["CurrentTime"] = curTime.ToString();
                    //lblCurrentTime.Text = curTime.ToString();

                    Console.Write(timeRan);

                    if (time <= 0)
                    {
                        lbxCompleted.Items.Add(item.Remove(item.IndexOf(",")) + " - Finished at: " + lblCurrentTime.Text);
                        lbxQ1.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                    else if (Convert.ToInt32(Session["TimeRan"]) == quanta)
                    {
                        item = noTime + "" + time;
                        lbxQ2.Items.Add(item);
                        lbxQ1.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                }
                //Q 2//
                else if (curQ == 2)
                {
                    int quanta = Convert.ToInt32(Session["Q2"]);
                    string item = lbxQ2.Items[curTask].Text;
                    string noTime = item.Remove(item.LastIndexOf(' ') + 1);
                    int time = Convert.ToInt32(item.Substring(item.LastIndexOf(' ') + 1));
                    //Response.Write(time.ToString());

                    time -= 1;
                    int timeRan = Convert.ToInt32(Session["TimeRan"]);
                    timeRan += 1;
                    Session["TimeRan"] = timeRan;

                    lbxQ2.Items[curTask].Text = item = noTime + "" + time;

                    //int curTime = Convert.ToInt32(Session["CurrentTime"]) + quanta - 1;
                    //Session["CurrentTime"] = curTime.ToString();
                    //lblCurrentTime.Text = curTime.ToString();

                    if (time <= 0)
                    {
                        lbxCompleted.Items.Add(item.Remove(item.IndexOf(",")) + " - Finished at: " + lblCurrentTime.Text);
                        lbxQ2.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                    else if (Convert.ToInt32(Session["TimeRan"]) == quanta)
                    {
                        item = noTime + "" + time;
                        lbxQ3.Items.Add(item);
                        lbxQ2.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                }
                //Q 3//
                else if (curQ == 3)
                {
                    int quanta = Convert.ToInt32(Session["Q3"]);
                    string item = lbxQ3.Items[curTask].Text;
                    string noTime = item.Remove(item.LastIndexOf(' ') + 1);
                    int time = Convert.ToInt32(item.Substring(item.LastIndexOf(' ') + 1));
                    //Response.Write(time.ToString());

                    time -= 1;
                    int timeRan = Convert.ToInt32(Session["TimeRan"]);
                    timeRan += 1;
                    Session["TimeRan"] = timeRan;

                    lbxQ3.Items[curTask].Text = item = noTime + "" + time;

                    //int curTime = Convert.ToInt32(Session["CurrentTime"]) + quanta - 1;
                    //Session["CurrentTime"] = curTime.ToString();
                    //lblCurrentTime.Text = curTime.ToString();

                    if (time <= 0)
                    {
                        lbxCompleted.Items.Add(item.Remove(item.IndexOf(",")) + " - Finished at: " + lblCurrentTime.Text);
                        lbxQ3.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                    else if (Convert.ToInt32(Session["TimeRan"]) == quanta)
                    {
                        item = noTime + "" + time;
                        lbxQ4.Items.Add(item);
                        lbxQ3.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                }
                //Q 4//
                else if (curQ == 4)
                {
                    int quanta = Convert.ToInt32(Session["Q4"]);
                    string item = lbxQ4.Items[curTask].Text;
                    string noTime = item.Remove(item.LastIndexOf(' ') + 1);
                    int time = Convert.ToInt32(item.Substring(item.LastIndexOf(' ') + 1));
                    //Response.Write(time.ToString());

                    time -= 1;
                    int timeRan = Convert.ToInt32(Session["TimeRan"]);
                    timeRan += 1;
                    Session["TimeRan"] = timeRan;

                    lbxQ4.Items[curTask].Text = item = noTime + "" + time;

                    //int curTime = Convert.ToInt32(Session["CurrentTime"]) + quanta - 1;
                    //Session["CurrentTime"] = curTime.ToString();
                    //lblCurrentTime.Text = curTime.ToString();
                    
                    if (time <= 0)
                    {
                        lbxCompleted.Items.Add(item.Remove(item.IndexOf(",")) + " - Finished at: " + lblCurrentTime.Text);
                        lbxQ4.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                    else if (Convert.ToInt32(Session["TimeRan"]) == quanta)
                    {
                        item = noTime + "" + time;
                        lbxQ4.Items.Add(item);
                        lbxQ4.Items.RemoveAt(curTask);
                        Session["TimeRan"] = "0";
                    }
                }
                lblDisplay.Text = (Session["CurrentQ"] + " is Current Q");
            }
            catch (Exception e)
            {
                lblDisplay.Text += e.Message;
                //When Q is empty find next Q
                if(lbxQ1.Items.Count == 0)
                {
                    lblDisplay.Text = "2";
                    Session["CurrentQ"] = 2;
                    lblDisplay.Text = (Session["CurrentQ"] + " is Current Q");

                    if (lbxQ2.Items.Count == 0 && lbxQ1.Items.Count == 0)
                    {
                        lblDisplay.Text = "3";
                        Session["CurrentQ"] = 3;
                        lblDisplay.Text = (Session["CurrentQ"] + " is Current Q");

                        if(lbxQ3.Items.Count == 0 && lbxQ2.Items.Count == 0 && lbxQ1.Items.Count == 0)
                        {
                            lblDisplay.Text = "4";
                            Session["CurrentQ"] = 4;
                            lblDisplay.Text = (Session["CurrentQ"] + " is Current Q");
                        }
                    }
                }
                else if (lbxQ2.Items.Count == 0)
                {
                    lblDisplay.Text = "1";
                    Session["CurrentQ"] = 1;
                    lblDisplay.Text = (Session["CurrentQ"] + " is Current Q");

                    

                }
                                
            }
        }

        protected void sldrQ1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtQ1_TextChanged(object sender, EventArgs e)
        {
            sldrQ2_SliderExtender.Minimum = Convert.ToInt32(txtQ1.Text);
            lblDisplay.Text = "CHANGED! 1";
            txtQ2.Text = txtQ1.Text;
            Session["Q1"] = txtQ1.Text;
        }

        protected void txtQ2_TextChanged(object sender, EventArgs e)
        {
            sldrQ3_SliderExtender.Minimum = Convert.ToInt32(txtQ2.Text);
            lblDisplay.Text = "CHANGED! 2";
            txtQ3.Text = txtQ2.Text;
            Session["Q2"] = txtQ2.Text;
        }

        protected void txtQ3_TextChanged(object sender, EventArgs e)
        {
            sldrQ4_SliderExtender.Minimum = Convert.ToInt32(txtQ3.Text);
            lblDisplay.Text = "CHANGED! 3";
            txtQ4.Text = txtQ3.Text;
            Session["Q3"] = txtQ3.Text;
        }

        protected void txtQ4_TextChanged(object sender, EventArgs e)
        {
            Session["Q4"] = txtQ4.Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString;
            SqlConnection cnn;

            connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\EstianMSI\source\repos\AeathDngel\opdrag2\Online_Scheduler\Online_Scheduler\App_Data\Process_DB.mdf;Integrated Security=True";

            cnn = new SqlConnection(connectionString);

            SqlCommand command;

            SqlDataReader reader;

            string sql = "";

            sql = "DELETE FROM process_info";

            command = new SqlCommand(sql, cnn);

            cnn.Open();

            reader = command.ExecuteReader();

            cnn.Close();

            Response.Redirect("Process_Creator.aspx");
        }
    }    
}