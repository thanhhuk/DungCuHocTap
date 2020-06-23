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
        public ActionResult DanhSachSanPham()
        {
            List<SanPham> list = new WebDungCuHocTapDbContext().SanPhams.ToList();
            return View(list);
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

        public ActionResult AloAlo()
        {
            return View();
        }
    }
}