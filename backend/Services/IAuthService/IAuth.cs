﻿using backend.Services.Dtos;

namespace backend.Services.IAuthService
{
    public interface IAuth
    {
        Task<object> Register(RegisterRequestDto registerRequestDto);
        Task<object> Login(LoginRequestDto loginRequestDto);
        Task<object> AssignRole(string UserName, string roleName);
    }
}
