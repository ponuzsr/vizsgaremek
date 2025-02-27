using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backend.Migrations
{
    /// <inheritdoc />
    public partial class AddColums : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Kobcenti",
                table: "Autoks",
                type: "longtext",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Tipus",
                table: "Autoks",
                type: "longtext",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Kobcenti",
                table: "Autoks");

            migrationBuilder.DropColumn(
                name: "Tipus",
                table: "Autoks");
        }
    }
}
