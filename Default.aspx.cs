using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Data;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int CourseCount, i, j;
        DateTime StartTime, EndTime, SelectedStartTime, SelectedEndTime;
        String Day, SelectedDay, CourseName;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();

        SqlCommand cmd = new SqlCommand("select Count(*) AS CourseCount from Selection where StudentId='" + User.Identity.Name + "'", con);
        SqlDataReader r = cmd.ExecuteReader();
        if (r.Read())
        {
            j = 0;
            SelectedStartTime = Convert.ToDateTime(GridView1.SelectedRow.Cells[6].Text);
            SelectedEndTime = Convert.ToDateTime(GridView1.SelectedRow.Cells[7].Text);
            SelectedDay = GridView1.SelectedRow.Cells[5].Text;
            CourseCount = Convert.ToInt32(r["CourseCount"])-1;


            for (i= CourseCount; i>=0;i--) {
                StartTime = Convert.ToDateTime(GridView2.Rows[i].Cells[6].Text);
                EndTime = Convert.ToDateTime(GridView2.Rows[i].Cells[7].Text);
                Day = GridView2.Rows[i].Cells[5].Text;

                if (
                    ((SelectedDay.Contains('U')) && (Day.Contains('U'))) ||
                    ((SelectedDay.Contains('M')) && (Day.Contains('M'))) ||
                    ((SelectedDay.Contains('T')) && (Day.Contains('T'))) ||
                    ((SelectedDay.Contains('W')) && (Day.Contains('W'))) ||
                    ((SelectedDay.Contains('R')) && (Day.Contains('R')))
                    )
                {
                    if (
                    ((SelectedStartTime.TimeOfDay) >= (StartTime.TimeOfDay)) && ((SelectedStartTime.TimeOfDay) <= (EndTime.TimeOfDay)) ||
                    ((SelectedEndTime.TimeOfDay) >= (StartTime.TimeOfDay)) && ((SelectedEndTime.TimeOfDay) <= (EndTime.TimeOfDay)) ||
                    ((SelectedStartTime.TimeOfDay) >= (StartTime.TimeOfDay)) && ((SelectedEndTime.TimeOfDay) <= (EndTime.TimeOfDay)) ||
                    ((SelectedStartTime.TimeOfDay) <= (StartTime.TimeOfDay)) && ((SelectedEndTime.TimeOfDay) >= (EndTime.TimeOfDay))
                    ) {
                        Label4.Text = "Cannot be added because there is a conflict with your added courses!";
                        j = 1;
                        break;
                    }
                }
            }
            
            if (j == 0) {

                if (SelectedDay.Contains('U')) {
                    SelectedStartTime = new DateTime(2020, 1, 19, SelectedStartTime.Hour, SelectedStartTime.Minute, 0);
                    SelectedEndTime = new DateTime(2020, 1, 19, SelectedEndTime.Hour, SelectedEndTime.Minute, 0);
                    CourseName = GridView1.SelectedRow.Cells[1].Text + " " + GridView1.SelectedRow.Cells[4].Text + " | " + SelectedStartTime.TimeOfDay.ToString() + "-" + SelectedEndTime.TimeOfDay.ToString();
                    AddingCoursesToSchedule(CourseName, SelectedStartTime, SelectedEndTime);
                }
                if (SelectedDay.Contains('M'))
                {
                    SelectedStartTime = new DateTime(2020, 1, 20, SelectedStartTime.Hour, SelectedStartTime.Minute, 0);
                    SelectedEndTime = new DateTime(2020, 1, 20, SelectedEndTime.Hour, SelectedEndTime.Minute, 0);
                    CourseName = GridView1.SelectedRow.Cells[1].Text + " " + GridView1.SelectedRow.Cells[4].Text + " | "  + SelectedStartTime.TimeOfDay.ToString() + "-" + SelectedEndTime.TimeOfDay.ToString();
                    AddingCoursesToSchedule(CourseName, SelectedStartTime, SelectedEndTime);
                }
                if (SelectedDay.Contains('T'))
                {
                    SelectedStartTime = new DateTime(2020, 1, 21, SelectedStartTime.Hour, SelectedStartTime.Minute, 0);
                    SelectedEndTime = new DateTime(2020, 1, 21, SelectedEndTime.Hour, SelectedEndTime.Minute, 0);
                    CourseName = GridView1.SelectedRow.Cells[1].Text + " " + GridView1.SelectedRow.Cells[4].Text + " | " + SelectedStartTime.TimeOfDay.ToString() + "-" + SelectedEndTime.TimeOfDay.ToString();
                    AddingCoursesToSchedule(CourseName, SelectedStartTime, SelectedEndTime);
                }
                if (SelectedDay.Contains('W'))
                {
                    SelectedStartTime = new DateTime(2020, 1, 22, SelectedStartTime.Hour, SelectedStartTime.Minute, 0);
                    SelectedEndTime = new DateTime(2020, 1, 22, SelectedEndTime.Hour, SelectedEndTime.Minute, 0);
                    CourseName = GridView1.SelectedRow.Cells[1].Text + " " + GridView1.SelectedRow.Cells[4].Text + " | " + SelectedStartTime.TimeOfDay.ToString() + "-" + SelectedEndTime.TimeOfDay.ToString();
                    AddingCoursesToSchedule(CourseName, SelectedStartTime, SelectedEndTime);
                }
                if (SelectedDay.Contains('R'))
                {
                    SelectedStartTime = new DateTime(2020, 1, 23, SelectedStartTime.Hour, SelectedStartTime.Minute, 0);
                    SelectedEndTime = new DateTime(2020, 1, 23, SelectedEndTime.Hour, SelectedEndTime.Minute, 0);
                    CourseName = GridView1.SelectedRow.Cells[1].Text + " " + GridView1.SelectedRow.Cells[4].Text + " | " + SelectedStartTime.TimeOfDay.ToString() + "-" + SelectedEndTime.TimeOfDay.ToString();
                    AddingCoursesToSchedule(CourseName, SelectedStartTime, SelectedEndTime);
                }

                SqlConnection con1 = new SqlConnection();
                con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con1.Open();

                SqlCommand cmd2 = new SqlCommand("AddingSelection", con1);
                cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@CourseId", GridView1.SelectedRow.Cells[0].Text);
                cmd2.Parameters.AddWithValue("@StudentId", User.Identity.Name);
                cmd2.ExecuteNonQuery();
                Label4.Text = "Course added!";
                GridView2.DataBind();
            }

        }



    }
    protected void SelectionGridView_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        
        e.Command.Parameters[0].Value = this.User.Identity.Name;
        
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();

        SqlCommand cmd = new SqlCommand("DELETE FROM Selection WHERE StudentId='" + User.Identity.Name + "' AND CourseId='" + GridView2.SelectedRow.Cells[0].Text + "'", con);
        SqlCommand cmd1 = new SqlCommand("DELETE FROM Schedule WHERE StudentId='" + User.Identity.Name + "' AND CourseId='" + GridView2.SelectedRow.Cells[0].Text + "'", con);

        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        GridView2.DataBind();
    }
    public void AddingCoursesToSchedule(String CourseName, DateTime SelectedStartTime, DateTime SelectedEndTime)
    {
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con1.Open();

        SqlCommand cmd1 = new SqlCommand("AddToScheduleTable", con1);
        cmd1.CommandType = System.Data.CommandType.StoredProcedure;
        cmd1.Parameters.AddWithValue("@CourseId", GridView1.SelectedRow.Cells[0].Text);
        cmd1.Parameters.AddWithValue("@StudentId", User.Identity.Name);
        cmd1.Parameters.AddWithValue("@CourseName", CourseName);
        cmd1.Parameters.AddWithValue("@StartTime", SelectedStartTime);
        cmd1.Parameters.AddWithValue("@EndTime", SelectedEndTime);
        cmd1.ExecuteNonQuery();
        Label4.Text = "Course added!";
        GridView2.DataBind();
    }

    protected void Generate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Schedule.aspx");
    }
}

