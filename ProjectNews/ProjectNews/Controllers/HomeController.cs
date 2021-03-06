﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceNews.Models;
using ServiceNews.Data;
using ServiceNews.Services;
using ServiceNews.Models;
using System.Text;
using System.IO;
using System.Globalization;
using ProjectNews.Models;

namespace ProjectNews.Controllers
{
    public class HomeController : Controller
    {
        IContentServices _services;
        IMenuServices _menuServices;
        IConfigSystemServices _configSystemServices;
        IContactServices _contactServices;
        public HomeController(IContentServices services, IMenuServices menuServices, IConfigSystemServices configSystemServices, IContactServices contactServices)
        {
            this._services = services;
            this._menuServices = menuServices;
            this._configSystemServices = configSystemServices;
            this._contactServices = contactServices;
        }
        public ActionResult Index()
        {
            DateTime _ngayThanhLap = new DateTime(2019, 12, 14);
            ViewBag.DateCountDown = (_ngayThanhLap - DateTime.Now.Date).TotalDays;
            return PartialView();
        }

        public ActionResult Detail(string pageUrl)
        {
            var entity = _services.GetByAlias(pageUrl);
            return View(entity);
        }
        [ValidateInput(false)]
        public ActionResult Display(string pageUrl, int? _pageIndex)
        {
            var entity = _services.GetByAlias(pageUrl);
            if (entity != null)
            {
                ViewBag.Title = entity.contentName;
                _services.UpdateView(entity);
            }
            else
                ViewBag.Title = _configSystemServices.GetValueByKey("SiteTitle");
            return View(entity);
        }

        public ActionResult getMenuMain()
        {
            int _languageId = 1;
            int Id = 0;
            if (_languageId == 1)
                int.TryParse(_configSystemServices.GetValueByKey("DanhMucChinh"), out Id);
            List<Menu> eMenus = _menuServices.GetByParent(Id).Where(x => x.isTrash == false).OrderBy(x => x.isSort).ToList();
            return PartialView(eMenus);
        }
        public string MenuRigth2()
        {
            int _languageId = 1;

            string _html = "";
            _html += "<div class=\"box\">";
            _html += "<div class=\"title pading-left-20  pading-top-10  pading-bottom-10 text-uppercase\">";
            _html += "Chuyên mục tin tức</div>";
            var model = _services.GetParent("CHUYENMUCTINTUC", _languageId);
            _html += "<ul class=\"right-nav nav\">";
            foreach (var item in model)
            {
                _html += " <li>";
                _html += " <a href=\"" + item.contentAlias + "\">";
                _html += item.contentName;
                _html += "</a>";
                _html += SubMenu2("sub-menu nav", (int)item.contentId, item.contentKey);
                _html += "</li>";
            }
            _html += "</ul>";
            _html += "</div>";
            return _html;
        }
        public string MainMenu2()
        {
            int _languageId = 1;
            int Id = 0;
            if (_languageId == 1)
                int.TryParse(_configSystemServices.GetValueByKey("DanhMucChinh"), out Id);
            List<Menu> eMenus = _menuServices.GetByParent(Id).Where(x => x.isTrash == false).OrderBy(x => x.isSort).ToList();
            string _html = "";
            _html += "<ul class=\"main-nav nav navbar-nav\">";
            foreach (var item in eMenus)
            {
                if (item.menuLink == "/" || item.menuLink == "")
                {
                    _html += " <li class=\"active\">";
                    _html += " <a href=\"" + item.menuLink + "\">";
                    _html += item.menuName;
                    _html += "</a>";
                    _html += SubMenu("sub-menu nav", null, item.menuLink);
                    _html += "</li>";
                }
                else
                {
                    _html += " <li>";
                    _html += " <a href=\"" + item.menuLink + "\">";
                    _html += item.menuName;
                    _html += "</a>";
                    _html += SubMenu("sub-menu nav", null, item.menuLink);
                    _html += "</li>";
                }
            }
            _html += "</ul>";
            return _html;
        }

        public string SubMenu(string _css, string _html, string _link)
        {
            var entity = _services.GetByAlias(_link);
            if (entity != null)
            {
                var model = _services.GetAll(null, null, null, (int)entity.contentId, entity.contentKey, 1, false, null, null, null, null);
                var List = model.ViewContents.OrderBy(x => x.isSort);
                _html += " <ul class=\"" + _css + "\">";
                foreach (var item in List)
                {
                    _html += " <li>";
                    _html += " <a href=\"" + item.contentAlias + "\">";
                    _html += item.contentName;
                    _html += "</a>";
                    _html += SubMenu2(_css, (int)item.contentId, item.contentKey);
                    _html += "</li>";
                }
                _html += "</ul>";
            }
            return _html;
        }
        public string SubMenu2(string _css, int _id, string _key)
        {
            string _html = "";
            var model = _services.GetByParent(_id, _key);
            _html += " <ul class=\"" + _css + "\">";
            foreach (var item in model)
            {
                _html += " <li>";
                _html += " <a href=\"" + item.contentAlias + "\">";
                _html += item.contentName;
                _html += "</a>";
                _html += SubMenu2(_css, (int)item.contentId, item.contentKey);
                _html += "</li>";
            }
            _html += "</ul>";
            return _html;
        }

        public ActionResult getSubContentByLink(string _link)
        {
            var entity = _services.GetByAlias(_link);
            if (entity != null)
            {
                var model = _services.GetAll(null, null, null, (int)entity.contentId, entity.contentKey, 1, false, null, null, null, null);
                var List = model.ViewContents.OrderBy(x => x.isSort);
                return PartialView(List);
            }
            else
            {
                var model = new List<Content>();
                return PartialView(model);
            }
        }

        public ActionResult getDanhMucPhai()
        {
            int _languageId = 1;
            int Id = 0;
            if (_languageId == 1)
                int.TryParse(_configSystemServices.GetValueByKey("DanhMucPhai"), out Id);
            List<Menu> eMenus = _menuServices.GetByParent(Id).Where(x => x.isTrash == false).OrderBy(x => x.isSort).ToList();
            return PartialView(eMenus);
        }

        public ActionResult getSubMenu(int Id)
        {
            List<Menu> eMenus = _menuServices.GetByParent(Id).OrderBy(x => x.isSort).ToList();
            return PartialView(eMenus);
        }

        public ActionResult getBreadcrumb(string pageUrl)
        {
            var entity = _services.GetByAlias(pageUrl);
            if (entity != null && entity.contentParentId.HasValue)
            {
                var model = _services.GetById((int)entity.contentParentId.Value);
                if (model != null)
                {
                    ViewBag.PTitle = getParent(model.contentParentId) + "<a href=\"" + model.contentAlias + "\">" + model.contentName + "</a> >> " + entity.contentName;
                }
            }
            else if (entity != null)
            {
                ViewBag.PTitle = "<a href=\"/\">Trang chủ</a> >> " + entity.contentName;
            }
            return PartialView();
        }

        public ActionResult getBannerMain()
        {
            string _banner = _configSystemServices.GetValueByKey("SiteBanner");
            if (!string.IsNullOrEmpty(_banner))
                ViewBag.Banner = "<a class=\"bannermain\" href=\"/\"><img src=\"" + _banner + "\" alt=\"banner\" /></a>";
            else
                ViewBag.Banner = "";
            return PartialView();
        }

        public ActionResult getSliderMain()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxSlider"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null, null, null);
            return PartialView(eSlider.ViewContents);
        }

        public ActionResult getBox1()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxBanner"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null, null, null);
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getBoxLienKet()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxLienKet"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null, null, null);
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getBoxBannerPhai()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxBannerRight"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null, null, null);
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getBoxTinTucChung()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxTinTucChung"), out Id);
            var eSlider = _services.GetTinTucChung(null, null, null, null, null, 1, false, true, null, null);
            var entity = _services.GetById(Id);
            ViewBag.Readmore = "<a href=\"tin-tuc-chung\">>>>>Xem thêm</a>";
            ViewBag.Url = entity.contentAlias;
            return PartialView(eSlider.ViewContents.Take(8));
        }

        public ActionResult getTinTucChung(int? _pageIndex)
        {
            int _totalRecord = 0;
            _pageIndex = _pageIndex ?? 1;
            var model = _services.GetTinTucChung(null, null, null, null, null, 1, false, true, _pageIndex, 10);
            _totalRecord = model.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = model.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            return View(model.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult getBoxTinTucNganh()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxTinTucNganh"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "TINTUC", 1, false, null, null, null, true);
            var entity = _services.GetById(Id);
            ViewBag.Readmore = "<a href=\"" + entity.contentAlias + "\">>>>>Xem thêm</a>";
            ViewBag.Url = entity.contentAlias;
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime).Take(7));
        }

        public ActionResult getBoxSachVaHocLieu()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxSachVaHocLieu"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "TINTUC", 1, false, null, null, null, true);
            var entity = _services.GetById(Id);
            ViewBag.Url = entity.contentAlias;
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime).Take(1));
        }

        public ActionResult getBoxPhongSuAnh()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxPhongSuAnh"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "TINTUC", 1, false, null, null, null, true);
            var entity = _services.GetById(Id);
            ViewBag.Url = entity.contentAlias;
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult getBoxMedia()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxMedia"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "MEDIA", 1, false, null, null, null, true);
            var entity = _services.GetById(Id);
            ViewBag.Url = entity.contentAlias;
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getThongBao()
        {
            var eSlider = _services.GetThongBao(null, null, null, null, null, 1, false, true, null, null);
            return PartialView(eSlider.ViewContents.Take(10));
        }

        public ActionResult getFooterInfo()
        {
            string _footer = _configSystemServices.GetValueByKey("SiteFooterInfo");
            ViewBag.Footer = _footer;
            return PartialView();
        }

        public ActionResult getBanDo()
        {
            string _footer = _configSystemServices.GetValueByKey("BanDo");
            ViewBag.Footer = "<div class=\"col-lg-3 ban-do item\">" + _footer + "</div>";
            return PartialView();
        }

        public ActionResult getAbout()
        {
            string _about = _configSystemServices.GetValueByKey("SiteAbout");
            ViewBag.About = _about;
            return PartialView();
        }

        public ActionResult _HitCounter()
        {

            HitCounterEntity db = new HitCounterEntity();
            int TotalOnline = 0;
            int TotalYesterday = 0;
            int TotalMonth = 0;
            int Total = 0;
            try
            {
                var _hit = db.Visitors.ToList();
                TotalOnline = (int)HttpContext.Application["Totaluser"];
                TotalYesterday = _hit.Where(x => x.visitTime <= DateTime.Now && x.visitTime >= DateTime.Now.Date).Count();
                TotalMonth = _hit.Where(x => x.visitTime.Year == DateTime.Now.Year && x.visitTime.Month == DateTime.Now.Month).Count();
                Total = _hit.Count();
            }
            catch
            {
            }
            ViewBag.TotalOnline = TotalOnline.ToString("N0");
            ViewBag.TotalYesterday = TotalYesterday.ToString("N0"); ;
            ViewBag.TotalMonth = TotalMonth.ToString("N0");
            ViewBag.Total = Total.ToString("N0");
            return PartialView();
        }

        public ActionResult getSearch()
        {
            return PartialView();
        }

        public ActionResult Search(string searchKey, int? _pageIndex)
        {
            if (string.IsNullOrEmpty(searchKey))
            {
                var entity = new ContentView();
                return View(entity.ViewContents);
            }
            else
            {
                int _totalRecord = 0;
                _pageIndex = _pageIndex ?? 1;
                var entity = _services.GetAll(searchKey, null, null, null, "TINTUC", 1, false, _pageIndex, 10, null, true);
                _totalRecord = entity.TotalRecord;
                ViewBag.TotalRecord = _totalRecord.ToString();
                ViewBag.TotalPage = entity.Total;
                ViewBag.PageIndex = _pageIndex ?? 1;
                ViewBag.SearchKey = searchKey;
                return View(entity.ViewContents.OrderByDescending(x => x.contentCreateTime));
            }

        }

        public ActionResult getChildDisplay(int Id, string _url, int? _pageIndex)
        {
            int _totalRecord = 0;
            _pageIndex = _pageIndex ?? 1;
            var entity = _services.GetAll(null, null, null, Id, null, 1, false, _pageIndex, 10, null, true);
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.CurentUrl = _url;
            return PartialView(entity.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getChildDisplayMedia(int Id, string _url, int? _pageIndex)
        {
            int _totalRecord = 0;
            _pageIndex = _pageIndex ?? 1;
            var entity = _services.GetAll(null, null, null, Id, null, 1, false, _pageIndex, 12, null, true);
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.CurentUrl = _url;
            return PartialView(entity.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getMenuTop()
        {
            ViewBag.LinkFanPage = _configSystemServices.GetValueByKey("LinkFanPage");
            ViewBag.LinkSiteMap = _configSystemServices.GetValueByKey("LinkSiteMap");
            ViewBag.LinkMessenger = _configSystemServices.GetValueByKey("LinkMessenger");
            ViewBag.LinkEnglish = _configSystemServices.GetValueByKey("LinkEnglish");
            return PartialView();
        }

        public ActionResult LienHe()
        {
            Session["CAPTCHA"] = GetRandomText();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult LienHe(Contact entity, string txtCaptcha)
        {
            if (ModelState.IsValid)
            {
                string text = Session["CAPTCHA"].ToString();
                if (txtCaptcha.ToLower() == text.ToLower())
                {
                    var model = new Contact();
                    model.contactFullName = entity.contactFullName;
                    model.contactTitle = entity.contactTitle;
                    model.contactEmail = entity.contactEmail;
                    model.contactBody = entity.contactBody;
                    model.createTime = DateTime.Now;
                    model.isTrash = false;
                    _contactServices.Add(model);
                    _contactServices.Save();
                    return Redirect("/");
                }
                return View(entity);
            }
            return View(entity);
        }

        private string GetRandomText()
        {
            StringBuilder randomText = new StringBuilder();
            string alphabets = "012345679ACEFGHKLMNPRSWXZabcdefghijkhlmnopqrstuvwxyz";
            Random r = new Random();
            for (int j = 0; j < 4; j++)
            {
                randomText.Append(alphabets[r.Next(alphabets.Length)]);
            }
            return randomText.ToString();
        }

        public FileResult GetCaptchaImage()
        {
            string text = Session["CAPTCHA"].ToString();
            MemoryStream ms = new MemoryStream();
            RandomImage _captcha = new RandomImage(text, 220, 50);
            _captcha.Image.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            _captcha.Dispose();
            return File(ms.ToArray(), "image/png");
        }

        public ActionResult ThongBao(int? _pageIndex)
        {
            int _totalRecord = 0;
            var entity = _services.GetThongBao(null, null, null, null, "TINTUC", 1, false, true, _pageIndex, 10);
            _pageIndex = _pageIndex ?? 1;
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            return View(entity.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult LichCongTacToanTruong()
        {
            var entity = _services.GetAll(null, null, null, null, "LICHCONGTACTOANTRUONG", 1, false, null, 5, null, true);
            return PartialView(entity.ViewContents);
        }

        public ActionResult LichCongTac()
        {
            var entity = _services.GetAll(null, null, null, null, "DONVIPHONGKHOA", 1, false, null, null, null, true);
            return View(entity.ViewContents.Where(x => x.contentParentId == null).OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult childrenLichCongTac(int Id)
        {
            var entity = _services.GetAll(null, null, null, Id, "DONVIPHONGKHOA", 1, false, null, null, null, true);
            return PartialView(entity.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult LichCongTacChildren(int Id, string _url, int? _pageIndex)
        {
            int _totalRecord = 0;
            var entity = _services.GetAll(null, null, null, Id, "LICHCONGTAC", 1, false, _pageIndex, 10, null, true);
            _pageIndex = _pageIndex ?? 1;
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.CurentUrl = _url;
            return PartialView(entity.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult LichCongTacChildren2(int Id)
        {
            int _totalRecord = 0;
            var entity = _services.GetAll(null, null, null, Id, "LICHCONGTAC", 1, false, 1, 5, null, true);
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            return PartialView(entity.ViewContents);
        }

        public ActionResult ViewVanBan(int Id, string _url, int? _pageIndex)
        {
            int _totalRecord = 0;
            _pageIndex = _pageIndex ?? 1;
            var entity = _services.GetAll(null, null, null, Id, "DOCUMENT", 1, false, _pageIndex, 10, null, true);
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.CurentUrl = _url;
            var entitys = _services.GetAll(null, null, null, Id, "CHUYENMUCTINTUC", 1, false, null, null, null, null);
            ViewBag.ListItem = entitys.ViewContents.OrderBy(x => x.isSort).ToList();
            return PartialView(entity.ViewContents);
        }

        public string getParent(long? Id)
        {
            string _outHtml = "";
            if (Id.HasValue && Id.Value > 0)
            {
                var model = _services.GetById((int)Id.Value);
                _outHtml += getParent(model.contentParentId);
                if (!string.IsNullOrEmpty(_outHtml))
                    _outHtml += " >> ";
                _outHtml += "<a href=\"" + model.contentAlias + "\">" + model.contentName + "</a> >> ";
                return _outHtml;
            }
            else
            {
                return "";
            }
        }

        public ActionResult SoDoWebsite()
        {
            int _languageId = 1;
            int Id = 0;
            if (_languageId == 1)
                int.TryParse(_configSystemServices.GetValueByKey("DanhMucChinh"), out Id);
            List<Menu> eMenus = _menuServices.GetByParent(Id).Where(x => x.isTrash == false).OrderBy(x => x.isSort).ToList();
            string _html = "";
            _html += "<ul>";
            foreach (var item in eMenus)
            {
                _html += " <li>";
                _html += "<a href=\"" + item.menuLink + "\">";
                _html += item.menuName;
                _html += "</a>";
                _html += SubMenu("", null, item.menuLink);
                _html += "</li>";
            }
            _html += "</ul>";
            ViewBag.OutHtml = _html;
            return View();
        }
    }
}