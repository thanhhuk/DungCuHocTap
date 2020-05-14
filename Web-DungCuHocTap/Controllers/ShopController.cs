using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_DungCuHocTap.Models.Models;

namespace ThucTapNhom_WebDungCuHocTap.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        public ActionResult DanhSachSanPham(string search)
        {
            ViewBag.search = HttpUtility.UrlEncode(search);
            return View();
        }

        public ActionResult DanhSachPartial(string search, int index)
        {
            int step = 32;
            search = HttpUtility.UrlDecode(search);
            List<SanPham> list = new WebDungCuHocTapDbContext().SanPhams.ToList();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(x => x.TenSP.Contains(search)).ToList();
            }
            list = list.Skip(index * step).Take(step).ToList();

            return PartialView("DanhSachPartial", list);
        }

        public ActionResult ChiTietSanPham(int id)
        {
            SanPham item = new WebDungCuHocTapDbContext().SanPhams.Find(id);
            if (item == null)
            {
                return HttpNotFound(); //404
            }
            return View(item);
        }
    }
}