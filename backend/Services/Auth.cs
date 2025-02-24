﻿using backend.Models;
using backend.Services.Dtos;
using backend.Services.IAuthService;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace backend.Services
{
    public class Auth : IAuth
    {
        public readonly ClassicgarageAdatbazisContext _context;
        public readonly UserManager<ApplicationUser> userManager;

        public Auth(ClassicgarageAdatbazisContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            this.userManager = userManager;
        }

        public async Task<object> Register(RegisterRequestDto registerRequestDto)
        {
            ApplicationUser user = new()
            {
                UserName = registerRequestDto.UserName, // Használjuk a kérésből érkező felhasználónevet
                Email = registerRequestDto.Email
            };

            var result = await userManager.CreateAsync(user, registerRequestDto.Password);

            if(result.Succeeded)
            {
                var userReturn = await _context.ApplicationUsers
    .FirstOrDefaultAsync(user => user.UserName.Equals(registerRequestDto.UserName, StringComparison.OrdinalIgnoreCase));



                return new { result = userReturn, message = "Sikeres regisztráció." };
            }

            return new { result = "", message = result.Errors.FirstOrDefault().Description };
            //2025-01-16 11-03-44.mkv következik
        }
    }
}
