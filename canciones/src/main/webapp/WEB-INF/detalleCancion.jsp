<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Canción</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="contenedor-tarjeta">
        <c:choose>
            <c:when test="${not empty cancion}">
                <h1><c:out value="${cancion.titulo}"/></h1>
				<p><strong>Artista:</strong> 
				    <c:choose>
				        <c:when test="${not empty cancion.artista}">
				            <c:out value="${cancion.artista.nombre} ${cancion.artista.apellido}"/>
				        </c:when>
				        <c:otherwise>
				            <span>No especificado</span>
				        </c:otherwise>
				    </c:choose>
				</p>
                <p><strong>Álbum:</strong> <c:out value="${cancion.album}"/></p>
                <p><strong>Género:</strong> <c:out value="${cancion.genero}"/></p>
                <p><strong>Idioma:</strong> <c:out value="${cancion.idioma}"/></p>
              
				<p class="info-fecha">
					<strong>Registrado el:</strong> 
					<fmt:formatDate value="${cancion.createdAt}" pattern="dd/MM/yyyy HH:mm" />
				</p>

            </c:when>
            <c:otherwise>
                <div class="alerta-error">
                    <h3>Canción no encontrada</h3>
                    <p>El identificador ingresado no coincide con ningún registro activo.</p>
                </div>
            </c:otherwise>
        </c:choose>
        
		<div class="contenedor-acciones">
		            <a href="/canciones/formulario/editar/${cancion.id}" class="btn btn-editar">Editar Canción</a>
		            
		            <form:form action="/canciones/eliminar/${cancion.id}" method="DELETE">
		                <button type="submit" class="btn btn-eliminar">Eliminar Canción</button>
		            </form:form>
		            
		            <a href="/canciones" class="btn btn-volver">Volver a la lista de canciones</a>
		        </div>
	
	
</body>
</html>