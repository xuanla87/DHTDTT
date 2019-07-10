namespace ServiceNews.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    [Table("RoleFunctions")]
    public partial class RoleFunction
    {
        [Key]
        public int Id { get; set; }
        public string UserName { get; set; }
        public string CodeFunction { get; set; }
        public string NameFunction { get; set; }
        public bool ActionAdd { get; set; }
        public bool ActionEdit { get; set; }
        public bool ActionDelete { get; set; }
        public bool ActionAdmin { get; set; }
    }
}
