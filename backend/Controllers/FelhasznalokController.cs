using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FelhasznalokController : ControllerBase
    {
        private readonly ClassicgarageFelhasznalokContext _context;

        public FelhasznalokController(ClassicgarageFelhasznalokContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<Felhasznalok>> GetFelhasznalok(string Nev)
        {
            return Ok();
        }
    }
}
