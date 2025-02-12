using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Autok
{
    public Guid Id { get; set; }

    public int IdEv { get; set; }

    public string? Marka { get; set; }

    public int? GyartasEv { get; set; }

    public string? Tortenet { get; set; }

    public string? Kep { get; set; }

    public Guid? ComenteiId { get; set; }

    public Guid? MuszakiId { get; set; }
}
