<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Repositorio de Canciones</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="contenedor-tarjeta">
        <h1>Repositorio de Música</h1>
        
        <table class="tabla-musica">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Artista</th>
                    <th>Género</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="cancion" items="${listaCanciones}">
				    <tr>
				        <td><c:out value="${cancion.id}"/></td>
				        <td><c:out value="${cancion.titulo}"/></td>
						<td>
						    <c:choose>
						        <c:when test="${not empty cancion.artista}">
						            <c:out value="${cancion.artista.nombre} ${cancion.artista.apellido}"/>
						        </c:when>
						        <c:otherwise>
						            <span>Sin artista asignado</span>
						        </c:otherwise>
						    </c:choose>
						</td>
				        <td><c:out value="${cancion.genero}"/></td>
				        <td>
				            <a href="/canciones/detalle/${cancion.id}" class="btn btn-detalle">Ver Detalle</a>
				        </td>
				    </tr>
				</c:forEach>
            </tbody>
        </table>
        
        <div style="text-align: right;">
            <a href="/canciones/formulario/agregar/0" class="btn btn-agregar">Añadir Canción</a>
			<a href="/artistas" class="btn btn-volver">Ir a Artistas</a>
        </div>
    </div>
</body>
</html>