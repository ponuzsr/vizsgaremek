using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Comment
{
    public Guid Id { get; set; }

    public Guid CommenteloId { get; set; }

    public string Comment1 { get; set; } = null!;
}
