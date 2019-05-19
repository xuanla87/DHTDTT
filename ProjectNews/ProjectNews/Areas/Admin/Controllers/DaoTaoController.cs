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
    public class DaoTaoController : Controller
    {
        private IContentServices _services;
        public DaoTaoController(IContentServices services)
        {
            _services = services;
        }

        public ActionResult Index(string _searchKey, int? _parentId, int? _pageIndex)
        {
            ContentView result;
            result = _services.GetAll(_searchKey, null, null, _parentId, "TINDAOTAO", 1, false, _pageIndex, 20);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            IEnumerable<DropdownModel> category = _services.Dropdownlist(_parentId.GetValueOrDefault(), null, "CHUYENMUCDAOTAO", 1);
            ViewBag._parentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            if (result != null && result.ViewContents.Count() > 0)
            {
                IEnumerable<ModelContent> model = result.ViewContents.Select(x => new ModelContent
                {
                    contentAlias = x.contentAlias,
                    contentId = x.contentId,
                    contentThumbnail = x.contentThumbnail,
                    contentDescription = x.contentDescription,
                    contentMetaKeywords = x.contentMetaKeywords,
                    contentMetaTitle = x.contentMetaTitle,
                    contentMetaDescription = x.contentMetaDescription,
                    contentName = x.contentName,
                    contentParentId = x.contentParentId
                });
                return View(result.ViewContents);
            }
            else
            {
                List<ModelContent> model = new List<ModelContent>();
                return View(model);
            }
        }

        public ActionResult ThemMoi()
        {
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "CHUYENMUCDAOTAO", 1);
            ViewBag.contentParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            var model = new ModelContent
            {
                contentId = 0
            };
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(ModelContent model)
        {
            if (ModelState.IsValid)
            {
                Content entity = new Content
                {
                    contentAlias = model.contentAlias,
                    contentDescription = model.contentDescription,
                    contentThumbnail = model.contentThumbnail,
                    contentMetaTitle = model.contentMetaTitle,
                    contentUpdateTime = DateTime.Now,
                    contentParentId = model.contentParentId,
                    contentMetaDescription = model.contentMetaDescription,
                    contentName = model.contentName,
                    contentCreateTime = DateTime.Now,
                    isSort = 1,
                    isTrash = false,
                    contentView = 0,
                    contentLanguageId = 1,
                    contentKey = "TINDAOTAO",
                    contentCreateUser = User.Identity.Name,
                    contentMetaKeywords = model.contentMetaKeywords,
                    contentUpdateUser = User.Identity.Name,
                    contentBody = model.contentBody
                };
                _services.Add(entity);
                _services.Save();
                entity.contentAlias = entity.contentAlias + "-" + entity.contentId;
                _services.Update(entity);
                _services.Save();
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.contentId, "CHUYENMUCDAOTAO", 1);
            ViewBag.contentParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }

        [HttpGet]
        public ActionResult CapNhat(int Id)
        {
            if (Id > 0)
            {
                var entity = _services.GetById(Id);
                var model = new ModelContent
                {
                    contentAlias = entity.contentAlias,
                    contentDescription = entity.contentDescription,
                    contentThumbnail = entity.contentThumbnail,
                    contentMetaTitle = entity.contentMetaTitle,
                    contentParentId = entity.contentParentId,
                    contentMetaDescription = entity.contentMetaDescription,
                    contentName = entity.contentName,
                    contentCreateTime = entity.contentCreateTime.ToString("dd/MM/yyyy"),
                    contentCreateUser = User.Identity.Name,
                    contentMetaKeywords = entity.contentMetaKeywords,
                    contentUpdateUser = User.Identity.Name,
                    contentBody = entity.contentBody
                };
                IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.contentId, "CHUYENMUCDAOTAO", 1);
                ViewBag.contentParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
                return View(model);
            }
            else
                return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(ModelContent model)
        {
            if (ModelState.IsValid)
            {
                Content entity = _services.GetById((int)model.contentId);
                entity.contentAlias = model.contentAlias;
                entity.contentDescription = model.contentDescription;
                entity.contentThumbnail = model.contentThumbnail;
                entity.contentMetaTitle = model.contentMetaTitle;
                entity.contentUpdateTime = DateTime.Now;
                entity.contentParentId = model.contentParentId;
                entity.contentMetaDescription = model.contentMetaDescription;
                entity.contentName = model.contentName;
                entity.contentMetaKeywords = model.contentMetaKeywords;
                entity.contentUpdateUser = User.Identity.Name;
                entity.contentBody = model.contentBody;
                _services.Update(entity);
                _services.Save();
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)model.contentId, "CHUYENMUCDAOTAO", 1);
            ViewBag.contentParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }
    }
}
