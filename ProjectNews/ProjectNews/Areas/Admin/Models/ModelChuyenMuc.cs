using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectNews.Areas.Admin.Models
{
    public class ModelChuyenMuc
    {
        public long Id { get; set; }
        public long? ParentId { get; set; }
        [Required]
        public string Name { get; set; }
        public string Link { get; set; }
        public string MetaKeywords { get; set; }
        public string MetaDescription { get; set; }
        public string MetaTitle { get; set; }
        public string Note { get; set; }
        public string Thumbnail { get; set; }
    }
}