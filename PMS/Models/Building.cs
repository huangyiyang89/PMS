using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS.Models
{
    public class Building
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int BottomFloor { get; set; }
        public int TopFloor { get; set; }
        public int DoorsEachFloor { get; set; }
        public virtual List<BuildingProgress> BuildingProgresses { get; set; }

        public int ProjectId{ get;set;}
        public virtual  Project Project { get; set; }

    }
}