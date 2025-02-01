using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Auto
{
    public Guid Id { get; set; }

    public Guid CommentSecId { get; set; }

    public Guid AdatId { get; set; }
}
