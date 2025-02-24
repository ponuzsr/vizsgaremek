using backend.Models;

namespace backend.Services.IAuthService
{
    public interface ITokenGenerator
    {
        string GenerateToken(ApplicationUser aspnetuser, IEnumerable<string> role);
    }
}
