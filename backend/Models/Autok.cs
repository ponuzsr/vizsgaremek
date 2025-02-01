using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Autok
{
    public Guid Id { get; set; }

    public string Marka { get; set; } = null!;

    public int GyartasEv { get; set; }

    public string Tortenet { get; set; } = null!;

    public string Kep { get; set; } = null!;

    public Guid ComenteiId { get; set; }

    public Guid MuszakiId { get; set; }
}
