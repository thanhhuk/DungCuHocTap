using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_DungCuHocTap.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        
        public ActionResult AddProduct()
        {
            return View();
        }
    }
}