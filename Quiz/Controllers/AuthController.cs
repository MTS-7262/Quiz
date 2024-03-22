using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quiz.Entities;
using Quiz.Helper;
using Quiz.Models;
using System.Net.NetworkInformation;

namespace Quiz.Controllers
{
    public class AuthController : Controller
    {
        private readonly ApplicationDbContext _dbContext;

        public AuthController(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        [HttpGet("/auth/login")]
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost("/auth/login")]
        public async Task<IActionResult> LoginAsync(string userName)
        {
            var Address = GetPhysicalAddress();
            var User = await _dbContext.TblUsers
                                       .AsNoTracking()
                                       .AsSplitQuery()
                                       .Include(i => i.NetworkInfo)
                                       .Where(w => w.UserName.ToLower().Trim() == userName.ToLower().Trim())
                                       .FirstOrDefaultAsync();

            if (User is not null)
            {
                if (User.NetworkInfo.MAC_Address == Address)
                {
                    Response.Cookies.SetCookies("userid", User.ID);
                    return Redirect("/");
                }
                else
                {
                    ViewData["Error"] = "User Not Exist Create Your Account!";
                    return View("Index");
                }
            }
            else
                ViewData["Error"] = "User Not Exist Create Your Account!";

            return View("Index");
        }

        [HttpGet("/auth/registration")]
        public IActionResult Register()
        {
            return View(new Registration());
        }
        [HttpPost("/auth/registration")]
        public async Task<IActionResult> Register(Registration registration)
        {
            if (ModelState.IsValid)
            {
                var macAddress = GetPhysicalAddress();
                var userExist = await _dbContext.TblUsers
                                                .Include(i => i.NetworkInfo)
                                                .Where(w => w.UserName.ToLower().Trim() == registration.UserName)
                                                .Where(w => w.NetworkInfo.MAC_Address == macAddress)
                                                .FirstOrDefaultAsync();
                if (userExist != null)
                {
                    ModelState.AddModelError(string.Empty, $"{userExist.UserName} Already Exist!");
                }
                else
                {
                    await _dbContext.TblUsers.AddAsync(new Entities.User
                    {
                        UserName = registration.UserName,
                        FirstName = registration.FirstName,
                        LastName = registration.LastName,
                        Number = registration.Number,
                        NetworkInfo = new NetworkInfo { MAC_Address = macAddress }
                    });

                    var result = await _dbContext.SaveChangesAsync();
                    if (result > 0)
                    {
                        return RedirectToAction(nameof(Index));
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Something wrong user not created, Try Again!");
                    }
                }
            }

            return View(registration);
        }


        private static string GetPhysicalAddress()
        {
            string Address = "";
            NetworkInterface[] adapters = NetworkInterface.GetAllNetworkInterfaces();
            foreach (NetworkInterface adapter in adapters)
            {
                if (adapter.NetworkInterfaceType == NetworkInterfaceType.Wireless80211)
                {
                    if (adapter.GetIPProperties().GatewayAddresses.Count > 0)
                    {
                        Address = $"SSID: {adapter.GetPhysicalAddress()}";
                    }
                }
            }

            return Address;
        }
    }
}
