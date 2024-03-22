using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Quiz.Helper;

public class AuthAttribute : ActionFilterAttribute
{
    public override void OnActionExecuting(ActionExecutingContext context)
    {
        var userLogin = context.HttpContext.Request.Cookies.GetCookies<int>("userid");

        if (context.HttpContext.Request.Path.Value!.StartsWith("/auth"))
        {
            if (userLogin > 0)
                context.Result = new RedirectToActionResult("Index", "Home", null);
        }
        else if (userLogin == 0)
            context.Result = new RedirectToActionResult("Index", "Auth", null);
        base.OnActionExecuting(context);
    }
}
