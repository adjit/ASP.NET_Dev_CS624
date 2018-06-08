using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace Ch11Cart
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary; // use Temporary for development or if routes might change
            routes.EnableFriendlyUrls(settings, new MyUrlResolver());

            // map static routes
            routes.MapPageRoute("ShopProducts", "Shop/Products",
                "~/Products.aspx");
            routes.MapPageRoute("ShopCart", "Shop/Cart",
                "~/Cart.aspx");

            // map a dynamic route - allow the parameter to be blank
            routes.MapPageRoute("ShopOrder", "Shop/Order/{productID}",
                "~/Order.aspx", false,
                new RouteValueDictionary { { "productID", "" } });
        }
    }

    public class MyUrlResolver : WebFormsFriendlyUrlResolver
    {
        // called when url is traditional (eg, "Order.aspx")
        public override string ConvertToFriendlyUrl(string path)
        {
            if (!string.IsNullOrEmpty(path))
            {
                if (path.Contains("Order") || path.Contains("Products") ||
                path.Contains("Cart"))
                {
                    return "/Shop" + path.Replace(".aspx", "");
                }
            }
            return base.ConvertToFriendlyUrl(path);
        }

        // OPTIONAL //

        //public override void PreprocessRequest(HttpContextBase ctx,
        //IHttpHandler hdlr)
        //{
        //    string path = ctx.Request.CurrentExecutionFilePath;
        //    if (path.Contains("Order") || path.Contains("Products") ||
        //        path.Contains("Cart"))
        //    {
        //        ctx.Response.Redirect("~/Shop" + path);
        //    }
        //    base.PreprocessRequest(ctx, hdlr);
        //}


    }

}
