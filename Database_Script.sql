-- =============================================
-- Script de Creación de Base de Datos
-- Sistema de Gestión Académica - Colegio San José
-- =============================================


-- =============================================
-- Tabla: Alumnos
-- =============================================
CREATE TABLE [dbo].[Alumnos] (
    [AlumnoId] INT IDENTITY(1,1) NOT NULL,
    [Nombre] NVARCHAR(MAX) NOT NULL,
    [Apellido] NVARCHAR(MAX) NOT NULL,
    [FechaNacimiento] DATETIME2 NOT NULL,
    [Grado] NVARCHAR(MAX) NOT NULL,
    CONSTRAINT [PK_Alumnos] PRIMARY KEY ([AlumnoId])
);

-- =============================================
-- Tabla: Materias
-- =============================================
CREATE TABLE [dbo].[Materias] (
    [MateriaId] INT IDENTITY(1,1) NOT NULL,
    [NombreMateria] NVARCHAR(MAX) NOT NULL,
    [Docente] NVARCHAR(MAX) NOT NULL,
    CONSTRAINT [PK_Materias] PRIMARY KEY ([MateriaId])
);

-- =============================================
-- Tabla: Expedientes
-- =============================================
CREATE TABLE [dbo].[Expedientes] (
    [ExpedienteId] INT IDENTITY(1,1) NOT NULL,
    [AlumnoId] INT NOT NULL,
    [MateriaId] INT NOT NULL,
    [NotaFinal] DECIMAL(18,2) NOT NULL,
    [Observaciones] NVARCHAR(MAX) NOT NULL,
    CONSTRAINT [PK_Expedientes] PRIMARY KEY ([ExpedienteId]),
    CONSTRAINT [FK_Expedientes_Alumnos_AlumnoId] FOREIGN KEY ([AlumnoId]) 
        REFERENCES [dbo].[Alumnos] ([AlumnoId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Expedientes_Materias_MateriaId] FOREIGN KEY ([MateriaId]) 
        REFERENCES [dbo].[Materias] ([MateriaId]) ON DELETE CASCADE
);

-- =============================================
-- Índices
-- =============================================
CREATE INDEX [IX_Expedientes_AlumnoId] ON [dbo].[Expedientes] ([AlumnoId]);
CREATE INDEX [IX_Expedientes_MateriaId] ON [dbo].[Expedientes] ([MateriaId]);

-- =============================================
-- Datos de Ejemplo (Opcional)
-- =============================================

-- Insertar Alumnos de Ejemplo
INSERT INTO [dbo].[Alumnos] ([Nombre], [Apellido], [FechaNacimiento], [Grado])
VALUES 
    ('Juan', 'Pérez', '2010-05-15', '8vo Grado'),
    ('María', 'García', '2011-08-22', '7mo Grado'),
    ('Carlos', 'Rodríguez', '2010-03-10', '8vo Grado'),
    ('Ana', 'Martínez', '2011-11-05', '7mo Grado'),
    ('Luis', 'González', '2010-07-18', '8vo Grado');

-- Insertar Materias de Ejemplo
INSERT INTO [dbo].[Materias] ([NombreMateria], [Docente])
VALUES 
    ('Matemáticas', 'Prof. Roberto Sánchez'),
    ('Español', 'Prof. Laura Fernández'),
    ('Ciencias Naturales', 'Prof. Miguel Torres'),
    ('Estudios Sociales', 'Prof. Carmen Díaz'),
    ('Inglés', 'Prof. Patricia Vega');

-- Insertar Expedientes de Ejemplo
INSERT INTO [dbo].[Expedientes] ([AlumnoId], [MateriaId], [NotaFinal], [Observaciones])
VALUES 
    -- Juan Pérez
    (1, 1, 95.50, 'Excelente desempeño en álgebra'),
    (1, 2, 88.00, 'Buen nivel de comprensión lectora'),
    (1, 3, 92.00, 'Participa activamente en experimentos'),
    
    -- María García
    (2, 1, 78.50, 'Necesita practicar más las operaciones'),
    (2, 2, 95.00, 'Excelente redacción y ortografía'),
    (2, 4, 85.00, 'Buena participación en clase'),
    
    -- Carlos Rodríguez
    (3, 1, 82.00, 'Muestra interés en geometría'),
    (3, 3, 90.00, 'Muy bueno en prácticas de laboratorio'),
    (3, 5, 87.50, 'Buena pronunciación en inglés'),
    
    -- Ana Martínez
    (4, 2, 92.00, 'Creatividad en composiciones literarias'),
    (4, 4, 89.00, 'Conocimientos sólidos de historia'),
    (4, 5, 94.50, 'Excelente nivel de conversación'),
    
    -- Luis González
    (5, 1, 75.00, 'Debe mejorar en resolución de problemas'),
    (5, 3, 81.00, 'Buen entendimiento de conceptos'),
    (5, 4, 86.50, 'Interés en geografía');

-- =============================================
-- Consultas Útiles
-- =============================================

-- Ver todos los alumnos
SELECT * FROM [dbo].[Alumnos];

-- Ver todas las materias
SELECT * FROM [dbo].[Materias];

-- Ver expedientes con nombres de alumnos y materias
SELECT 
    e.ExpedienteId,
    a.Nombre + ' ' + a.Apellido AS Alumno,
    m.NombreMateria AS Materia,
    e.NotaFinal,
    e.Observaciones
FROM [dbo].[Expedientes] e
INNER JOIN [dbo].[Alumnos] a ON e.AlumnoId = a.AlumnoId
INNER JOIN [dbo].[Materias] m ON e.MateriaId = m.MateriaId;

-- Calcular promedio de notas por alumno
SELECT 
    a.AlumnoId,
    a.Nombre + ' ' + a.Apellido AS NombreCompleto,
    a.Grado,
    COUNT(e.ExpedienteId) AS CantidadMaterias,
    AVG(e.NotaFinal) AS Promedio
FROM [dbo].[Alumnos] a
LEFT JOIN [dbo].[Expedientes] e ON a.AlumnoId = e.AlumnoId
GROUP BY a.AlumnoId, a.Nombre, a.Apellido, a.Grado
ORDER BY Promedio DESC;

-- Ver expedientes de un alumno específico
SELECT 
    m.NombreMateria,
    m.Docente,
    e.NotaFinal,
    e.Observaciones
FROM [dbo].[Expedientes] e
INNER JOIN [dbo].[Materias] m ON e.MateriaId = m.MateriaId
WHERE e.AlumnoId = 1; -- Cambiar el ID según necesidad

-- =============================================
-- Fin del Script
-- =============================================
