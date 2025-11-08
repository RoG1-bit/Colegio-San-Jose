 Sistema de Gestión Académica - Colegio San José

Sistema web desarrollado en **ASP.NET Core MVC** con **Entity Framework Core** para la gestión de expedientes académicos del Colegio San José.

Descripción

El sistema permite mantener un registro digital de los alumnos, las materias ofrecidas por la institución y los expedientes académicos que asocian a cada estudiante con sus materias cursadas, incluyendo calificaciones y observaciones.

Características Principales

- **Gestión de Alumnos**: CRUD completo (Crear, Leer, Actualizar, Eliminar)
- **Gestión de Materias**: Registro de materias y docentes asignados
- **Gestión de Expedientes**: Relación entre alumnos y materias con calificaciones
- **Vista de Promedios**: Cálculo automático del promedio de notas por alumno
- **Gráficas Estadísticas**: Visualización de promedios con Chart.js
- **Interfaz Intuitiva**: Diseño responsivo con Bootstrap 5

## Tecnologías Utilizadas

- **Framework**: ASP.NET Core 8.0 MVC
- **ORM**: Entity Framework Core 9.0
- **Base de Datos**: SQL Server (LocalDB)
- **Frontend**: Bootstrap 5, Chart.js
- **Lenguaje**: C# 12.0

## ?? Paquetes NuGet

```xml
<PackageReference Include="Microsoft.EntityFrameworkCore" Version="9.0.10" />
<PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="9.0.10" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="9.0.10" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version="9.0.10" />
<PackageReference Include="Microsoft.VisualStudio.Web.CodeGeneration.Design" Version="9.0.0" />
```

## Estructura de la Base de Datos

### Tabla: Alumnos
- **AlumnoId** (PK, int, Identity)
- Nombre (nvarchar)
- Apellido (nvarchar)
- FechaNacimiento (datetime2)
- Grado (nvarchar)

### Tabla: Materias
- **MateriaId** (PK, int, Identity)
- NombreMateria (nvarchar)
- Docente (nvarchar)

### Tabla: Expedientes
- **ExpedienteId** (PK, int, Identity)
- AlumnoId (FK ? Alumnos)
- MateriaId (FK ? Materias)
- NotaFinal (decimal(5,2))
- Observaciones (nvarchar)

## ?? Instalación y Configuración

### Requisitos Previos
- .NET 8.0 SDK o superior
- SQL Server o SQL Server Express
- Visual Studio 2022 o Visual Studio Code

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/RoG1-bit/Colegio-San-Jose.git
cd Colegio-San-Jose
```

2. **Restaurar paquetes NuGet**
```bash
dotnet restore
```

3. **Configurar la cadena de conexión**

Editar `appsettings.json` si es necesario:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=ColegioSanJoseDB;Trusted_Connection=True;MultipleActiveResultSets=true"
  }
}
```

4. **Aplicar migraciones a la base de datos**
```bash
cd "Colegio San Jose"
dotnet ef database update
```

5. **Ejecutar la aplicación**
```bash
dotnet run
```

6. **Abrir en el navegador**
```
https://localhost:5001
```

## Funcionalidades del Sistema

### 1. Gestión de Alumnos
- Lista de todos los alumnos registrados
- Formulario para agregar nuevos alumnos
- Edición de datos de alumnos existentes
- Eliminación de registros de alumnos
- Visualización de detalles completos

### 2. Gestión de Materias
- Lista de materias disponibles
- Registro de nuevas materias con docente asignado
- Actualización de información de materias
- Eliminación de materias

### 3. Gestión de Expedientes
- Vista completa mostrando:
  - Nombre completo del alumno y grado
  - Nombre de la materia y docente
  - Nota final con código de colores
  - Observaciones del docente
- Formulario para crear expedientes (selección de alumno y materia)
- Edición de notas y observaciones
- Eliminación de expedientes

### 4. Vista de Promedios
- Tabla con promedio de notas por alumno
- Ordenamiento por mejor promedio
- Indicadores de estado académico (Excelente, Muy Bueno, Bueno, etc.)
- Gráfica de barras con Chart.js mostrando los promedios visualmente

## Gráficas Estadísticas

El sistema incluye gráficas generadas con **Chart.js** que muestran:
- Promedio de notas por alumno (gráfico de barras)
- Código de colores para identificar rendimiento académico
- Visualización responsiva adaptable a diferentes dispositivos

## Relaciones del Modelo

El sistema implementa una relación **muchos a muchos** entre Alumnos y Materias a través de la tabla Expedientes:

```
Alumno (1) ----< (N) Expediente (N) >---- (1) Materia
```

## Validaciones Implementadas

- Campos obligatorios en todos los formularios
- Validación de rango para notas (0-100)
- Validación de fechas
- Mensajes de error personalizados en español
- Protección contra ataques de sobreposteo (overposting)
- Tokens antifalsificación en formularios

## Autor

**Roger Ramírez**
- GitHub: [@RoG1-bit](https://github.com/RoG1-bit)

## Licencia

Este proyecto fue desarrollado como parte de una práctica académica.

## Agradecimientos

- Colegio San José
- Profesores del curso de desarrollo web
- Comunidad de ASP.NET Core

---

 Si este proyecto te fue útil, considera darle una estrella en GitHub!
