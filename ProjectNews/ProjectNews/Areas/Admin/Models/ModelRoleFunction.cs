using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectNews.Areas.Admin.Models
{
    public class ModelRoleFunction
    {
        public string UserName { get; set; }
        public string FullName { get; set; }
        public int IdNews { get; set; }
        public bool FunctionAddNews { get; set; }
        public bool FunctionEditNews { get; set; }
        public bool FunctionDeleteNews { get; set; }
        public bool FunctionAdminNews { get; set; }
        public int IdCalendar { get; set; }
        public bool FunctionAddCalendar { get; set; }
        public bool FunctionEditCalendar { get; set; }
        public bool FunctionDeleteCalendar { get; set; }
        public bool FunctionAdminCalendar { get; set; }
        public int IdTrained { get; set; }
        public bool FunctionAddTrained { get; set; }
        public bool FunctionEditTrained { get; set; }
        public bool FunctionDeleteTrained { get; set; }
        public bool FunctionAdminTrained { get; set; }
        public int IdDocument { get; set; }
        public bool FunctionAddDocument { get; set; }
        public bool FunctionEditDocument { get; set; }
        public bool FunctionDeleteDocument { get; set; }
        public bool FunctionAdminDocument { get; set; }
        public int IdMedia { get; set; }
        public bool FunctionAddMedia { get; set; }
        public bool FunctionEditMedia { get; set; }
        public bool FunctionDeleteMedia { get; set; }
        public bool FunctionAdminMedia { get; set; }

        public int ChuyenMucDonViId { get; set; }
    }
}