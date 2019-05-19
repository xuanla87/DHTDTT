using ServiceNews.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectNews.Areas.Admin.Models;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class CaiDatHeThongController : Controller
    {
        IConfigSystemServices _services;
        IMenuServices _menuService;
        IContentServices _contentService;
        public CaiDatHeThongController(IConfigSystemServices services, IMenuServices menuService, IContentServices contentService)
        {
            this._services = services;
            this._menuService = menuService;
            this._contentService = contentService;
        }
        public ActionResult Index()
        {
            var model = new ModelCaiDatHeThong();
            if (!string.IsNullOrEmpty(_services.GetValueByKey("DanhMucChinh")))
                model.DanhMucChinh = int.Parse(_services.GetValueByKey("DanhMucChinh"));
            model.SiteBanner = _services.GetValueByKey("SiteBanner");
            model.SiteContact = _services.GetValueByKey("SiteContact");
            model.SiteDescription = _services.GetValueByKey("SiteDescription");
            model.SiteEmail = _services.GetValueByKey("SiteEmail");
            model.SiteFooterInfo = _services.GetValueByKey("SiteFooterInfo");
            model.SiteKeywords = _services.GetValueByKey("SiteKeywords");
            model.SiteTitle = _services.GetValueByKey("SiteTitle");
            if (!string.IsNullOrEmpty(_services.GetValueByKey("BoxPhongSuAnh")))
                model.BoxPhongSuAnh = int.Parse(_services.GetValueByKey("BoxPhongSuAnh"));
            if (!string.IsNullOrEmpty(_services.GetValueByKey("BoxTinTucChung")))
                model.BoxTinTucChung = int.Parse(_services.GetValueByKey("BoxTinTucChung"));
            if (!string.IsNullOrEmpty(_services.GetValueByKey("BoxTinTucNganh")))
                model.BoxTinTucNganh = int.Parse(_services.GetValueByKey("BoxTinTucNganh"));
            if (!string.IsNullOrEmpty(_services.GetValueByKey("BoxMedia")))
                model.BoxMedia = int.Parse(_services.GetValueByKey("BoxMedia"));
            var enMenu = _menuService.Dropdownlist(0, null, 1);
            var enTinTuc = _contentService.Dropdownlist(0, null, "CHUYENMUCTINTUC", 1);
            ViewBag.DanhMucChinh = enMenu.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            ViewBag.TinTucChung = enTinTuc.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            ViewBag.TinTucNganh = enTinTuc.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            ViewBag.PhongSuAnh = enTinTuc.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            ViewBag.Media = enTinTuc.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            ViewBag.SachVaHocLieu = enTinTuc.Select(x => new SelectListItem { Text = x.Text, Value = x.Value.ToString() });
            return View(model);
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Index(ModelCaiDatHeThong model)
        {
            if (ModelState.IsValid)
            {
                _services.SaveData("DanhMucChinh", model.DanhMucChinh.ToString());
                _services.SaveData("SiteBanner", model.SiteBanner);
                _services.SaveData("SiteContact", model.SiteContact);
                _services.SaveData("SiteDescription", model.SiteDescription);
                _services.SaveData("SiteEmail", model.SiteEmail);
                _services.SaveData("SiteFooterInfo", model.SiteFooterInfo);
                _services.SaveData("SiteKeywords", model.SiteKeywords);
                _services.SaveData("BoxMedia", model.BoxMedia.ToString());
                _services.SaveData("BoxPhongSuAnh", model.BoxPhongSuAnh.ToString());
                _services.SaveData("BoxSachVaHocLieu", model.BoxSachVaHocLieu.ToString());
                _services.SaveData("BoxTinTucChung", model.BoxTinTucChung.ToString());
                _services.SaveData("BoxTinTucNganh", model.BoxTinTucNganh.ToString());
                _services.SaveData("BoxLienKet", model.BoxLienKet.ToString());
            }
            return RedirectToAction("Index");
        }
    }
}