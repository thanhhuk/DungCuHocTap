using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_DungCuHocTap.Models.Models;

namespace Web_DungCuHocTap.Areas.Admin.Controllers
{
    public class HomeController : MiddlewareController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ShowList()
        {
            var list = new WebDungCuHocTapDbContext().SanPhams.ToList();
            return View(list);
        }
    }
}