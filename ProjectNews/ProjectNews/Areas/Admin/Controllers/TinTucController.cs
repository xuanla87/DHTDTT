using ServiceNews.Models;
using ServiceNews.Services;
using ProjectNews.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class TinTucController : Controller
    {
        private IContentServices _services;
        public TinTucController(IContentServices services)
        {
            _services = services;
        }
        public ActionResult Index(string _searchKey, int? _parentId, DateTime? _fromDate, DateTime? _toDate, int? _pageIndex)
        {
            ContentView result;
            int _languageId = 1;
            result = _services.GetAll(_searchKey, _fromDate, _toDate, _parentId, "TINTUC", _languageId, false, _pageIndex, 20);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            ViewBag.FromDate = _fromDate?.ToString("dd/MM/yyyy") ?? null;
            ViewBag.ToDate = _toDate?.ToString("dd/MM/yyyy") ?? null;
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "CHUYENMUCTINTUC", _languageId);
            ViewBag._parentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            if (result != null && result.ViewContents.Count() > 0)
            {
                IEnumerable<ModelContent> model = result.ViewContents.Select(x => new ModelContent
                {
                    contentAlias = x.contentAlias,
                    contentBody = x.contentBody,
                    contentId = x.contentId,
                    contentThumbnail = x.contentThumbnail,
                    contentDescription = x.contentDescription,
                    contentKey = x.contentKey,
                    contentName = x.contentName,
                    contentParentId = x.contentParentId
                });
                return View(model);
            }
            else
            {
                List<ModelContent> model = new List<ModelContent>();
                return View(model);
            }
        }

        [HttpGet]
        public ActionResult Detail(int? Id)
        {
            ModelContent entity;
            int _languageId = 1;
            if (Id.HasValue && Id > 0)
            {
                Content model = _services.GetById(Id.Value);
                entity = new ModelContent
                {
                    contentId = model.contentId,
                    contentAlias = model.contentAlias,
                    contentBody = model.contentBody,
                    contentThumbnail = model.contentThumbnail,
                    contentDescription = model.contentDescription,
                    contentMetaKeywords = model.contentMetaKeywords,
                    contentMetaTitle = model.contentMetaTitle,
                    contentName = model.contentName,
                    contentMetaDescription = model.contentMetaDescription,
                    contentParentId = model.contentParentId,
                    authorize = model.authorize,
                    isNew = model.isNew ?? false,
                    contentCreateTime = model.contentCreateTime.ToString("dd/MM/yyyy")
                };
                ViewBag.Title = "Cập nhật tin tức";
            }
            else
            {
                entity = new ModelContent
                {
                    contentId = 0
                };
                ViewBag.Title = "Thêm mới tin tức";
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "CHUYENMUCTINTUC", _languageId);
            ViewBag.contentParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Detail(ModelContent entity)
        {
            if (ModelState.IsValid)
            {
                if (entity.contentId > 0)
                {
                    Content model = _services.GetById((int)entity.contentId);
                    model.contentAlias = entity.contentAlias;
                    model.contentBody = entity.contentBody;
                    model.contentDescription = entity.contentDescription;
                    model.contentId = entity.contentId;
                    model.contentThumbnail = entity.contentThumbnail;
                    model.contentMetaTitle = entity.contentMetaTitle;
                    model.contentUpdateTime = DateTime.Now;
                    if (string.IsNullOrEmpty(entity.contentCreateTime))
                    {
                        model.contentCreateTime = DateTime.Now;
                    }
                    else
                    {
                        model.contentCreateTime = DateTime.ParseExact(entity.contentCreateTime, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }
                    model.contentParentId = entity.contentParentId;
                    model.contentName = entity.contentName;
                    model.contentUpdateUser = User.Identity.Name;
                    model.isNew = entity.isNew;
                    _services.Update(model);
                    _services.Save();
                }
                else
                {
                    Content model = new Content
                    {
                        contentAlias = entity.contentAlias,
                        contentBody = entity.contentBody,
                        contentDescription = entity.contentDescription,
                        contentId = entity.contentId,
                        contentThumbnail = entity.contentThumbnail,
                        contentMetaTitle = entity.contentMetaTitle
                    };
                    model.contentUpdateTime = DateTime.Now;
                    model.contentParentId = entity.contentParentId;
                    model.contentName = entity.contentName;
                    if (string.IsNullOrEmpty(entity.contentCreateTime))
                    {
                        model.contentCreateTime = DateTime.Now;
                    }
                    else
                    {
                        model.contentCreateTime = DateTime.ParseExact(entity.contentCreateTime, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }
                    model.isTrash = false;
                    model.contentView = 0;
                    model.contentLanguageId = 1;
                    model.contentUpdateUser = User.Identity.Name;
                    model.contentCreateUser = User.Identity.Name;
                    model.authorize = entity.authorize;
                    model.contentKey = "TINTUC";
                    model.isNew = entity.isNew;
                    _services.Add(model);
                    _services.Save();
                    model.contentAlias = model.contentAlias + "-" + model.contentId;
                    _services.Update(model);
                    _services.Save();
                }
                return RedirectToAction("Index", new { _parentId = entity.contentParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)entity.contentId, "CHUYENMUCTINTUC", 1);
            ViewBag.contentParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
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