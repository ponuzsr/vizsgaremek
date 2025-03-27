using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace backend.Models;

public partial class ClassicgarageAdatbazisContext : IdentityDbContext<ApplicationUser>
{
    public ClassicgarageAdatbazisContext(DbContextOptions options) : base(options)
    {
    }

    protected ClassicgarageAdatbazisContext()
    {
    }

    public virtual DbSet<ApplicationUser> ApplicationUsers { get; set; }

    public virtual DbSet<Autok> Autoks { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    

    //partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
