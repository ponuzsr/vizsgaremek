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

        [HttpGet("{id}")]
        public async Task<ActionResult> GetAutoById(Guid id)
        {
            var auto = await _context.Autoks.Where(auto => auto.Id == id).FirstOrDefaultAsync();

            if (auto != null)
            {
                return Ok(auto);
            }
            return NotFound(new { message = "Az autó nem található az adatbázisban."});
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

        [HttpDelete]
        public async Task<ActionResult> Delete(Guid Id)
        {
            var Auto = await _context.Autoks.SingleOrDefaultAsync(a =>a.Id == Id);

            if(Auto != null)
            {
                _context.Autoks.Remove(Auto);
                await _context.SaveChangesAsync();
                return Ok("Sikeres törlés");
            }
            return BadRequest(new { message = "Sikertelen törlés" });
        }
    }
}
