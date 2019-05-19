using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectNews.Areas.Admin.Models
{
    public class ModelCaiDatHeThong
    {
        public int? DanhMucChinh { get; set; }
        public string SiteTitle { get; set; }
        public string SiteKeywords { get; set; }
        public string SiteDescription { get; set; }
        public string SiteBanner { get; set; }
        public string SiteFooterInfo { get; set; }
        public string SiteEmail { get; set; }
        public string SiteContact { get; set; }
        public int? BoxTinTucChung { get; set; }
        public int? BoxTinTucNganh { get; set; }
        public int? BoxSachVaHocLieu { get; set; }
        public int? BoxLienKet { get; set; }
        public int? BoxPhongSuAnh { get; set; }
        public int? BoxMedia { get; set; }
    }
}