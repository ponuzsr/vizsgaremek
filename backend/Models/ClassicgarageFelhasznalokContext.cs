using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace backend.Models;

public partial class ClassicgarageFelhasznalokContext : DbContext
{
    public ClassicgarageFelhasznalokContext()
    {
    }

    public ClassicgarageFelhasznalokContext(DbContextOptions<ClassicgarageFelhasznalokContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Felhasznalok> Felhasznaloks { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)

        => optionsBuilder.UseMySQL("server=localhost;database=classicgarage_felhasznalok;user=root;password=;sslmode=none;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Felhasznalok>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("felhasznalok");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Email).HasMaxLength(40);
            entity.Property(e => e.Jelszo).HasMaxLength(16);
            entity.Property(e => e.Nev).HasMaxLength(60);
            entity.Property(e => e.Prof).HasMaxLength(255);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
