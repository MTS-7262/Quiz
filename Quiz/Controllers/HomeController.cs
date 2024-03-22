using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.ContentModel;
using Quiz.Entities;
using Quiz.Helper;
using Quiz.Models;

namespace Quiz.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _dbContext;

        public HomeController(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        [Auth]
        public IActionResult Index()
        {
            int userId = Request.Cookies.GetCookies<int>("userid");
            var completeTest = _dbContext.TblUserTests
                                            .AsNoTracking()
                                            .Where(w => w.User_ID == userId)
                                            .Count();

            if (completeTest >= 10)
                return RedirectToAction(nameof(Analytics));

            return View();
        }
        [Auth]
        [HttpGet("/analytics")]
        public IActionResult Analytics()
        {
            var result = _dbContext.TblUsers
                                   .AsNoTracking()
                                   .Select(s => new Analytic
                                   {
                                       UserName = s.UserName,
                                       Win = s.Wins,
                                       Loss = s.Losses,
                                   })
                                   .OrderByDescending(o => o.Win)
                                   .ToList();

            return View(result);
        }


        [HttpGet("/get/question")]
        public IActionResult Question(int QuestionId = 0, string SelectOption = "", int NextRequest = 0)
        {
            int userId = Request.Cookies.GetCookies<int>("userid");

            if (userId > 0)
            {
                var user = _dbContext.TblUsers.FirstOrDefault(f => f.ID == userId);
                if (NextRequest > 1)
                {
                    _dbContext.TblUserTests.Add(new UserTest
                    {
                        SelectedOption = SelectOption,
                        User_ID = userId,
                        Test_ID = QuestionId,
                    });

                    var Question = _dbContext.TblTests.Where(w => w.ID == QuestionId).FirstOrDefault();
                    var CurrentAnswer = Question!.CurrectOption.ToLower().Trim().Equals(SelectOption.ToLower().Trim());

                    if (CurrentAnswer)
                        user.Wins++;
                    else
                        user.Losses++;

                    _dbContext.Update(user);
                    _dbContext.SaveChanges();
                }
                else if(NextRequest==1)
                {
                    var userTest = _dbContext.TblUserTests.Where(w => w.User_ID == userId).ToList();
                    _dbContext.RemoveRange(userTest);
                    _dbContext.SaveChanges();

                    user.Wins = 0;
                    user.Losses = 0;

                    _dbContext.Update(user);
                    _dbContext.SaveChanges();

                }

                var Next = _dbContext.TblTests
                                     .AsNoTracking()
                                     .Skip((NextRequest - 1) * 1)
                                     .Take(1)
                                     .FirstOrDefault();
                if (Next == null)
                {
                    return Json(new { isValid = false });
                }
                Question model = new()
                {
                    ID = Next.ID,
                    Image = Next.Image,
                    Ques = Next.Question,
                    Option1 = Next.Option1,
                    Option2 = Next.Option2,
                    Option3 = Next.Option3,
                    Option4 = Next.Option4,
                };


                return Json(new { isValid = true, form = VTS.RVTS(this, "_questions", model) });
            }
            return Json(new { isValid = false });
        }

        public IActionResult Logout()
        {
            var userExist = Request.Cookies.GetCookies<int>("userid");
            if (userExist > 0)
            {
                Response.Cookies.DeleteCookies("userid");
            }
            return RedirectToAction("Index");
        }


    }
}
