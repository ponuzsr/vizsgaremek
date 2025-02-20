using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Comment
{
    public Guid Id { get; set; }

    public string CommenteloId { get; set; } = null!;

    public string Comment1 { get; set; } = null!;

    public Guid AutokId { get; set; }

    public virtual Autok Autok { get; set; } = null!;

    public virtual Aspnetuser Commentelo { get; set; } = null!;
}
