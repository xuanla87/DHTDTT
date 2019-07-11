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
    public class BannerController : Controller
    {
        IContentServices _services;
        int _languageId = 1;
        public BannerController(IContentServices services)
        {
            this._services = services;
        }

        public ActionResult Index(string _searchKey, int? _parentId, int? _pageIndex)
        {
            ContentView result;
            result = _services.GetAll(_searchKey, null, null, _parentId, "BANNER", _languageId, false, _pageIndex, 20, null, null);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            var category = _services.Dropdownlist(0, null, "BANNER", _languageId);
            ViewBag._parentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            if (result != null && result.ViewContents.Count() > 0)
            {
                var model = result.ViewContents.Select(x => new ModelBanner
                {
                    Alias = x.contentAlias,
                    BodyContent = x.contentBody,
                    Id = x.contentId,
                    Img = x.contentThumbnail,
                    Name = x.contentName,
                    ParentId = x.contentParentId,
                    IsSort = x.isSort,
                    IsTrash = x.isTrash
                });
                return View(model);
            }
            else
            {
                var model = new List<ModelBanner>();
                return View(model);
            }
        }

        [HttpGet]
        public ActionResult Detail(int? Id)
        {
            ModelBanner entity;
            if (Id.HasValue && Id > 0)
            {
                var model = _services.GetById(Id.Value);
                entity = new ModelBanner
                {
                    Id = model.contentId,
                    Alias = model.contentAlias,
                    BodyContent = model.contentBody,
                    Img = model.contentThumbnail,
                    Name = model.contentName,
                    ParentId = model.contentParentId,
                    IsSort = model.isSort,
                    IsTrash = model.isTrash,
                    Link = model.contentDescription
                };
                ViewBag.Title = "Cập nhật banner";
            }
            else
            {
                entity = new ModelBanner
                {
                    Id = 0
                };
                ViewBag.Title = "Thêm mới banner";
            }
            var category = _services.Dropdownlist(0, (int)entity.Id, "BANNER", _languageId);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Detail(ModelBanner entity)
        {
            if (ModelState.IsValid)
            {
                if (entity.Id > 0)
                {
                    var model = _services.GetById((int)entity.Id);
                    model.contentDescription = entity.Link;
                    model.contentBody = entity.BodyContent;
                    model.contentId = entity.Id;
                    model.contentThumbnail = entity.Img;
                    model.contentName = entity.Name;
                    model.contentParentId = entity.ParentId;
                    model.isSort = entity.IsSort;
                    _services.Update(model);
                    _services.Save();
                }
                else
                {
                    var model = new Content();
                    model.contentAlias = entity.Alias;
                    model.contentBody = entity.BodyContent;
                    model.contentDescription = entity.Link;
                    model.contentId = entity.Id;
                    model.contentThumbnail = entity.Img;
                    model.contentUpdateTime = DateTime.Now;
                    model.contentParentId = entity.ParentId;
                    model.contentName = entity.Name;
                    model.contentCreateTime = DateTime.Now;
                    model.isSort = entity.IsSort;
                    model.isTrash = false;
                    model.contentView = 0;
                    model.contentLanguageId = 1;
                    model.contentKey = "BANNER";
                    _services.Add(model);
                    _services.Save();
                    model.contentAlias = model.contentAlias + "-" + model.contentId;
                    _services.Update(model);
                    _services.Save();
                }
                return RedirectToAction("Index", new { _parentId = entity.ParentId });
            }
            var category = _services.Dropdownlist(0, (int)entity.Id, "BANNER", _languageId);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
        }
    }
}