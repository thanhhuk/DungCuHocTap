using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_DungCuHocTap.Models;
using Web_DungCuHocTap.Models.Models;

namespace Web_DungCuHocTap.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Cart()
        {
            return View();
        }

        [HttpGet]
        public JsonResult AddItem(int id)
        {
            var item = new WebDungCuHocTapDbContext().SanPhams.Find(id);
            if (item == null)
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
            if (Session["CartItem"] == null)
            {

                var cart = new List<CartModel>();
                cart.Add(new CartModel()
                {
                    SP = item,
                    Quantity = 1
                });
                Session["CartItem"] = cart;
            }
            else
            {
                var cart = Session["CartItem"] as List<CartModel>;
                cart.Add(new CartModel()
                {
                    SP = item,
                    Quantity = 1
                });
            }
            return Json(1, JsonRequestBehavior.AllowGet);
        }
    }
}