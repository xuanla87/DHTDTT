using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using ProjectNews.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using ServiceNews.Models;
using ProjectNews.Areas.Admin.Models;
using ServiceNews.Services;
using Microsoft.AspNet.Identity.EntityFramework;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class ThanhVienController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        private IRoleFunctionServices _services;

        public ThanhVienController(IRoleFunctionServices services)
        {
            _services = services;
        }
        public ActionResult Index()
        {
            ApplicationDbContext db = new ApplicationDbContext();
            var users = db.Users.ToList();
            return View(users);
        }

        public ActionResult ThemMoi()
        {
            RegisterViewModel model = new RegisterViewModel();

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ThemMoi(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email, FullName = model.FullName, BirthDay = DateTime.Now };
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    return RedirectToAction("Index");
                }
                AddErrors(result);
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult ChangePass(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                ApplicationDbContext db = new ApplicationDbContext();
                var user = db.Users.Find(id);
                ChangePasswordViewModel model = new ChangePasswordViewModel { UserId = id };
                return View(model);
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePass(ChangePasswordViewModel model)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            if (ModelState.IsValid)
            {
                var result = await UserManager.ChangePasswordAsync(model.UserId, model.OldPassword, model.NewPassword);
                if (result.Succeeded)
                {
                    return RedirectToAction("Index");
                }
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Role(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                ApplicationDbContext db = new ApplicationDbContext();
                var user = db.Users.Find(id);
                var entity = _services.GetByUserName(user.UserName);
                ModelRoleFunction model = new ModelRoleFunction();
                model.UserName = user.UserName;
                model.FullName = user.FullName;
                var _News = _services.GetByUserNameCode(user.UserName, "TINTUC");
                var _Document = _services.GetByUserNameCode(user.UserName, "DOCUMENT");
                var _Media = _services.GetByUserNameCode(user.UserName, "MEDIA");
                var _Caledar = _services.GetByUserNameCode(user.UserName, "CALENDAR");
                var _Trained = _services.GetByUserNameCode(user.UserName, "TRAINED");
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
        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }



    }
}