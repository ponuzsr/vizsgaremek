namespace backend.Models
{
    public class Dto
    {
        public record CreateAutokDto(int IdEv, string Marka, int GyartasEv, string Tortenet, string Kep);
    }
}
