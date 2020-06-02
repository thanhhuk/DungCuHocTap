using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Web_DungCuHocTap.Areas.Admin.Controllers
{
    public class MiddlewareController : Controller
    {
        // GET: Admin/Middleware
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = Session["AdminLogin"] as Web_DungCuHocTap.Models.Models.Admin;
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary(
                        new { controller = "Admin", action = "Login", Area = "Admin" })
                    );
            }
            base.OnActionExecuting(filterContext);
        }
    }
}