using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace PMS.Models
{
    public class DrawResult
    {
        public int Id { get; set; }

        public int Index { get; set; }
        [DefaultValue(typeof(DateTime), "")]
        public DateTime Time { get; set; }

        public Building Building { get; set; }

        public int Floor { get; set; }
        public int Door { get; set; }

        public string Progress { get; set; }

    }
}