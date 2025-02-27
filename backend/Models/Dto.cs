namespace backend.Models
{
    public class Dto
    {
        public record CreateAutokDto(int IdEv, string Marka, int GyartasEv, string Tortenet, string Kep, string Kobcenti, string Tipus);
        public record UpdateAutokDto(int IdEv, string Marka, int GyartasEv, string Tortenet, string Kep, string Kobcenti, string Tipus);

        public record CreateCommentDto(string PostComment, string CommenteloId, Guid AutoId, DateTime CreatedTime);

       
    }
}
