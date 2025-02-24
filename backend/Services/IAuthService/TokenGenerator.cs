using backend.Models;

namespace backend.Services.IAuthService
{
    public class TokenGenerator : ITokenGenerator
    {
        public string GenerateToken(ApplicationUser aspnetuser, IEnumerable<string> role)
        {
            throw new NotImplementedException();
        }
    }
}
