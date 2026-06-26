<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle de Artista</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="contenedor-tarjeta">
        <h1>Ficha del Artista</h1>
        <p><strong>Nombre:</strong> <c:out value="${artista.nombre}"/></p>
        <p><strong>Apellido:</strong> <c:out value="${artista.apellido}"/></p>
        <p><strong>Biografía:</strong> <c:out value="${artista.biografia}"/></p>
        
        <h3>Canciones Compuestas:</h3>
        <ul>
            <c:forEach var="cancion" items="${artista.canciones}">
                <li><c:out value="${cancion.titulo}"/> (<c:out value="${cancion.album}"/>)</li>
            </c:forEach>
            <c:if test="${empty artista.canciones}">
                <li>Este artista aún no tiene canciones registradas.</li>
            </c:if>
        </ul>
        
        <div class="contenedor-acciones">
            <a href="/artistas" class="btn btn-volver">Volver a lista de artistas</a>
        </div>
    </div>
</body>
</html>