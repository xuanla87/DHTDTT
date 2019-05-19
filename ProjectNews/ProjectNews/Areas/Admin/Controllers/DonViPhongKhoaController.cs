using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectNews.Areas.Admin.Models;
using ServiceNews.Models;
using ServiceNews.Services;

namespace ProjectNews.Areas.Admin.Controllers
{
    public class DonViPhongKhoaController : Controller
    {
        private IContentServices _services;
        public DonViPhongKhoaController(IContentServices services)
        {
            _services = services;
        }
        public ActionResult Index(string _searchKey, int? _parentId, int? _pageIndex)
        {
            ContentView result;
            result = _services.GetAll(_searchKey, null, null, _parentId, "DONVIPHONGKHOA", 1, false, _pageIndex, 20);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            IEnumerable<DropdownModel> category = _services.Dropdownlist(_parentId.GetValueOrDefault(), null, "DONVIPHONGKHOA", 1);
            ViewBag._parentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            if (result != null && result.ViewContents.Count() > 0)
            {
                IEnumerable<ModelDonVi> model = result.ViewContents.Select(x => new ModelDonVi
                {
                    DonViId = x.contentId,
                    Link = x.contentAlias,
                    DonviCha = x.contentParentId,
                    TenDonVi = x.contentName,
                    ThuTu = x.isSort
                });
                return View(model);
            }
            else
            {
                List<ModelDonVi> model = new List<ModelDonVi>();
                return View(model);
            }
        }



        public ActionResult ThemMoiDonVi()
        {
            var model = new ModelDonVi { DonViId = 0 };
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "DONVIPHONGKHOA", 1);
            ViewBag.DonviCha = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoiDonVi(ModelDonVi model)
        {
            if (ModelState.IsValid)
            {
                Content entity = new Content
                {
                    contentAlias = model.Link,
                    contentUpdateTime = DateTime.Now,
                    contentParentId = model.DonviCha,
                    contentName = model.TenDonVi,
                    contentCreateTime = DateTime.Now,
                    isSort = model.ThuTu,
                    isTrash = false,
                    contentView = 0,
                    contentLanguageId = 1,
                    contentKey = "DONVIPHONGKHOA",
                    contentCreateUser = User.Identity.Name,
                    contentUpdateUser = User.Identity.Name
                };
                _services.Add(entity);
                _services.Save();
                entity.contentAlias = entity.contentAlias + "-" + entity.contentId;
                _services.Update(entity);
                _services.Save();
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.DonViId, "DONVIPHONGKHOA", 1);
            ViewBag.DonviCha = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

        [HttpGet]
        public ActionResult CapNhat(int Id)
        {
            if (Id > 0)
            {
                var entity = _services.GetById(Id);
                var model = new ModelDonVi
                {
                    DonViId = entity.contentId,
                    Link = entity.contentAlias,
                    TenDonVi = entity.contentName,
                    DonviCha = entity.contentParentId
                };
                IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.DonViId, "DONVIPHONGKHOA", 1);
                ViewBag.DonviCha = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
                return View(model);
            }
            else
                return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(ModelDonVi model)
        {
            if (ModelState.IsValid)
            {
                Content entity = _services.GetById((int)model.DonViId);
                entity.contentAlias = model.Link;
                entity.contentUpdateTime = DateTime.Now;
                entity.contentParentId = model.DonviCha;
                entity.contentName = model.TenDonVi;
                entity.contentUpdateUser = User.Identity.Name;
                _services.Update(entity);
                _services.Save();
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.DonViId, "DONVIPHONGKHOA", 1);
            ViewBag.DonviCha = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

    }
}