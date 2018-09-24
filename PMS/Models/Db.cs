
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace PMS.Models
{
    public class Db : DbContext
    {
        public Db():base("Data Source=123.207.153.254;Initial Catalog=PMS;Integrated Security=False;Persist Security Info=False;User ID=sa;Password=Asd-19890811")
        {

        }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<Building> Buildings { get; set; }
        public virtual DbSet<BuildingProgress> BuildingProgresses { get; set; }
        public virtual DbSet<ProgressList> ProgressLists{get;set;}

        
    }
    //Data Source=123.207.153.254;Initial Catalog=PMS;Integrated Security=False;Persist Security Info=False;User ID=sa;Password=Asd-19890811
}