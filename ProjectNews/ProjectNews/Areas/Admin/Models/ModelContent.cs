using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectNews.Areas.Admin.Models
{
    public class ModelContent
    {
        public long contentId { get; set; }
        [Required]
        public string contentName { get; set; }
        [Required]
        public string contentAlias { get; set; }
        public string contentDescription { get; set; }
        public string contentBody { get; set; }
        public string contentThumbnail { get; set; }
        public long? contentParentId { get; set; }
        public string contentKey { get; set; }
        public string contentCreateTime { get; set; }
        public string contentCreateUser { get; set; }
        public string contentUpdateUser { get; set; }
        public string contentMetaTitle { get; set; }
        public string contentMetaKeywords { get; set; }
        public string contentMetaDescription { get; set; }
        public int contentLanguageId { get; set; }
        public int contentView { get; set; }
        public int isSort { get; set; }
        public bool isTrash { get; set; }
        public bool isNew { get; set; }
        public bool isApproval { get; set; }
        public bool isFeature { get; set; }
        public string authorize { get; set; }
    }
}