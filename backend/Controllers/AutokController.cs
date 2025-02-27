using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static backend.Models.Dto;

namespace backend.Controllers
{
    [Route("Autok")]
    [ApiController]
    public class AutokController : ControllerBase
    {
        private readonly ClassicgarageAdatbazisContext _context;
        public AutokController(ClassicgarageAdatbazisContext _context)
        {
            this._context = _context;
        }

        //Atók lekérése
        [HttpGet]
        public async Task<ActionResult<Autok>> Get()
        {
            var autok = await _context.Autoks.Include(x => x.Comments).ToListAsync();
            return Ok(autok);
        }

        //Auto lekérése id alapján
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

        //Új autó hozzáadása
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
                Kobcenti = createAutokDto.Kobcenti,
                Tipus = createAutokDto.Tipus
             
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
            var Auto = await _context.Autoks.FirstOrDefaultAsync(a =>a.Id == Id);

            if(Auto != null)
            {
                _context.Autoks.Remove(Auto);
                await _context.SaveChangesAsync();
                return Ok("Sikeres törlés");
            }
            return BadRequest(new { message = "Sikertelen törlés" });
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Autok>> Put(UpdateAutokDto updateAutokDto,Guid id)
        {
            var existingAuto = await _context.Autoks.FirstOrDefaultAsync(a => a.Id == id);
            if(existingAuto != null)
            {
                existingAuto.IdEv = updateAutokDto.IdEv;
                existingAuto.Marka = updateAutokDto.Marka;
                existingAuto.GyartasEv = updateAutokDto?.GyartasEv;
                existingAuto.Tortenet = updateAutokDto?.Tortenet;
                existingAuto.Kep = updateAutokDto?.Kep;
                existingAuto.Kobcenti = updateAutokDto.Kobcenti;
                existingAuto.Tipus = updateAutokDto.Tipus;
                _context.Autoks.Update(existingAuto);
                await _context.SaveChangesAsync();
                return Ok(existingAuto);
            }
            return NotFound(new { message = "Az autó nem található az adatbázisban." });
        }
    }
}
