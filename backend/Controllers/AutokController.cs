using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static backend.Models.Dto;

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
        public async Task<ActionResult<Autok>> Get()
        {
            var autok = await _context.Autoks.ToListAsync();
            return Ok(autok);
        }
        [HttpPost]

        public async Task<ActionResult> Post(CreateAutokDto createAutokDto)
        {
            var auto = new Autok
            {
                Id = Guid.NewGuid(),
                Marka = createAutokDto.Marka,
                GyartasEv = createAutokDto.GyartasEv,
                IdEv = createAutokDto.IdEv,
                Tortenet = createAutokDto.Tortenet,
                Kep = createAutokDto.Kep,
                ComenteiId = Guid.NewGuid(),
                MuszakiId = Guid.NewGuid()
            };

            if (auto != null)
            {

                await _context.Autoks.AddAsync(auto);
                _context.SaveChanges();
                return StatusCode(201, auto);

            }
            return BadRequest(new { result = auto, message = "Hiba az objektum képzése során." });
        }
    }
}
