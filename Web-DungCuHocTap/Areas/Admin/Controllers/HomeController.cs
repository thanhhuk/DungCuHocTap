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
        WebDungCuHocTapDbContext db = new WebDungCuHocTapDbContext();
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ShowList()
        {
            var list = db.SanPhams.ToList();
            return View(list);
        }

        [HttpPost]
        public JsonResult DeleteProduct(int id)
        {
            try
            {
                var item = db.SanPhams.Find(id);
                if (item == null)
                {
                    return Json(0, JsonRequestBehavior.AllowGet);
                }
                db.SanPhams.Remove(item);
                db.SaveChanges();
                return Json(1, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }

        }
    }
}