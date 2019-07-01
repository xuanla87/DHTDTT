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
    [Authorize]
    public class ChuyenMucTinTucController : Controller
    {
        private IContentServices _services;
        public ChuyenMucTinTucController(IContentServices services)
        {
            _services = services;
        }

        public ActionResult Index(string _searchKey, int? _parentId, int? _pageIndex)
        {
            ContentView result;
            result = _services.GetAllAdmin(_searchKey, null, null, _parentId, "CHUYENMUCTINTUC", 1, false, _pageIndex, 20);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            IEnumerable<DropdownModel> category = _services.Dropdownlist(_parentId.GetValueOrDefault(), null, "CHUYENMUCTINTUC", 1);
            ViewBag._parentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            if (result != null && result.ViewContents.Count() > 0)
            {
                IEnumerable<ModelChuyenMuc> model = result.ViewContents.Select(x => new ModelChuyenMuc
                {
                    Link = x.contentAlias,
                    Id = x.contentId,
                    Thumbnail = x.contentThumbnail,
                    MetaDescription = x.contentDescription,
                    MetaKeywords = x.contentMetaKeywords,
                    MetaTitle = x.contentMetaTitle,
                    Name = x.contentName,
                    Note = x.contentDescription,
                    ParentId = x.contentParentId
                });
                return View(model);
            }
            else
            {
                List<ModelChuyenMuc> model = new List<ModelChuyenMuc>();
                return View(model);
            }
        }


        public ActionResult ThemMoi()
        {
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "CHUYENMUCTINTUC", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            ModelChuyenMuc model = new ModelChuyenMuc
            {
                Id = 0
            };
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(ModelChuyenMuc model)
        {
            if (ModelState.IsValid)
            {
                Content entity = new Content
                {
                    contentAlias = model.Link,
                    contentDescription = model.Note,
                    contentThumbnail = model.Thumbnail,
                    contentMetaTitle = model.MetaTitle,
                    contentUpdateTime = DateTime.Now,
                    contentParentId = model.ParentId,
                    contentMetaDescription = model.MetaDescription,
                    contentName = model.Name,
                    contentCreateTime = DateTime.Now,
                    isSort = model.Isort,
                    isTrash = false,
                    contentView = 0,
                    contentLanguageId = 1,
                    contentKey = "CHUYENMUCTINTUC",
                    contentCreateUser = User.Identity.Name,
                    contentMetaKeywords = model.MetaKeywords,
                    contentUpdateUser = User.Identity.Name
                };
                _services.Add(entity);
                _services.Save();
                entity.contentAlias = entity.contentAlias + "-" + entity.contentId;
                _services.Update(entity);
                _services.Save();
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.Id, "CHUYENMUCTINTUC", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

        [HttpGet]
        public ActionResult CapNhat(int Id)
        {
            if (Id > 0)
            {
                var entity = _services.GetById(Id);
                var model = new ModelChuyenMuc
                {
                    Id = entity.contentId,
                    Link = entity.contentAlias,
                    MetaDescription = entity.contentMetaDescription,
                    MetaKeywords = entity.contentMetaKeywords,
                    MetaTitle = entity.contentMetaTitle,
                    Name = entity.contentName,
                    Note = entity.contentDescription,
                    Isort = entity.isSort,
                    ParentId = entity.contentParentId,
                    Thumbnail = entity.contentThumbnail
                };
                IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.Id, "CHUYENMUCTINTUC", 1);
                ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
                return View(model);
            }
            else
                return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(ModelChuyenMuc model)
        {
            if (ModelState.IsValid)
            {
                Content entity = _services.GetById((int)model.Id);
                entity.contentAlias = model.Link;
                entity.contentDescription = model.Note;
                entity.contentThumbnail = model.Thumbnail;
                entity.contentMetaTitle = model.MetaTitle;
                entity.contentUpdateTime = DateTime.Now;
                entity.contentParentId = model.ParentId;
                entity.contentMetaDescription = model.MetaDescription;
                entity.contentName = model.Name;
                entity.isSort = model.Isort;
                entity.contentMetaKeywords = model.MetaKeywords;
                entity.contentUpdateUser = User.Identity.Name;
                _services.Update(entity);
                _services.Save();
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.Id, "CHUYENMUCTINTUC", 1);
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