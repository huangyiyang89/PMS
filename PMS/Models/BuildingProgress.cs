using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS.Models
{
    public class BuildingProgress
    {
        public int Id{get;set;}
        public string Progress{get;set;}
        public int FromFloor{get;set;}
        public int ToFloor{ get;set;}
        public int BuildingId{ get;set;}
        public virtual  Building Building{ get;set;}
    }
}