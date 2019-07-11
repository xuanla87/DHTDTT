using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using ProjectNews.Areas.Admin.Models;
using ProjectNews.Models;
using ServiceNews.Models;
using ServiceNews.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class PhongBanController : Controller
    {
        private IRoleFunctionServices _services;
        public PhongBanController(IRoleFunctionServices services)
        {
            _services = services;
        }
        public ActionResult Index()
        {
            var rm = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
            var model = rm.Roles;
            return View(model);
        }

        [HttpGet]
        public ActionResult Detail()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Detail(string maPhongBan)
        {
            if (!string.IsNullOrEmpty(maPhongBan))
            {
                if (!RoleExists(maPhongBan))
                {
                    var rm = new RoleManager<IdentityRole>(
               new RoleStore<IdentityRole>(new ApplicationDbContext()));
                    var idResult = rm.Create(new IdentityRole(maPhongBan));
                }
            }
            return View();
        }

        private bool RoleExists(string roleName)
        {
            var rm = new RoleManager<IdentityRole>(
               new RoleStore<IdentityRole>(new ApplicationDbContext()));
            return rm.RoleExists(roleName);
        }

        public ActionResult Role(string roleName)
        {
            if (!string.IsNullOrEmpty(roleName) && RoleExists(roleName))
            {
                var entity = _services.GetByUserName(roleName);
                ModelRoleFunction model = new ModelRoleFunction();
                model.UserName = roleName;
                var _News = _services.GetByUserNameCode(model.UserName, "TINTUC");
                var _Document = _services.GetByUserNameCode(model.UserName, "DOCUMENT");
                var _Media = _services.GetByUserNameCode(model.UserName, "MEDIA");
                var _Caledar = _services.GetByUserNameCode(model.UserName, "CALENDAR");
                var _Trained = _services.GetByUserNameCode(model.UserName, "TRAINED");
                if (_Trained != null)
                {
                    model.IdTrained = _Trained.Id;
                    model.FunctionAdminTrained = _Trained.ActionAdmin;
                    model.FunctionEditTrained = _Trained.ActionEdit;
                    model.FunctionAddTrained = _Trained.ActionAdd;
                    model.FunctionDeleteTrained = _Trained.ActionDelete;
                }

                if (_Media != null)
                {
                    model.IdMedia = _Media.Id;
                    model.FunctionAdminMedia = _Media.ActionAdmin;
                    model.FunctionEditMedia = _Media.ActionEdit;
                    model.FunctionAddMedia = _Media.ActionAdd;
                    model.FunctionDeleteMedia = _Media.ActionDelete;
                }
                if (_News != null)
                {
                    model.IdNews = _News.Id;
                    model.FunctionAdminNews = _News.ActionAdmin;
                    model.FunctionEditNews = _News.ActionEdit;
                    model.FunctionAddNews = _News.ActionAdd;
                    model.FunctionDeleteNews = _News.ActionDelete;
                }

                if (_Document != null)
                {
                    model.IdDocument = _Document.Id;
                    model.FunctionAdminDocument = _Document.ActionAdmin;
                    model.FunctionEditDocument = _Document.ActionEdit;
                    model.FunctionAddDocument = _Document.ActionAdd;
                    model.FunctionDeleteDocument = _Document.ActionDelete;
                }
                if (_Caledar != null)
                {
                    model.IdCalendar = _Caledar.Id;
                    model.FunctionAdminCalendar = _Caledar.ActionAdmin;
                    model.FunctionEditCalendar = _Caledar.ActionEdit;
                    model.FunctionAddCalendar = _Caledar.ActionAdd;
                    model.FunctionDeleteCalendar = _Caledar.ActionDelete;
                }
                return View(model);
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Role(ModelRoleFunction model)
        {
            if (ModelState.IsValid)
            {
                var _News = new RoleFunction();
                _News.UserName = model.UserName;
                _News.NameFunction = "Tin tức";
                _News.CodeFunction = "TINTUC";
                _News.ActionEdit = model.FunctionEditNews;
                _News.ActionAdd = model.FunctionAddNews;
                _News.ActionDelete = model.FunctionDeleteNews;
                _News.ActionAdmin = model.FunctionAdminNews;
                _News.Id = model.IdNews;
                _services.Add(_News);
                var _Document = new RoleFunction();
                _Document.UserName = model.UserName;
                _Document.NameFunction = "Văn bản";
                _Document.CodeFunction = "DOCUMENT";
                _Document.ActionEdit = model.FunctionEditDocument;
                _Document.ActionAdd = model.FunctionAddDocument;
                _Document.ActionDelete = model.FunctionDeleteDocument;
                _Document.ActionAdmin = model.FunctionAdminDocument;
                _Document.Id = model.IdDocument;
                _services.Add(_Document);
                var _Calnedar = new RoleFunction();
                _Calnedar.UserName = model.UserName;
                _Calnedar.NameFunction = "Lịch công tác";
                _Calnedar.CodeFunction = "CALENDAR";
                _Calnedar.ActionEdit = model.FunctionEditCalendar;
                _Calnedar.ActionAdd = model.FunctionAddCalendar;
                _Calnedar.ActionDelete = model.FunctionDeleteCalendar;
                _Calnedar.ActionAdmin = model.FunctionAdminCalendar;
                _Calnedar.Id = model.IdCalendar;
                _services.Add(_Calnedar);
                var _Media = new RoleFunction();
                _Media.UserName = model.UserName;
                _Media.NameFunction = "Media";
                _Media.CodeFunction = "MEDIA";
                _Media.ActionEdit = model.FunctionEditMedia;
                _Media.ActionAdd = model.FunctionAddMedia;
                _Media.ActionDelete = model.FunctionDeleteMedia;
                _Media.ActionAdmin = model.FunctionAdminMedia;
                _Media.Id = model.IdMedia;
                _services.Add(_Media);
                var _Trained = new RoleFunction();
                _Trained.UserName = model.UserName;
                _Trained.NameFunction = "Đào tạo";
                _Trained.CodeFunction = "TRAINED";
                _Trained.ActionEdit = model.FunctionEditTrained;
                _Trained.ActionAdd = model.FunctionAddTrained;
                _Trained.ActionDelete = model.FunctionDeleteTrained;
                _Trained.ActionAdmin = model.FunctionAdminTrained;
                _Trained.Id = model.IdTrained;
                _services.Add(_Trained);
            }
            return View(model);
        }

    }
}