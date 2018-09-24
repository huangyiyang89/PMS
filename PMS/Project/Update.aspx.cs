using DevExpress.Web;
using PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.Project
{
    public partial class Update : System.Web.UI.Page
    {
        private const string DataObjectName = "Project";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ASPxFormLayout1.DataSource = GetData();
                ASPxFormLayout1.DataBind();
            }
        }
        protected void DetailGrid_DataSelect(object sender, EventArgs e)
        {
            Session["BuildingId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            (sender as ASPxGridView).ForceDataRowType(typeof(BuildingProgress));

        }

        protected void ASPxGridView1_DataBinding(object sender, EventArgs e)
        {
            ASPxGridView1.ForceDataRowType(typeof(Building));
        }
        protected void ASPxGridView2_DataBinding(object sender, EventArgs e)
        {
            ASPxGridView2.ForceDataRowType(typeof(BuildingProgress));
        }
        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["ProjectId"] = Convert.ToInt32(Request.QueryString["Id"]);
        }


        private Models.Project GetData()
        {
            var id = Convert.ToInt32(Request.QueryString["Id"]);
            var db = new Db();
            var project = db.Projects.Find(id);
            if (project != null)
            {
                return project;
            }
            else
            {
                Response.StatusCode = 404;
                Response.Status = "404 Not Found";
                Response.End();
                return null;
            }
        }
    }
}