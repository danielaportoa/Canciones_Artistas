# Sistema de Gestión de Canciones y Artistas - Spring Boot 

Este proyecto consiste en una aplicación web completa desarrollada en **Java** utilizando el framework **Spring Boot** 
y el patrón de diseño arquitectónico **MVC (Modelo-Vista-Controlador)**.
La aplicación permite gestionar un catálogo relacional de canciones y sus respectivos artistas musicales, 
conectándose a una base de datos MySQL e implementando operaciones CRUD completas junto con validaciones estrictas en el servidor.

---

## Características y Objetivos 

* **CRUD Completo:** Flujo de trabajo completo para la creación, lectura, actualización y eliminación de registros.
* **Relación Uno a Muchos (`@OneToMany` / `@ManyToOne`):** Vinculación física y dinámica en la base de datos entre la entidad `Artista` y la entidad `Cancion`.
* **Validaciones del Lado del Servidor:** Integración con `jakarta.validation.constraints` para asegurar la longitud mínima y consistencia de los datos antes de persistirlos.
* **Procesamiento de Métodos Ocultos:** Configuración del filtro interno de Spring para soportar de manera segura las peticiones simuladas en formularios JSP (`_method="PUT"` y `_method="DELETE"`).
* **Vistas Dinámicas y Seguras:** Uso de **JSP (JavaServer Pages)** y **JSTL** para el renderizado de datos de objetos complejos, blindado con condicionales `<c:choose>` para mitigar errores del tipo `NullPointerException`.
* **Diseño Centralizado (CSS Homogéneo):** Interfaz limpia de estilos incrustados (*inline CSS*), gobernada en su totalidad por un archivo estático unificado (`estilos.css`).

---

## 🛠️ Tecnologías y Herramientas Utilizadas

* **Lenguaje:** Java 17 
* **Framework Principal:** Spring Boot (Spring MVC, Spring Data JPA)
* **Motor de Validación:** Hibernate Validator (`spring-boot-starter-validation`)
* **Motor de Plantillas:** JSP (JavaServer Pages) + JSTL (Jakarta Standard Tag Library)
* **Base de Datos:** MySQL 8.0+
* **Gestor de Dependencias:** Maven
* **IDE de Desarrollo:** Spring Tool Suite (STS) o Eclipse

---

## Estructura del Proyecto (Arquitectura Multicapa)

```text
canciones/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/cl/
│   │   │       ├── CancionesApplication.java  # Clase principal de arranque
│   │   │       ├── controladores/             # Controladores que manejan las rutas HTTP
│   │   │       │   ├── ControladorCanciones.java
│   │   │       │   └── ControladorArtistas.java
│   │   │       ├── modelos/                   # Entidades JPA y reglas de validación
│   │   │       │   ├── Cancion.java
│   │   │       │   └── Artista.java
│   │   │       ├── repositorios/              # Interfaces de datos (CrudRepository)
│   │   │       │   ├── RepositorioCanciones.java
│   │   │       │   └── RepositorioArtistas.java
│   │   │       └── servicios/                 # Capa de lógica de negocio
│   │   │           ├── ServicioCanciones.java
│   │   │           └── ServicioArtistas.java
│   │   ├── resources/
│   │   │   ├── static/
│   │   │   │   └── estilos.css               # Hoja de estilos única y centralizada
│   │   │   └── application.properties        # Configuración de base de datos y filtros
│   │   └── webapp/
│   │       └── WEB-INF/                      # Directorio seguro de vistas JSP
│   │           ├── canciones.jsp             # Catálogo principal con vista de tabla
│   │           ├── detalleCancion.jsp        # Ficha de detalle de canción con botones PUT/DELETE
│   │           ├── agregarCancion.jsp        # Formulario de inserción con renderizado de errores
│   │           ├── editarCancion.jsp         # Formulario de edición con datos precargados
│   │           ├── artistas.jsp              # Listado de artistas registrados
│   │           ├── detalleArtista.jsp        # Perfil del artista con sus canciones compuestas
│   │           └── agregarArtista.jsp        # Formulario para registrar un nuevo artista
└── pom.xml                                   # Declaración de dependencias de Maven
