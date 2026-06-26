<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Artista</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="contenedor-tarjeta">
        <h1>Agregar Artista</h1>
        <form:form action="/artistas/procesa/agregar" method="POST" modelAttribute="artista">
            <div class="form-group">
                <label>Nombre:</label>
                <form:input path="nombre" />
            </div>
            <div class="form-group">
                <label>Apellido:</label>
                <form:input path="apellido" />
            </div>
            <div class="form-group">
                <label>Biografía:</label>
                <form:textarea path="biografia"/>
            </div>
            <div class="contenedor-acciones">
                <button type="submit" class="btn btn-agregar">Guardar Artista</button>
                <a href="/artistas" class="btn btn-volver">Volver</a>
            </div>
        </form:form>
    </div>
</body>
</html>