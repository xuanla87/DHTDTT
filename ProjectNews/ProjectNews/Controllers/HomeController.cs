using System;
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
            return PartialView();
        }

        public ActionResult Detail(string pageUrl)
        {
            var entity = _services.GetByAlias(pageUrl);
            return View(entity);
        }

        public ActionResult Display(string pageUrl, int? _pageIndex)
        {
            var entity = _services.GetByAlias(pageUrl);
            if (entity != null)
            {
                ViewBag.Title = entity.contentName;
                entity.contentView += 1;
                _services.Update(entity);
                _services.Save();
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
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null);
            return PartialView(eSlider.ViewContents);
        }

        public ActionResult getBox1()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxBanner"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null);
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getBoxLienKet()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxLienKet"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null);
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getBoxBannerPhai()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxBannerRight"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "BANNER", 1, false, null, null);
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getBoxTinTucChung()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxTinTucChung"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "TINTUC", 1, false, null, null);
            var entity = _services.GetById(Id);
            ViewBag.Readmore = "<a href=\"" + entity.contentAlias + "\">>>>>Xem thêm</a>";
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime).Take(6));
        }

        public ActionResult getBoxTinTucNganh()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxTinTucNganh"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "TINTUC", 1, false, null, null);
            var entity = _services.GetById(Id);
            ViewBag.Readmore = "<a href=\"" + entity.contentAlias + "\">>>>>Xem thêm</a>";
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime).Take(5));
        }

        public ActionResult getBoxSachVaHocLieu()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxSachVaHocLieu"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "TINTUC", 1, false, null, null);
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime).Take(1));
        }

        public ActionResult getBoxPhongSuAnh()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxPhongSuAnh"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "TINTUC", 1, false, null, null);
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult getBoxMedia()
        {
            int Id = 0;
            int.TryParse(_configSystemServices.GetValueByKey("BoxMedia"), out Id);
            var eSlider = _services.GetAll(null, null, null, Id, "MEDIA", 1, false, null, null);
            return PartialView(eSlider.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getThongBao()
        {
            var eSlider = _services.GetThongBao(null, null, null, null, "TINTUC", 1, false, true, null, null);
            return PartialView(eSlider.ViewContents.OrderByDescending(x => x.contentCreateTime));
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
            var _hit = db.Visitors.ToList();
            TotalOnline = (int)HttpContext.Application["Totaluser"];
            TotalYesterday = _hit.Where(x => x.visitTime <= DateTime.Now && x.visitTime >= DateTime.Now.Date).Count();
            TotalMonth = _hit.Where(x => x.visitTime.Year == DateTime.Now.Year && x.visitTime.Month == DateTime.Now.Month).Count();
            Total = _hit.Count();
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

        public ActionResult Search(string searchKey, int? pageIndex)
        {
            return View();
        }

        public ActionResult getChildDisplay(int Id, string _url, int? _pageIndex)
        {
            int _totalRecord = 0;
            _pageIndex = _pageIndex ?? 1;
            var entity = _services.GetAll(null, null, null, Id, null, 1, false, _pageIndex, 10);
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.CurentUrl = _url;
            return PartialView(entity.ViewContents.OrderBy(x => x.isSort));
        }

        public ActionResult getMenuTop()
        {
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

        public ActionResult LichCongTac()
        {
            var entity = _services.GetAll(null, null, null, null, "DONVIPHONGKHOA", 1, false, null, null);
            return View(entity.ViewContents.Where(x => x.contentParentId == null).OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult childrenLichCongTac(int Id)
        {
            var entity = _services.GetAll(null, null, null, Id, "DONVIPHONGKHOA", 1, false, null, null);
            return PartialView(entity.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult LichCongTacChildren(int Id, string _url, int? _pageIndex)
        {
            int _totalRecord = 0;
            var entity = _services.GetAll(null, null, null, Id, "LICHCONGTAC", 1, false, _pageIndex, 10);
            _pageIndex = _pageIndex ?? 1;
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.CurentUrl = _url;
            return PartialView(entity.ViewContents.OrderByDescending(x => x.contentCreateTime));
        }

        public ActionResult ViewVanBan(int Id, string _url, int? _pageIndex)
        {
            int _totalRecord = 0;
            _pageIndex = _pageIndex ?? 1;
            var entity = _services.GetAll(null, null, null, Id, "DOCUMENT", 1, false, _pageIndex, 10);
            _totalRecord = entity.TotalRecord;
            ViewBag.TotalRecord = _totalRecord.ToString();
            ViewBag.TotalPage = entity.Total;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.CurentUrl = _url;
            var entitys = _services.GetAll(null, null, null, Id, "CHUYENMUCTINTUC", 1, false, null, null);
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
    }
}