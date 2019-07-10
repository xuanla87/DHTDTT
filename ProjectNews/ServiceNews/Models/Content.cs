namespace ServiceNews.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    [Table("Contents")]
    public partial class Content
    {
        [Key]
        public long contentId { get; set; }
        public string contentName { get; set; }
        public string contentAlias { get; set; }
        public string contentDescription { get; set; }
        public string contentBody { get; set; }
        public string contentThumbnail { get; set; }
        public long? contentParentId { get; set; }
        public string contentKey { get; set; }
        public DateTime contentCreateTime { get; set; }
        public DateTime contentUpdateTime { get; set; }
        public string contentCreateUser { get; set; }
        public string contentUpdateUser { get; set; }
        public string contentMetaTitle { get; set; }
        public string contentMetaKeywords { get; set; }
        public string contentMetaDescription { get; set; }
        public int contentLanguageId { get; set; }
        public int contentView { get; set; }
        public int isSort { get; set; }
        public bool isTrash { get; set; }
        public bool? isNew { get; set; }
        public string authorize { get; set; }
        public bool? isApproval { get; set; }
    }
    public class ContentView
    {
        public int Total { set; get; }
        public int TotalRecord { set; get; }
        public IEnumerable<Content> ViewContents { set; get; }
    }
    public class DropdownModel
    {
        public string Text { set; get; }
        public long Value { set; get; }
        public bool IsSelect { get; set; }
    }
}
