using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;

namespace backend.Models;

public class ApplicationUser : IdentityUser
{
    

    public string? FullName { get; set; }

    
}
