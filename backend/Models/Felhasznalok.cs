using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Felhasznalok
{
    public Guid Id { get; set; }

    public string Nev { get; set; } = null!;

    public string Jelszo { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Prof { get; set; } = null!;
}
