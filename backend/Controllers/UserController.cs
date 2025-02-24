using backend.Services.Dtos;
using backend.Services.IAuthService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("Felhasználók")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IAuth auth;

        public UserController(IAuth auth)
        {
            this.auth = auth;
        }

        [HttpPost]
        public async Task<ActionResult> AddNewUser(RegisterRequestDto registerRequestDto)
        {
            var user = await auth.Register(registerRequestDto);

            if (user != null)
            {
                return StatusCode(201, user);
            }
            return BadRequest(new { result = "", message = "Sikertelen regisztráció." });
        }
    }
}
