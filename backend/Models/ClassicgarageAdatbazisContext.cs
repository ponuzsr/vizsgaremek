using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace backend.Models;

public partial class ClassicgarageAdatbazisContext : IdentityDbContext<ApplicationUser>
{
    public ClassicgarageAdatbazisContext()
    {
    }

    public ClassicgarageAdatbazisContext(DbContextOptions<ClassicgarageAdatbazisContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ApplicationUser> ApplicationUsers { get; set; }

    public virtual DbSet<Autok> Autoks { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySQL("server=localhost;database=classicgarage_adatbazis;user=root;password=;sslmode=none;");

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
