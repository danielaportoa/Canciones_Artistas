<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Canción</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="contenedor-tarjeta">
        <h1>Agregar Canción</h1>
        
        <form:form action="/canciones/procesa/agregar" method="POST" modelAttribute="cancion">
            <div class="form-group">
                <label>Título del tema:</label>
                <form:input path="titulo" placeholder="Escribe Aquí" />
                <form:errors path="titulo" cssClass="error-msg" />
            </div>
            
			<div class="form-group">
			                <label>Seleccionar Artista / Banda:</label>
			                <form:select path="artista.id" class="btn" style="background: white; border: 1px solid #cbd5e1; width: 100%; text-align: left; color: #333;">
			                    <form:option value="" label="-- Seleccione un artista --" />
			                    <form:options items="${listaArtistas}" itemValue="id" itemLabel="nombre" />
			                </form:select>
			                <form:errors path="artista" cssClass="error-msg" />
			            </div>
            
            <div class="form-group">
                <label>Álbum:</label>
                <form:input path="album" placeholder="Escribe Aquí" />
                <form:errors path="album" cssClass="error-msg" />
            </div>
            
            <div class="form-group">
                <label>Género Musical:</label>
                <form:input path="genero" placeholder="Escribe Aquí" />
                <form:errors path="genero" cssClass="error-msg" />
            </div>
            
            <div class="form-group">
                <label>Idioma original:</label>
                <form:input path="idioma" placeholder="Escribe Aquí" />
                <form:errors path="idioma" cssClass="error-msg" />
            </div>
            
            <div style="display: flex; gap: 10px;">
                <button type="submit" class="btn btn-agregar" style="border: none; cursor: pointer; margin-top:0;">Guardar Canción</button>
                <a href="/canciones" class="btn btn-volver" style="margin-top:0;">Volver a lista de canciones</a>
            </div>
        </form:form>
    </div>
</body>
</html>