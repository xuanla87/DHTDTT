using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using ProjectNews.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class ThanhVienController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        public ActionResult Index()
        {
            ApplicationDbContext db = new ApplicationDbContext();
            var users = db.Users.ToList();
            return View(users);
        }

        public ActionResult ThemMoi()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ThemMoi(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email, FullName = model.FullName, BirthDay= DateTime.Now };
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