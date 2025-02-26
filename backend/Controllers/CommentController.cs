﻿using backend.Models;
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

        [HttpGet]
        public async Task<ActionResult<Comment>> Get()
        {
            var Comments = await _context.Comments.ToListAsync();
            return Ok(Comments);
        }
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
    }
}
