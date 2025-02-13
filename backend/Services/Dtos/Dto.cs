namespace backend.Services.Dtos
{
    public record RegisterRequestDto(string Nev, string Jelszo, string Email, string Prof);

    public record LoginRequestDto(string Nev, string Jelszo);
}
