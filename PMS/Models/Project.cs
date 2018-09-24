using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS.Models
{
    public class Project
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Section { get; set; }
        
        //总包单位
        public string GeneralContractor { get; set; }
        //总包负责人
        public string GeneralContractorPIC { get; set; }
        //监理单位
        public string Supervisor { get; set; }
        //监理负责人
        public string SupervisorPIC { get; set; }
        //标段简介
        public string Introduction { get; set; }
        //面积
        public string Area { get; set; }
        //交付计划
        public string Delivery { get; set; }
        public virtual  List<Building> Buildings { get; set; }

    }
}