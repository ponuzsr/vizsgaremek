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

    

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Autok>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("autok");

            entity.HasIndex(e => new { e.ComenteiId, e.MuszakiId }, "Comentei_ID");

            entity.HasIndex(e => e.MuszakiId, "Muszaki_ID");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ComenteiId)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("Comentei_ID");
            entity.Property(e => e.GyartasEv)
                .HasDefaultValueSql("'NULL'")
                .HasColumnType("int(11)")
                .HasColumnName("Gyartas_Ev");
            entity.Property(e => e.IdEv)
                .HasColumnType("int(11)")
                .HasColumnName("ID_ev");
            entity.Property(e => e.Kep)
                .HasMaxLength(255)
                .HasDefaultValueSql("'NULL'");
            entity.Property(e => e.Marka)
                .HasMaxLength(30)
                .HasDefaultValueSql("'NULL'");
            entity.Property(e => e.MuszakiId)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("Muszaki_ID");
            entity.Property(e => e.Tortenet)
                .HasMaxLength(300)
                .HasDefaultValueSql("'NULL'");
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

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
