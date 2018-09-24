using DevExpress.Web;
using PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.Draw
{
    public partial class Progress : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ASPxGridView1.DataSource = Session["results"];
                ASPxGridView1.DataBind();
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            var id = Convert.ToInt32(ASPxComboBox1.Value);
            if (id == 0)
            {
                return;
            }

            var dict = new Dictionary<string, int>();

            foreach (RepeaterItem r in Repeater1.Controls)
            {
                ASPxSpinEdit spin = (ASPxSpinEdit)r.Controls[1];
                dict.Add(spin.Caption, Convert.ToInt32(spin.Value));
            }



            var db = new Db();
            var project = db.Projects.Find(id);




            var results = new List<DrawResult>();

            var ran = new Random();
            var all = new List<DrawResult>();

            foreach (var buiding in project.Buildings)
            {
                foreach (var progress in buiding.BuildingProgresses)
                {
                    for (var i = progress.FromFloor; i <= progress.ToFloor; i++)
                    {
                        for (var j = 1; j <= buiding.DoorsEachFloor; j++)
                        {
                            all.Add(new DrawResult() { Building = buiding, Floor = i, Door = j, Progress = progress.Progress });
                        }
                    }
                }
            }

            all = all.OrderBy(p => Guid.NewGuid()).ToList();

            foreach (var progressDrawCount in dict)
            {
                var atMost = all.Where(r => r.Progress == progressDrawCount.Key).Count();
                var count = atMost < progressDrawCount.Value ? atMost : progressDrawCount.Value;
                while(results.Where(r => r.Progress == progressDrawCount.Key).Count() < count)
                {
                    foreach (var building in project.Buildings)
                    {
                        var draw = all.FirstOrDefault(p => p.Building == building && p.Progress == progressDrawCount.Key);
                        if (draw != null)
                        {
                            results.Add(draw);
                            all.Remove(draw);
                        }
                    }
                }
            }

            var tempIndex = 1;
            results.ForEach(r => r.Index = tempIndex++);
            ASPxGridView1.Visible = true;
            ASPxGridView1.DataSource = results;
            Session["results"] = results;
            ASPxGridView1.DataBind();
            return;


        }



        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var progressList = new List<string>();
            var id = Convert.ToInt32(ASPxComboBox1.Value);
            var db = new Db();
            var project = db.Projects.Find(id);
            project.Buildings.ForEach(b => b.BuildingProgresses.ForEach(p => progressList.Add(p.Progress)));
            progressList = progressList.Distinct().ToList();
            Repeater1.DataSource = progressList;
            Session["progressList"] = progressList;
            Repeater1.DataBind();
        }
    }
}