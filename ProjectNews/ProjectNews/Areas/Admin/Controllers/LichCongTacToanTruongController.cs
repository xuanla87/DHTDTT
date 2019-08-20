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
    public class LichCongTacToanTruongController : Controller
    {
        private IContentServices _services;
        public LichCongTacToanTruongController(IContentServices services)
        {
            _services = services;
        }
        public ActionResult Index(string _searchKey, int? _pageIndex)
        {
            string _userName = null;
            ContentView result;
            if (User.IsInRole("Admin"))
            {
                _userName = null;
                result = _services.GetAll(_searchKey, null, null, null, "LICHCONGTACTOANTRUONG", 1, false, _pageIndex, 20, _userName, null);
            }
            else
            {
                _userName = User.Identity.Name;
                result = _services.GetAll(_searchKey, null, null, null, "LICHCONGTACTOANTRUONG", 1, false, null, null, _userName, null);
            }
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
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
                if (User.IsInRole("Admin"))
                {
                    return View(model);

                }
                else
                {
                    return View(model.ToList().Take(5));
                }
            }
            else
            {
                List<ModelLichCongTac> model = new List<ModelLichCongTac>();
                return View(model);
            }
        }

        public ActionResult Detail(int? Id)
        {
            ModelLichCongTac entity;
            if (Id.HasValue && Id > 0)
            {
                Content model = _services.GetById(Id.Value);
                entity = new ModelLichCongTac
                {
                    Id = model.contentId,
                    Link = model.contentAlias,
                    Name = model.contentName,
                    Body = model.contentBody
                };
                ViewBag.Title = "Cập nhật lịch công tác toàn trường";
            }
            else
            {
                entity = new ModelLichCongTac
                {
                    Id = 0
                };
                ViewBag.Title = "Thêm mới lịch công tác toàn trường";
            }
            return View(entity);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Detail(ModelLichCongTac model)
        {
            if (ModelState.IsValid)
            {
                if (model.Id > 0)
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
                }
                else
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
                        contentKey = "LICHCONGTACTOANTRUONG",
                        contentCreateUser = User.Identity.Name,
                        contentUpdateUser = User.Identity.Name,
                        isApproval = true
                    };
                    _services.Add(entity);
                    _services.Save();
                    entity.contentAlias = entity.contentAlias + "-" + entity.contentId;
                    _services.Update(entity);
                    _services.Save();
                }
                return RedirectToAction("Index");
            }
            return View(model);
        }
    }
}