namespace backend.Models
{
    public class Dto
    {
        public record CreateAutokDto(int IdEv, string Marka, int GyartasEv, string Tortenet, string Kep);

        public record CreateFelhasznaloDto(string Nev, string Jelszo, string Email, string prof);
    }
}
