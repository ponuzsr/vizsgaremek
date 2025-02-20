using backend.Services.Dtos;

namespace backend.Services.IAuthService
{
    public interface IAuth
    {
        Task<string> Register(RegisterRequestDto registerRequestDto);
    }
}
