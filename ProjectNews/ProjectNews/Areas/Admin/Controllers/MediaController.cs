using ServiceNews.Services;
using ServiceNews.Models;
using ProjectNews.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class MediaController : Controller
    {
        private IContentServices _services;
        public MediaController(IContentServices services)
        {
            _services = services;
        }
        public ActionResult Index(string _searchKey, int? _parentId, DateTime? _fromDate, DateTime? _toDate, int? _pageIndex)
        {
            ContentView result;
            result = _services.GetAll(_searchKey, _fromDate, _toDate, _parentId, "MEDIA", 1, false, _pageIndex, 20, null, null);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            ViewBag.FromDate = _fromDate?.ToString("dd/MM/yyyy") ?? null;
            ViewBag.ToDate = _toDate?.ToString("dd/MM/yyyy") ?? null;
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "CHUYENMUCMEDIA", 1);
            ViewBag._parentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            if (result != null && result.ViewContents.Count() > 0)
            {
                IEnumerable<ModelMedia> model = result.ViewContents.Select(x => new ModelMedia
                {
                    Alias = x.contentAlias,
                    BodyContent = x.contentBody,
                    Id = (int)x.contentId,
                    Img = x.contentThumbnail,
                    LanguageId = 1,
                    MetaDescription = x.contentDescription,
                    MetaKeywords = x.contentMetaKeywords,
                    MetaTitle = x.contentMetaTitle,
                    Name = x.contentName,
                    Note = x.contentDescription,
                    ParentId = (int)x.contentParentId,
                    isApproval = (x.isApproval ?? false),
                    CreateTime = x.contentUpdateTime.ToString("dd/MM/yyyy")
                });
                return View(model);
            }
            else
            {
                List<ModelMedia> model = new List<ModelMedia>();
                return View(model);
            }
        }

        [HttpGet]
        public ActionResult Detail(int? Id, int? ParentId)
        {
            ModelMedia entity;
            if (Id.HasValue && Id > 0)
            {
                Content model = _services.GetById(Id.Value);
                entity = new ModelMedia
                {
                    Id = (int)model.contentId,
                    Alias = model.contentAlias,
                    BodyContent = model.contentBody,
                    CreateTime = model.contentUpdateTime.ToString("dd/MM/yyyy"),
                    Img = model.contentThumbnail,
                    LanguageId = 1,
                    MetaDescription = model.contentDescription,
                    MetaKeywords = model.contentMetaKeywords,
                    MetaTitle = model.contentMetaTitle,
                    Name = model.contentName,
                    Note = model.contentDescription,
                    ParentId = (int)model.contentParentId,
                    Sort = model.isSort,
                    TacGia = model.authorize
                };
                ViewBag.Title = "Cập nhật media";
            }
            else
            {
                entity = new ModelMedia
                {
                    CreateTime = DateTime.Now.ToString("dd/MM/yyyy"),
                    LanguageId = 1,
                    ParentId = ParentId
                };
                ViewBag.Title = "Thêm mới media";
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, entity.Id, "CHUYENMUCMEDIA", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Detail(ModelMedia entity)
        {
            if (ModelState.IsValid)
            {
                if (entity.Id > 0)
                {
                    Content model = _services.GetById(entity.Id);
                    model.contentAlias = entity.Alias;
                    model.contentBody = entity.BodyContent;
                    model.contentDescription = entity.MetaDescription;
                    model.contentId = entity.Id;
                    model.contentThumbnail = entity.Img;
                    model.contentMetaTitle = entity.MetaTitle;
                    if (string.IsNullOrEmpty(entity.CreateTime))
                    {
                        model.contentUpdateTime = DateTime.Now;
                    }
                    else
                    {
                        model.contentUpdateTime = DateTime.ParseExact(entity.CreateTime, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }

                    model.contentParentId = entity.ParentId;
                    model.authorize = entity.TacGia;
                    model.contentDescription = entity.Note;
                    model.contentName = entity.Name;
                    model.isSort = entity.Sort;
                    _services.Update(model);
                    _services.Save();
                }
                else
                {
                    Content model = new Content
                    {
                        contentAlias = entity.Alias,
                        contentBody = entity.BodyContent,
                        contentDescription = entity.MetaDescription,
                        contentId = entity.Id,
                        contentThumbnail = entity.Img,
                        contentMetaTitle = entity.MetaTitle
                    };
                    if (string.IsNullOrEmpty(entity.CreateTime))
                    {
                        model.contentUpdateTime = DateTime.Now;
                    }
                    else
                    {
                        model.contentUpdateTime = DateTime.ParseExact(entity.CreateTime, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }

                    model.contentParentId = entity.ParentId;
                    model.contentDescription = entity.Note;
                    model.contentName = entity.Name;
                    model.contentCreateTime = DateTime.Now;
                    model.isSort = entity.Sort;
                    model.isTrash = false;
                    model.contentView = 0;
                    model.authorize = entity.TacGia;
                    model.contentLanguageId = 1;
                    model.contentKey = "MEDIA";
                    _services.Add(model);
                    _services.Save();
                    model.contentAlias = model.contentAlias + "-" + model.contentId;
                    _services.Update(model);
                    _services.Save();
                }
                return RedirectToAction("Index", new { _parentId = entity.ParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, entity.Id, "CHUYENMUCMEDIA", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
        }

        public ActionResult Category(string _searchKey, int? _parentId, int? _pageIndex)
        {
            ContentView result;
            result = _services.GetAll(_searchKey, null, null, _parentId, "CHUYENMUCMEDIA", 1, false, _pageIndex, 20, null, null);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            ViewBag.Parent = _parentId;
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, null, "CHUYENMUCMEDIA", 1);
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

        [HttpGet]
        public ActionResult DetailCategory(int? Id, int? ParentId)
        {
            ModelChuyenMuc entity;
            if (Id.HasValue && Id > 0)
            {
                Content model = _services.GetById(Id.Value);
                entity = new ModelChuyenMuc
                {
                    Id = model.contentId,
                    Link = model.contentAlias,
                    MetaDescription = model.contentMetaDescription,
                    MetaKeywords = model.contentMetaKeywords,
                    MetaTitle = model.contentMetaTitle,
                    Isort = model.isSort,
                    Name = model.contentName,
                    Note = model.contentDescription,
                    ParentId = model.contentParentId,
                    Thumbnail = model.contentThumbnail
                };
                ViewBag.Title = "Cập nhật chuyên mục media";
            }
            else
            {
                entity = new ModelChuyenMuc
                {
                    Id = 0,
                    ParentId = ParentId
                };
                ViewBag.Title = "Thêm mới chuyên mục media";
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)entity.Id, "CHUYENMUCMEDIA", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult DetailCategory(ModelChuyenMuc entity)
        {
            if (ModelState.IsValid)
            {
                if (entity.Id > 0)
                {
                    Content model = _services.GetById((int)entity.Id);
                    model.contentAlias = entity.Link;
                    model.contentDescription = entity.Note;
                    model.contentThumbnail = entity.Thumbnail;
                    model.contentMetaTitle = entity.MetaTitle;
                    model.contentUpdateTime = DateTime.Now;
                    model.contentParentId = entity.ParentId;
                    model.contentMetaDescription = entity.MetaDescription;
                    model.contentName = entity.Name;
                    model.isSort = entity.Isort;
                    model.contentMetaKeywords = entity.MetaKeywords;
                    model.contentUpdateUser = User.Identity.Name;
                    _services.Update(model);
                    _services.Save();
                }
                else
                {
                    Content model = new Content
                    {
                        contentAlias = entity.Link,
                        contentDescription = entity.Note,
                        contentThumbnail = entity.Thumbnail,
                        contentMetaTitle = entity.MetaTitle,
                        contentUpdateTime = DateTime.Now,
                        contentParentId = entity.ParentId,
                        contentMetaDescription = entity.MetaDescription,
                        contentName = entity.Name,
                        contentCreateTime = DateTime.Now,
                        isSort = entity.Isort,
                        isTrash = false,
                        contentView = 0,
                        contentLanguageId = 1,
                        contentKey = "CHUYENMUCMEDIA",
                        contentCreateUser = User.Identity.Name,
                        contentMetaKeywords = entity.MetaKeywords,
                        contentUpdateUser = User.Identity.Name
                    };
                    _services.Add(model);
                    _services.Save();
                    model.contentAlias = model.contentAlias + "-" + model.contentId;
                    _services.Update(model);
                    _services.Save();
                }
                return RedirectToAction("Category", new { _parentId = entity.ParentId });
            }
            IEnumerable<DropdownModel> category = _services.Dropdownlist(0, (int)entity.Id, "CHUYENMUCMEDIA", 1);
            ViewBag.ParentId = category.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(entity);
        }
    }
}