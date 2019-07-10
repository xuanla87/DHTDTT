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
    public class LichCongTacController : Controller
    {
        private IContentServices _services;
        public LichCongTacController(IContentServices services)
        {
            _services = services;
        }

        public ActionResult Index(string _searchKey, int? _parentId, int? _pageIndex)
        {
            ContentView result;
            result = _services.GetAll(_searchKey, null, null, _parentId, "LICHCONGTAC", 1, false, _pageIndex, 20, null);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            IEnumerable<DropdownModel> category = _services.Dropdownlist(_parentId.GetValueOrDefault(), null, "DONVIPHONGKHOA", 1);
            ViewBag._parentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            if (result != null && result.ViewContents.Count() > 0)
            {
                IEnumerable<ModelLichCongTac> model = result.ViewContents.Select(x => new ModelLichCongTac
                {
                    Id = x.contentId,
                    Link = x.contentAlias,
                    ParentId = x.contentParentId,
                    Name = x.contentName,
                    Body = x.contentBody
                });
                return View(model);
            }
            else
            {
                List<ModelLichCongTac> model = new List<ModelLichCongTac>();
                return View(model);
            }
        }

        public ActionResult ThemMoi()
        {
            var model = new ModelLichCongTac { Id = 0 };
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "DONVIPHONGKHOA", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(ModelLichCongTac model)
        {
            if (ModelState.IsValid)
            {
                Content entity = new Content
                {
                    contentAlias = model.Link,
                    contentUpdateTime = DateTime.Now,
                    contentParentId = model.ParentId,
                    contentName = model.Name,
                    contentCreateTime = DateTime.Now,
                    contentBody = model.Body,
                    isTrash = false,
                    contentView = 0,
                    contentLanguageId = 1,
                    contentKey = "LICHCONGTAC",
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
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.Id, "LICHCONGTAC", 1);
            ViewBag.DonviCha = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

        [HttpGet]
        public ActionResult CapNhat(int Id)
        {
            if (Id > 0)
            {
                var entity = _services.GetById(Id);
                var model = new ModelLichCongTac
                {
                    Id = entity.contentId,
                    Link = entity.contentAlias,
                    Name = entity.contentName,
                    Body = entity.contentBody,
                    ParentId = entity.contentParentId
                };
                IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.Id, "DONVIPHONGKHOA", 1);
                ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
                return View(model);
            }
            else
                return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(ModelLichCongTac model)
        {
            if (ModelState.IsValid)
            {
                Content entity = _services.GetById((int)model.Id);
                entity.contentAlias = model.Link;
                entity.contentUpdateTime = DateTime.Now;
                entity.contentParentId = model.ParentId;
                entity.contentBody = model.Body;
                entity.contentName = model.Name;
                entity.contentUpdateUser = User.Identity.Name;
                _services.Update(entity);
                _services.Save();
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.Id, "DONVIPHONGKHOA", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

        public string getNameById(long? Id)
        {
            if (Id.HasValue)
            {
                var entity = _services.GetById((int)Id);
                if (entity != null)
                    return entity.contentName;
                else
                    return null;
            }
            else
                return null;

        }
    }
}