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
        public ActionResult getSubMenu(int Id)
        {
            List<Menu> eMenus = _menuServices.GetByParent(Id).OrderBy(x => x.isSort).ToList();
            return PartialView(eMenus);
        }

        public ActionResult getBannerMain()
        {
            string _banner = _configSystemServices.GetValueByKey("SiteBanner");
            if (!string.IsNullOrEmpty(_banner))
                ViewBag.Banner = "<a href=\"/\"><img src=\"" + _banner + "\" alt=\"banner\" /></a>";
            else
                ViewBag.Banner = "";
            return PartialView();
        }
    }
}