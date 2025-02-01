using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Adatok
{
    public Guid Id { get; set; }

    public string Marka { get; set; } = null!;

    public int GyartasEv { get; set; }

    public int NepszerusegCsucs { get; set; }

    public string Tortenet { get; set; } = null!;

    public string Kep { get; set; } = null!;

    public int Ritkasag { get; set; }
}
