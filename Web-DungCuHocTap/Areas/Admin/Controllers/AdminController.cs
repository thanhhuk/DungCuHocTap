using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_DungCuHocTap.Areas.Admin.Models;
using Web_DungCuHocTap.Models.Models;

namespace Web_DungCuHocTap.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public JsonResult DangNhap(LoginModel model)
        {
            string enc = Web_DungCuHocTap.Controllers.CustomerController.MD5Hash(model.AdminPassword);
            var result = new WebDungCuHocTapDbContext().Admins.Count(x => x.AdminUserName == model.AdminUsername && x.AdminPassword == enc);

            if (ModelState.IsValid && result > 0)
            {
                Session["AdminLogin"] = new Web_DungCuHocTap.Models.Models.Admin
                {
                    AdminUserName = model.AdminUsername
                };
                return Json(1, JsonRequestBehavior.AllowGet);
            }
            return Json(0, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Logout()
        {
            Session["AdminLogin"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}