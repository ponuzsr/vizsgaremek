using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Comment
{
    public Guid Id { get; set; }
    public string PostComment { get; set; } = null!;

    
    public string CommenteloId { get; set; }
    public Guid AutoId { get; set; }

    public virtual ApplicationUser Commentelo { get; set; } = null!;
    public virtual Autok Auto { get; set; } = null!;
}
