using ServiceNews.Models;
using ServiceNews.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectNews.Areas.Admin.Controllers
{
    [Authorize]
    public class LienHeController : Controller
    {
        IContactServices _services;
        public LienHeController(IContactServices services)
        {
            this._services = services;
        }
        public ActionResult Index(string _searchKey, DateTime? _formDate, DateTime? _toDate, int? _pageIndex)
        {
            ContactView result;
            result = _services.GetAll(_searchKey, _formDate, _toDate, false, _pageIndex, 20);
            int totalPage = result?.Total ?? 0;
            ViewBag.TotalPage = totalPage;
            ViewBag.PageIndex = _pageIndex ?? 1;
            ViewBag.SearchKey = string.IsNullOrWhiteSpace(_searchKey) ? string.Empty : _searchKey;
            return View(result.ViewContacts);
        }
    }
}