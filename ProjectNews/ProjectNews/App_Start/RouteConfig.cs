﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ProjectNews
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
              name: "TIMKIEM",
              url: "tim-kiem",
              defaults: new { controller = "Home", action = "Search", id = UrlParameter.Optional }
            );
            routes.MapRoute(
             name: "LIENHE",
             url: "lien-he",
             defaults: new { controller = "Home", action = "LienHe", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            name: "THONGBAO",
            url: "thong-bao-moi",
            defaults: new { controller = "Home", action = "ThongBao", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            name: "LICHCONGTAC",
            url: "lich-cong-tac",
            defaults: new { controller = "Home", action = "LichCongTac", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            name: "LICHCONGTACTOANTRUONG",
            url: "lich-cong-tac-toan-truong",
            defaults: new { controller = "Home", action = "LichCongTacToanTruong", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            name: "SODOWEBSITE",
            url: "so-do-website",
            defaults: new { controller = "Home", action = "SoDoWebsite", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            name: "TINTUCCHUNG",
            url: "tin-tuc-chung",
            defaults: new { controller = "Home", action = "getTinTucChung", id = UrlParameter.Optional }
            );
            routes.MapRoute(
              name: "detail",
              url: "{pageUrl}",
              defaults: new { controller = "Home", action = "Display", pageUrl = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
