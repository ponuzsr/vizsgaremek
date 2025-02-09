using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AutokController : ControllerBase
    {
        private readonly ClassicgarageAdatbazisContext _context;
        public AutokController(ClassicgarageAdatbazisContext _context)
        {
            this._context = _context;
        }
        [HttpGet]
        public ActionResult<Autok>Get()
        {
            var autok=_context.Autoks.ToList();
            return Ok(autok);
        }
        [HttpPost]

        public ActionResult<Autok> Post (CreateAutokDto createAutokDto)
        {
            var auto = new Autok
            {
                Id = Guid.NewGuid(),
                Marka = createAutokDto.Marka,
                GyartasEv = createAutokDto.GyartasEv,
                Tortenet = createAutokDto.Tortenet,
                Kep = createAutokDto.Kep,
                ComenteiId = Guid.NewGuid(),
                MuszakiId = Guid.NewGuid()
            };

            if(auto != null )
            {
                using (var context = new ClassicgarageAdatbazisContext())
                {
                    context.Autoks.Add(auto);
                    context.SaveChanges();
                    return StatusCode(201, auto);
                }
            }
            return BadRequest(new { message = "Hiba az objektum képzése során." });
        }
    }
}
