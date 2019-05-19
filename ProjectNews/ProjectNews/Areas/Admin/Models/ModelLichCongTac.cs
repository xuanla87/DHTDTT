using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectNews.Areas.Admin.Models
{
    public class ModelLichCongTac
    {
        public long Id { get; set; }
        public long? ParentId { get; set; }
        [Required]
        public string Name { get; set; }
        public string Body { get; set; }
        public string Link { get; set; }
    }
}