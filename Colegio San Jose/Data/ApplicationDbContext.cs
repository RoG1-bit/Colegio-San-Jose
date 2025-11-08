using Microsoft.EntityFrameworkCore; // Necesario para DbContext
using Colegio_San_Jose.Models; // ¡Importante! Debemos decirle dónde encontrar nuestros Modelos


namespace Colegio_San_Jose.Data
{
    public class ApplicationDbContext : DbContext
    {
        // Esto es el "constructor". Le pasa la configuración (como la cadena de conexión)
        // a la clase base de Entity Framework.
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // --- ¡Aquí le decimos al gerente qué tablas administrar! ---
        // Cada 'DbSet' se convertirá en una tabla en la base de datos.

        public DbSet<Alumno> Alumnos { get; set; }
        public DbSet<Materia> Materias { get; set; }
        public DbSet<Expediente> Expedientes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configurar la precisión para la propiedad decimal NotaFinal
            modelBuilder.Entity<Expediente>()
                .Property(e => e.NotaFinal)
                .HasPrecision(5, 2); // 5 dígitos en total, 2 después del punto decimal (ej: 100.00)
        }
    }
}