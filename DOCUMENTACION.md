# ?? Documentación del Sistema de Gestión Académica
## Colegio San José

---

## ?? Índice
1. [Introducción](#introducción)
2. [Tecnologías Utilizadas](#tecnologías-utilizadas)
3. [Funcionalidades Principales](#funcionalidades-principales)
4. [Capturas de Pantalla](#capturas-de-pantalla)
5. [Instrucciones de Uso](#instrucciones-de-uso)
6. [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)
7. [Gráficas Estadísticas](#gráficas-estadísticas)
8. [Repositorio GitHub](#repositorio-github)

---

## ?? Introducción

El **Sistema de Gestión Académica del Colegio San José** es una aplicación web desarrollada con ASP.NET Core MVC que permite la administración completa de los expedientes académicos de los estudiantes.

### Objetivos del Sistema
- Mantener un registro digital de alumnos
- Gestionar las materias ofrecidas por la institución
- Asociar alumnos con materias mediante expedientes académicos
- Calcular y visualizar promedios de notas por alumno
- Generar reportes y estadísticas académicas

---

## ??? Tecnologías Utilizadas

### Backend
- **ASP.NET Core 8.0 MVC**: Framework para el desarrollo de aplicaciones web
- **Entity Framework Core 9.0**: ORM para el acceso a datos
- **C# 12.0**: Lenguaje de programación

### Frontend
- **Bootstrap 5**: Framework CSS para diseño responsivo
- **Chart.js**: Biblioteca JavaScript para gráficas
- **Razor Views**: Motor de plantillas de ASP.NET

### Base de Datos
- **SQL Server LocalDB**: Sistema de gestión de base de datos relacional

---

## ? Funcionalidades Principales

### 1. Gestión de Alumnos (CRUD Completo)
- ? **Crear**: Registro de nuevos alumnos con nombre, apellido, fecha de nacimiento y grado
- ? **Leer**: Listado de todos los alumnos registrados
- ? **Actualizar**: Edición de información de alumnos existentes
- ? **Eliminar**: Eliminación de registros de alumnos

**Validaciones Implementadas:**
- Nombre y apellido obligatorios
- Fecha de nacimiento obligatoria
- Grado obligatorio

### 2. Gestión de Materias (CRUD Completo)
- ? **Crear**: Registro de nuevas materias con nombre y docente asignado
- ? **Leer**: Listado de todas las materias disponibles
- ? **Actualizar**: Edición de información de materias
- ? **Eliminar**: Eliminación de materias

**Validaciones Implementadas:**
- Nombre de materia obligatorio
- Nombre del docente obligatorio

### 3. Gestión de Expedientes (CRUD Completo)
- ? **Crear**: Asociar alumno con materia, registrar nota y observaciones
- ? **Leer**: Visualización de todos los expedientes con:
  - Nombre completo del alumno
  - Nombre de la materia
  - Nota final con indicador visual de color
  - Observaciones del docente
- ? **Actualizar**: Modificación de notas y observaciones
- ? **Eliminar**: Eliminación de expedientes

**Validaciones Implementadas:**
- Alumno y materia obligatorios (selección desde listas desplegables)
- Nota final obligatoria con rango entre 0 y 100
- Indicadores visuales:
  - ?? Verde (90-100): Excelente
  - ?? Azul (80-89): Muy Bueno
  - ?? Amarillo (70-79): Bueno
  - ? Gris (60-69): Regular
  - ?? Rojo (<60): Necesita Mejorar

### 4. Vista de Promedios
- ? **Cálculo Automático**: Promedio de notas por cada alumno
- ? **Ordenamiento**: Alumnos ordenados por mejor promedio
- ? **Información Completa**:
  - Posición en el ranking
  - Nombre completo del alumno
  - Grado cursado
  - Cantidad de materias
  - Promedio general
  - Estado académico (badge de color)
- ? **Gráfica Interactiva**: Visualización de promedios con Chart.js

---

## ?? Capturas de Pantalla

### Menú Principal de Navegación
El sistema cuenta con un menú de navegación intuitivo que incluye:
- ????? Alumnos
- ?? Materias
- ?? Expedientes
- ?? Promedios

### Lista de Alumnos
Vista que muestra todos los alumnos registrados con opciones para:
- Crear nuevo alumno
- Ver detalles
- Editar información
- Eliminar registro

### Formulario de Creación de Alumno
Formulario con los siguientes campos:
- Nombre (obligatorio)
- Apellido (obligatorio)
- Fecha de Nacimiento (obligatorio)
- Grado (obligatorio)

### Lista de Materias
Vista con todas las materias disponibles mostrando:
- Nombre de la materia
- Docente asignado
- Acciones disponibles (Editar, Detalles, Eliminar)

### Lista de Expedientes
Vista completa mostrando:
- Columna "Alumno" con nombre completo y grado
- Columna "Materia" con nombre de materia y docente
- Columna "Nota Final" con badge de color según rendimiento
- Columna "Observaciones" con comentarios del docente
- Columna "Acciones" con botones de Editar, Detalles y Eliminar

### Formulario de Creación de Expediente
Formulario con:
- Lista desplegable de alumnos (muestra nombre completo)
- Lista desplegable de materias (muestra nombre de materia)
- Campo numérico para nota final (0-100)
- Campo de texto para observaciones

### Vista de Promedios
Tabla ordenada con:
- Ranking de alumnos
- Nombre completo
- Grado
- Cantidad de materias cursadas
- Promedio general (con 2 decimales)
- Estado académico (Excelente, Muy Bueno, Bueno, Regular, Necesita Mejorar)

Gráfica de barras mostrando:
- Nombre de cada alumno en el eje X
- Promedio de notas en el eje Y (0-100)
- Barras de diferentes colores para cada alumno

---

## ?? Instrucciones de Uso

### Flujo de Trabajo Recomendado

#### 1. Registrar Alumnos
1. Hacer clic en el menú "????? Alumnos"
2. Hacer clic en el botón "Create New"
3. Llenar el formulario con los datos del alumno
4. Hacer clic en "Create" para guardar

#### 2. Registrar Materias
1. Hacer clic en el menú "?? Materias"
2. Hacer clic en el botón "Create New"
3. Ingresar nombre de la materia y docente asignado
4. Hacer clic en "Create" para guardar

#### 3. Crear Expedientes Académicos
1. Hacer clic en el menú "?? Expedientes"
2. Hacer clic en el botón "? Crear Nuevo Expediente"
3. Seleccionar un alumno de la lista desplegable
4. Seleccionar una materia de la lista desplegable
5. Ingresar la nota final (0-100)
6. Agregar observaciones si es necesario
7. Hacer clic en "Create" para guardar

#### 4. Consultar Promedios
1. Hacer clic en el menú "?? Promedios"
2. Ver la tabla con el ranking de alumnos
3. Analizar la gráfica de barras
4. Identificar alumnos que necesitan apoyo académico

#### 5. Editar o Eliminar Registros
- En cualquier lista (Alumnos, Materias, Expedientes):
  - Hacer clic en "Edit" para modificar
  - Hacer clic en "Details" para ver información completa
  - Hacer clic en "Delete" para eliminar (se pedirá confirmación)

---

## ??? Estructura de la Base de Datos

### Diagrama de Entidad-Relación

```
???????????????????
?     ALUMNO      ?
???????????????????
? AlumnoId (PK)   ????
? Nombre          ?  ?
? Apellido        ?  ?
? FechaNacimiento ?  ?
? Grado           ?  ?
???????????????????  ?
                     ?
                     ? 1:N
                     ?
                ???????????????????
                ?   EXPEDIENTE    ?
                ???????????????????
                ? ExpedienteId(PK)?
                ? AlumnoId (FK)   ?
                ? MateriaId (FK)  ?
                ? NotaFinal       ?
                ? Observaciones   ?
                ???????????????????
                     ?
                     ? N:1
                     ?
???????????????????  ?
?    MATERIA      ????
???????????????????
? MateriaId (PK)  ?
? NombreMateria   ?
? Docente         ?
???????????????????
```

### Descripción de Tablas

#### Tabla: Alumnos
| Campo | Tipo | Descripción |
|-------|------|-------------|
| AlumnoId | int (PK, Identity) | Identificador único |
| Nombre | nvarchar(max) | Nombre del alumno |
| Apellido | nvarchar(max) | Apellido del alumno |
| FechaNacimiento | datetime2 | Fecha de nacimiento |
| Grado | nvarchar(max) | Grado que cursa |

#### Tabla: Materias
| Campo | Tipo | Descripción |
|-------|------|-------------|
| MateriaId | int (PK, Identity) | Identificador único |
| NombreMateria | nvarchar(max) | Nombre de la materia |
| Docente | nvarchar(max) | Docente asignado |

#### Tabla: Expedientes
| Campo | Tipo | Descripción |
|-------|------|-------------|
| ExpedienteId | int (PK, Identity) | Identificador único |
| AlumnoId | int (FK) | Referencia a Alumno |
| MateriaId | int (FK) | Referencia a Materia |
| NotaFinal | decimal(5,2) | Nota final (0-100) |
| Observaciones | nvarchar(max) | Comentarios del docente |

### Relaciones
- Un **Alumno** puede tener **muchos Expedientes** (1:N)
- Una **Materia** puede estar en **muchos Expedientes** (1:N)
- Un **Expediente** pertenece a **un Alumno** y **una Materia** (N:1)

---

## ?? Gráficas Estadísticas

### Gráfica de Promedios por Alumno
La aplicación incluye una gráfica interactiva desarrollada con **Chart.js** que muestra:

**Características:**
- **Tipo**: Gráfico de barras vertical
- **Eje X**: Nombre completo de cada alumno
- **Eje Y**: Promedio de notas (escala 0-100)
- **Colores**: Diferentes tonalidades para cada alumno
- **Responsivo**: Se adapta al tamaño de la pantalla

**Interpretación:**
- Barras más altas = Mejor promedio
- Permite identificar rápidamente el rendimiento de cada alumno
- Facilita la comparación visual entre estudiantes

**Datos Mostrados:**
- Promedio calculado automáticamente desde los expedientes
- Solo se muestran alumnos con al menos un expediente registrado
- Valores con dos decimales de precisión

---

## ?? Repositorio GitHub

**URL del Repositorio:** [https://github.com/RoG1-bit/Colegio-San-Jose](https://github.com/RoG1-bit/Colegio-San-Jose)

### Contenido del Repositorio
- ? Código fuente completo del proyecto
- ? Migraciones de Entity Framework
- ? Archivo README.md con instrucciones
- ? .gitignore configurado para .NET
- ? Estructura de carpetas organizada

### Clonar el Repositorio
```bash
git clone https://github.com/RoG1-bit/Colegio-San-Jose.git
cd Colegio-San-Jose
```

### Instrucciones de Instalación
Ver el archivo README.md en el repositorio para instrucciones completas de:
- Instalación de dependencias
- Configuración de la base de datos
- Ejecución de migraciones
- Inicio de la aplicación

---

## ????? Información del Desarrollador

**Nombre:** Roger Ramírez  
**GitHub:** [@RoG1-bit](https://github.com/RoG1-bit)  
**Proyecto:** Sistema de Gestión Académica - Colegio San José  
**Tecnología:** ASP.NET Core 8.0 MVC  
**Fecha:** Enero 2025

---

## ?? Conclusiones

El Sistema de Gestión Académica del Colegio San José cumple con todos los requerimientos solicitados:

? **CRUD Completo** para Alumnos, Materias y Expedientes  
? **Vista de Expedientes** mostrando nombre completo del alumno y materia  
? **Vista de Promedios** con cálculo automático por alumno  
? **Gráficas Estadísticas** con Chart.js para visualización de datos  
? **Validaciones** en todos los formularios  
? **Diseño Responsivo** con Bootstrap 5  
? **Código en GitHub** con documentación completa  

El sistema está listo para ser utilizado por el Colegio San José para gestionar eficientemente los expedientes académicos de sus estudiantes.

---

**© 2025 - Colegio San José - Sistema de Gestión Académica**
