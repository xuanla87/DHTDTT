using ServiceNews.Models;
using ServiceNews.Services;
using ProjectNews.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using ProjectNews.Models;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class LichSuThaoTacController : Controller
    {
        private ILogSystemServices _services;
        public LichSuThaoTacController(ILogSystemServices services)
        {
            _services = services;
        }
        public ActionResult Index(string _userName, DateTime? _fromDate, DateTime? _toDate, int? _pageIndex)
        {
            LogSystemView result;
            result = _services.GetAll(null, _userName, _fromDate, _toDate, _pageIndex, 20);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.FromDate = _fromDate?.ToString("dd/MM/yyyy") ?? null;
            ViewBag.ToDate = _toDate?.ToString("dd/MM/yyyy") ?? null;
            ApplicationDbContext db = new ApplicationDbContext();
            var listUser = db.Users.ToList();
            ViewBag._userName = listUser.Select(x => new SelectListItem { Text = x.UserName, Value = x.UserName.ToString() });
            return View(result.ViewLogSystems);
        }
    }
}