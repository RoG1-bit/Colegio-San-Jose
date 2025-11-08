using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema; // Necesario para [ForeignKey]

namespace Colegio_San_Jose.Models
{
    public class Expediente
    {
        [Key] // Marca ExpedienteId como la Primary Key (PK)
        public int ExpedienteId { get; set; }

        // --- Claves Foráneas (FK) ---
        [Display(Name = "Alumno")]
        public int AlumnoId { get; set; } // La FK que apunta a Alumno

        [Display(Name = "Materia")]
        public int MateriaId { get; set; } // La FK que apunta a Materia

        [Required(ErrorMessage = "La nota final es obligatoria")]
        [Range(0, 100, ErrorMessage = "La nota debe estar entre 0 y 100")]
        public decimal NotaFinal { get; set; }

        public string Observaciones { get; set; } = string.Empty;

        // --- Propiedades de Navegación ---
        // Le dicen a EF que este expediente pertenece a UN Alumno y a UNA Materia.
        // Esto nos permitirá hacer cosas como: Expediente.Alumno.Nombre
        [ForeignKey("AlumnoId")]
        public Alumno? Alumno { get; set; }

        [ForeignKey("MateriaId")]
        public Materia? Materia { get; set; }
    }
}
