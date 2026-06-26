<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Artistas</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="contenedor">
        <h1>Lista de Artistas</h1>
        <table class="tabla-musica">
            <thead>
                <tr>
                    <th>Artista</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="artista" items="${listaArtistas}">
                    <tr>
                        <td>
                            <a href="/artistas/detalle/${artista.id}"><c:out value="${artista.nombre}"/> <c:out value="${artista.apellido}"/></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="contenedor-acciones">
            <a href="/artistas/formulario/agregar/0" class="btn btn-agregar">Agregar Artista</a>
            <a href="/canciones" class="btn btn-volver">Ir a canciones</a>
        </div>
    </div>
</body>
</html>