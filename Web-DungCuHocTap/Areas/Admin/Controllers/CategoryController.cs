using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_DungCuHocTap.Models.Models;

namespace Web_DungCuHocTap.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        WebDungCuHocTapDbContext db = new WebDungCuHocTapDbContext();
        // GET: Admin/Category
        public ActionResult ShowCategory()
        {
            var list = db.Loais.ToList();
            return View(list);
        }

        [HttpPost]
        public JsonResult DeleteCategory(int id)
        {
            try
            {
                var item = db.Loais.Find(id);
                if (item == null)
                {
                    return Json(0, JsonRequestBehavior.AllowGet);
                }
                db.Loais.Remove(item);
                db.SaveChanges();
                return Json(1, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }

        }

        [HttpPost]
        public JsonResult AddCategory(Loai model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var loai = new Loai
                    {
                        TenLoai = model.TenLoai,
                        MetaKeyword = SlugGenerator.SlugGenerator.GenerateSlug(model.TenLoai),
                        NgayTao = DateTime.Now
                    };
                    db.Loais.Add(loai);
                    db.SaveChanges();
                    return Json(loai.MaLoai, JsonRequestBehavior.AllowGet);
                }
                return Json(0, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
        }
    }
}