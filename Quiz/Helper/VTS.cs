using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;

namespace Quiz.Helper
{
    public class VTS
    {
        public static string RVTS(Controller controller, string ViewName, object model = null)
        {
            controller.ViewData.Model = model;
            using (var writer = new StringWriter())
            {
                IViewEngine? viewEngine = controller.HttpContext.RequestServices.GetService(typeof(ICompositeViewEngine)) as ICompositeViewEngine;
                ViewEngineResult viewResult = viewEngine!.FindView(controller.ControllerContext, ViewName, false);

                ViewContext viewContext = new ViewContext(controller.ControllerContext,
                                                          viewResult.View!,
                                                          controller.ViewData,
                                                          controller.TempData,
                                                          writer,
                                                          new HtmlHelperOptions());
                viewResult.View!.RenderAsync(viewContext);
                return writer.GetStringBuilder().ToString();
            }
        }
    }
}
