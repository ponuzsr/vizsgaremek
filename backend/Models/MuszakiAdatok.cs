using System;
using System.Collections.Generic;

namespace backend.Models;

public partial class MuszakiAdatok
{
    public Guid Id { get; set; }

    public int Motorszám { get; set; }

    public int Teljesítmény { get; set; }

    public int Fogyasztás { get; set; }

    public int RitkaE { get; set; }
}
