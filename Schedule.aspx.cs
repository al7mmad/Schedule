using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Schedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TableGeneration_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

        e.Command.Parameters[0].Value = this.User.Identity.Name;

    }
}