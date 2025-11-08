using System.Collections.Generic;
using System.ComponentModel.DataAnnotations; // Necesario para [Key], [Required], etc.

namespace Colegio_San_Jose.Models
{
    public class Alumno
    {
        [Key] // Esto le dice a Entity Framework que AlumnoId es la Primary Key (PK)
        public int AlumnoId { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")] // Hace que el campo sea requerido
        public string Nombre { get; set; } = string.Empty;

        [Required(ErrorMessage = "El apellido es obligatorio")]
        public string Apellido { get; set; } = string.Empty;

        [Required(ErrorMessage = "La fecha de nacimiento es obligatoria")]
        public DateTime FechaNacimiento { get; set; }

        [Required(ErrorMessage = "El grado es obligatorio")]
        public string Grado { get; set; } = string.Empty;

        // --- Propiedad de Navegación ---
        // Esto le dice a EF que un Alumno puede tener MUCHOS Expedientes.
        // No es una columna en la BD, es solo para que EF entienda la relación.
        public ICollection<Expediente> Expedientes { get; set; } = new List<Expediente>();
    }
}
