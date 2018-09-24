using PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.Draw
{
    public partial class All : System.Web.UI.Page
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



            var count = 0;
            foreach (var buiding in project.Buildings)
            {
                foreach (var progress in buiding.BuildingProgresses)
                {
                    for (var i = progress.FromFloor; i <= progress.ToFloor; i++)
                    {
                        for (var j = 1; j <= buiding.DoorsEachFloor; j++)
                        {
                            count++;
                        }
                    }
                }
            }
            var ran = new Random();
            var ranList = new List<int>();
            if (count <= n)
            {
                //户数小于抽取户数
                for(var i = 1; i <= count; i++)
                {
                    ranList.Add(i);
                }
            }
            else
            {
                while (ranList.Count < n)
                {
                    ranList.Add(ran.Next(1, count));
                    ranList.Distinct();
                }
            }
            ranList.Sort();

            count = 0;
            foreach (var buiding in project.Buildings)
            {
                foreach (var progress in buiding.BuildingProgresses)
                {
                    for (var i = progress.FromFloor; i <= progress.ToFloor; i++)
                    {
                        for (var j = 1; j <= buiding.DoorsEachFloor; j++)
                        {
                            count++;
                            if (count == ranList[0])
                            {
                                var result = new DrawResult()
                                {
                                    Building = buiding,
                                    Floor = i,
                                    Door=j,
                                    Progress=progress.Progress
                                };
                                results.Add(result);
                                ranList.RemoveAt(0);
                                if (ranList.Count == 0)
                                {
                                    var tempIndex=1;
                                    results.ForEach(r=>r.Index=tempIndex++);
                                    ASPxGridView1.Visible=true;
                                    ASPxGridView1.DataSource=results;
                                    Session["results"]=results;
                                    ASPxGridView1.DataBind();
                                    return;
                                }
                            }
                        }
                    }
                }
            }


            
        }
        

    }
}