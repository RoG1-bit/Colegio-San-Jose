using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Colegio_San_Jose.Models
{
    public class Materia
    {
        [Key] // Marca MateriaId como la Primary Key (PK)
        public int MateriaId { get; set; }

        [Required(ErrorMessage = "El nombre de la materia es obligatorio")]
        public string NombreMateria { get; set; } = string.Empty;

        [Required(ErrorMessage = "El nombre del docente es obligatorio")]
        public string Docente { get; set; } = string.Empty;

        // --- Propiedad de Navegación ---
        // Le dice a EF que una Materia puede estar en MUCHOS Expedientes.
        public ICollection<Expediente> Expedientes { get; set; } = new List<Expediente>();
    }
}
