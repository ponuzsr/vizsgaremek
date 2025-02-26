﻿using backend.Services.Dtos;
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
    }
}
