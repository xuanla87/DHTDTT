using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectNews.Areas.Admin.Models
{
    public class ModelDonVi
    {
        public long DonViId { get; set; }

        public long? DonviCha { get; set; }
        [Required]
        public string TenDonVi { get; set; }

        public string Link { get; set; }

        public int ThuTu { get; set; }

    }
}