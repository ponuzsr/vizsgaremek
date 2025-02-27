using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static backend.Models.Dto;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("Comment")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        private readonly ClassicgarageAdatbazisContext _context;

        public CommentController(ClassicgarageAdatbazisContext _context)
        {
            this._context = _context;
        }

        //Kommentek lekérése
        [HttpGet]
        public async Task<ActionResult<Comment>> Get()
        {
            var Comments = await _context.Comments.ToListAsync();
            return Ok(Comments);
        }

        //Komment lekérése id alapján
        [HttpGet("{id}")]
        public async Task<ActionResult> GetCommentById(Guid id)
        {
            var comment = await _context.Comments.Where(comment => comment.Id == id).FirstOrDefaultAsync();

            if (comment != null)
            {
                return Ok(comment);
            }
            return NotFound(new {message = "A komment nem található"});
        }

        //Komment lekérése auto id alapján
        [HttpGet("autocomment/{id}")]
        public async Task<ActionResult> GetCommentByAutoId(Guid id)
        {
            var comment = await _context.Comments.Where(comment => comment.AutoId  == id).ToListAsync();
            if (comment != null)
            {
                
                    return Ok(comment);
                
                
            }
            return NotFound(new { message = "A komment nem található." });

        }

        [HttpPost]
        public async Task<ActionResult> Post(CreateCommentDto createCommentDto)
        {
            var comment = new Comment
            {
                Id = Guid.NewGuid(),
                AutoId = createCommentDto.AutoId,
                CommenteloId = createCommentDto.CommenteloId,
                PostComment = createCommentDto.PostComment


            };
            if (comment != null)
            {
                await _context.Comments.AddAsync(comment);
                _context.SaveChanges();
                return StatusCode(201, comment);
            }
            return  BadRequest(new {result = comment, message = "Hiba az objektum képzése során."});
        }

        [HttpDelete]

        public async Task<ActionResult> Delete(Guid id)
        {
            var comment = await _context.Comments.FirstOrDefaultAsync(comment => comment.Id == id);

            if (comment != null)
            {
                _context.Comments.Remove(comment);
                await _context.SaveChangesAsync();
                return Ok("Sikeres törlés.");

            }
            return BadRequest(new { message = "Sikertelen törlés." });
        }
    }
}
