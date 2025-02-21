using backend.Models;
using backend.Services.Dtos;
using backend.Services.IAuthService;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace backend.Services
{
    public class Auth : IAuth
    {
        public readonly ClassicgarageAdatbazisContext _context;
        public readonly UserManager<Aspnetuser> userManager;

        public Auth(ClassicgarageAdatbazisContext context, UserManager<Aspnetuser> userManager)
        {
            _context = context;
            this.userManager = userManager;
        }

        public async Task<object> Register(RegisterRequestDto registerRequestDto)
        {
            var user = new Aspnetuser
            {
                UserName = registerRequestDto.UserName,
                Email = registerRequestDto.Email
                
            };
            var result = await userManager.CreateAsync(user, registerRequestDto.Password);

            if(result.Succeeded)
            {
                var userReturn = await _context.aspnetUsers.FirstOrDefaultAsync(user => user.UserName == registerRequestDto.UserName);
                return new {result = userReturn, message = "Sikeres regisztráció!"};
            }
            return new { result = "", message = result.Errors.FirstOrDefault().Description };
            //2025-01-16 11-16-26.mkv következik
        }
    }
}
