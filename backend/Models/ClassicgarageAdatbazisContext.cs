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

    public virtual DbSet<Adatok> Adatoks { get; set; }

    public virtual DbSet<Auto> Autos { get; set; }

    public virtual DbSet<Autok> Autoks { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)

        => optionsBuilder.UseMySQL("server=localhost;database=classicgarage_adatbazis;user=root;password=;sslmode=none;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Adatok>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("adatok");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.GyartasEv)
                .HasColumnType("int(11)")
                .HasColumnName("Gyartas_Ev");
            entity.Property(e => e.Kep).HasMaxLength(255);
            entity.Property(e => e.Marka).HasMaxLength(30);
            entity.Property(e => e.NepszerusegCsucs)
                .HasColumnType("int(11)")
                .HasColumnName("Nepszeruseg_Csucs");
            entity.Property(e => e.Ritkasag).HasColumnType("int(11)");
            entity.Property(e => e.Tortenet).HasMaxLength(300);
        });

        modelBuilder.Entity<Auto>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("auto");

            entity.HasIndex(e => e.AdatId, "Adat_ID");

            entity.HasIndex(e => new { e.CommentSecId, e.AdatId }, "Comment_Sec_ID");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AdatId).HasColumnName("Adat_ID");
            entity.Property(e => e.CommentSecId).HasColumnName("Comment_Sec_ID");
        });

        modelBuilder.Entity<Autok>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("autok");

            entity.Property(e => e.ComenteiId).HasColumnName("Comentei_ID");
            entity.Property(e => e.GyartasEv)
                .HasColumnType("int(11)")
                .HasColumnName("Gyartas_Ev");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Kep).HasMaxLength(255);
            entity.Property(e => e.Marka).HasMaxLength(30);
            entity.Property(e => e.MuszakiId).HasColumnName("Muszaki_ID");
            entity.Property(e => e.Tortenet).HasMaxLength(300);
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("comment");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Comment1)
                .HasMaxLength(255)
                .HasColumnName("Comment");
            entity.Property(e => e.CommenteloId).HasColumnName("Commentelo_ID");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
