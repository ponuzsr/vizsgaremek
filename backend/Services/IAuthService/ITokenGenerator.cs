using backend.Models;

namespace backend.Services.IAuthService
{
    public interface ITokenGenerator
    {
        string GenerateToken(Felhasznalok applicationUser, IEnumerable<string> role);
    }
}
