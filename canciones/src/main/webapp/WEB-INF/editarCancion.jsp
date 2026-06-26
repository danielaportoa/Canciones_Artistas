<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Canción</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="contenedor-tarjeta">
        <h1>Editar Canción</h1>
        
        <form:form action="/canciones/procesa/editar/${cancion.id}" method="PUT" modelAttribute="cancion">
            
            <div class="form-group">
                <label>Título del tema:</label>
                <form:input path="titulo" />
                <form:errors path="titulo" cssClass="error-msg" />
            </div>
            
            <div class="form-group">
                <label>Artista / Banda:</label>
                <form:input path="artista" />
                <form:errors path="artista" cssClass="error-msg" />
            </div>
            
            <div class="form-group">
                <label>Álbum:</label>
                <form:input path="album" />
                <form:errors path="album" cssClass="error-msg" />
            </div>
            
            <div class="form-group">
                <label>Género Musical:</label>
                <form:input path="genero" />
                <form:errors path="genero" cssClass="error-msg" />
            </div>
            
            <div class="form-group">
                <label>Idioma original:</label>
                <form:input path="idioma" />
                <form:errors path="idioma" cssClass="error-msg" />
            </div>
            
            <div style="display: flex; gap: 10px;">
                <button type="submit" class="btn btn-agregar">Actualizar Canción</button>
                <a href="/canciones" class="btn btn-volver" style="margin-top:0;">Volver a lista de canciones</a>
            </div>
        </form:form>
    </div>
</body>
</html>