﻿namespace ServiceNews.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using Microsoft.AspNet.Identity.EntityFramework;
    using ServiceNews.Models;
    public class NewDbContext : DbContext
    {
        public NewDbContext() : base("DefaultConnection")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }
        public DbSet<Content> Contents { set; get; }
        public DbSet<Contact> Contacts { set; get; }
        public DbSet<Menu> Menus { set; get; }
        public DbSet<ConfigSystem> ConfigSystems { set; get; }
        public DbSet<LogSystem> LogSystems { set; get; }
        public DbSet<RoleFunction> RoleFunctions { set; get; }
        public static NewDbContext Create()
        {
            return new NewDbContext();
        }
        protected override void OnModelCreating(DbModelBuilder builder)
        {

        }
    }
}
