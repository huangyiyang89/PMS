using PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.Draw
{
    public partial class Building : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ASPxGridView1.DataSource=Session["results"];
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
            var db = new Db();
            var project = db.Projects.Find(id);
            //抽取户数
            var n = Convert.ToInt32(ASPxSpinEdit1.Value);


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

            //抽取数量大于可选数量，返回全部
            if (n >= all.Count)
            {

            }
            else
            {
                while (results.Count < n)
                {
                    foreach (var buiding in project.Buildings)
                    {
                        var draw = all.Where(r => r.Building == buiding).OrderBy(t => Guid.NewGuid()).FirstOrDefault();
                        if (draw != null)
                        {
                            results.Add(draw);
                            all.Remove(draw);
                        }
                        if (results.Count >= n)
                        {
                            break;
                        }
                    }
                }

            }

            results=results.OrderBy(r=>r.Building.Id).ToList();
            var tempIndex=1;
            results.ForEach(r=>r.Index=tempIndex++);
            ASPxGridView1.Visible = true;
            ASPxGridView1.DataSource = results;
            Session["results"]=results;
            ASPxGridView1.DataBind();
            return;


        }




        protected void Draw1(Models.Project project)
        {

        }
    }
}