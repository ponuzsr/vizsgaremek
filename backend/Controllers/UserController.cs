using backend.Models;
using backend.Services.Dtos;
using backend.Services.IAuthService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("Felhasználók")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IAuth auth;
        private readonly ClassicgarageAdatbazisContext _context;
        public readonly UserManager<ApplicationUser> userManager;

        public UserController(IAuth auth, ClassicgarageAdatbazisContext context, UserManager<ApplicationUser> userManager)
        {
            this.auth = auth;
            _context = context;
            this.userManager = userManager;
        }





        //Felhasználó hozzáadása
        [HttpPost("Register")]
        public async Task<ActionResult> AddNewUser(RegisterRequestDto registerRequestDto)
        {
            var user = await auth.Register(registerRequestDto);

            if (user != null)
            {
                return StatusCode(201, user);
            }
            return BadRequest(new { result = "", message = "Sikertelen regisztráció." });
        }

        //Bejelentkezés
        [HttpPost("Login")]
        public async Task<ActionResult> LoginUser(LoginRequestDto loginRequestDto)
        {
            var res = await auth.Login(loginRequestDto);

            if (res != null)
            {
                return StatusCode(200, res);
            }

            return NotFound(res);
        }

        //Szerepkör hozzá rendelés felhasználóhoz
        [HttpPost("AssignRole")]
        public async Task<ActionResult> AddRole(string UserName, string roleName)
        {
            var res = await auth.AssignRole(UserName, roleName);
            if (res != null)
            {
                return Ok(res);
            }
            return BadRequest(res);
        }

        //felhasználók lekérdezése
        [HttpGet]
        public async Task<ActionResult<ApplicationUser>> Getusers()
        {
            var users = await userManager.Users.ToListAsync();

            return Ok(users);

        }

        //felhasználó törlése
        [HttpDelete]
        public async Task<ActionResult<ApplicationUser>>DeleteUser(Guid id)
        {
            
            var user = await userManager.Users.FirstOrDefaultAsync(x=>x.Id==Convert.ToString(id));
            if (user != null)
            {
                _context.Users.Remove(user);
                await _context.SaveChangesAsync();
                return Ok("Sikeres törlés!");
            }
            return BadRequest(new { message = "Sikertelen törlés." });
        }
    }
}
