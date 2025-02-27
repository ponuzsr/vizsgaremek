using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class Autok
{
    public Guid Id { get; set; }

    public int IdEv { get; set; }

    public string? Marka { get; set; }

    public string? Nev { get; set; }

    public int? GyartasEv { get; set; }

    public bool ritkae {  get; set; }

    public string? Kerekmeghajtas { get; set; }

    public string? maxteljesitmeny {  get; set; }

    public string? Kobcenti {  get; set; }

    public string? Tipus {  get; set; }

    public string? Tortenet { get; set; }

    public string? Kep { get; set; }

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();
   

}
