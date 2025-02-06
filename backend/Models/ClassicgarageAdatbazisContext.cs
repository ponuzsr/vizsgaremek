using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace backend.Models;

public partial class ClassicgarageAdatbazisContext : DbContext
{
    public ClassicgarageAdatbazisContext()
    {
    }

    public ClassicgarageAdatbazisContext(DbContextOptions<ClassicgarageAdatbazisContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Autok> Autoks { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    public virtual DbSet<MuszakiAdatok> MuszakiAdatoks { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySQL("server=localhost;database=classicgarage_adatbazis;user=root;password=password;sslmode=none;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Autok>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("autok");

            entity.HasIndex(e => new { e.ComenteiId, e.MuszakiId }, "Comentei_ID");

            entity.HasIndex(e => e.MuszakiId, "Muszaki_ID");

            entity.Property(e => e.ComenteiId).HasColumnName("Comentei_ID");
            entity.Property(e => e.GyartasEv).HasColumnName("Gyartas_Ev");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Kep).HasMaxLength(255);
            entity.Property(e => e.Marka).HasMaxLength(30);
            entity.Property(e => e.MuszakiId).HasColumnName("Muszaki_ID");
            entity.Property(e => e.Tortenet).HasMaxLength(300);
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("comment");

            entity.HasIndex(e => e.CommenteloId, "Commentelo_ID");

            entity.HasIndex(e => e.Id, "ID");

            entity.Property(e => e.Comment1)
                .HasMaxLength(255)
                .HasColumnName("Comment");
            entity.Property(e => e.CommenteloId).HasColumnName("Commentelo_ID");
            entity.Property(e => e.Id).HasColumnName("ID");
        });

        modelBuilder.Entity<MuszakiAdatok>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("muszaki_adatok");

            entity.HasIndex(e => e.Id, "ID");

            entity.Property(e => e.Fogyasztás).HasColumnName("fogyasztás");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.RitkaE).HasColumnName("Ritka_e");
            entity.Property(e => e.Teljesítmény).HasColumnName("teljesítmény");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
