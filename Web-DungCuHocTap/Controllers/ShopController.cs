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
            List<SanPham> list = new WebDungCuHocTap().SanPhams.ToList();
            return View(list);
        }
    }
}