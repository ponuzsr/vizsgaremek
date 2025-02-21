using backend.Services.Dtos;

namespace backend.Services.IAuthService
{
    public interface IAuth
    {
        Task<object> Register(RegisterRequestDto registerRequestDto);
    }
}
