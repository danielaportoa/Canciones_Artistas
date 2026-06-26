package com.cl.servicios;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cl.modelos.Cancion;
import com.cl.repositorios.RepositorioCanciones;

@Service
public class ServicioCanciones {

    @Autowired
    private RepositorioCanciones repositorio;

    // Todas las canciones
    public List<Cancion> obtenerTodasLasCanciones() {
        return repositorio.findAll();
    }
    
    // Método agregar
    public Cancion agregarCancion(Cancion cancion) {
        return repositorio.save(cancion);
    }
    
    // Método actualizar
    public Cancion actualizaCancion(Cancion cancion) {
        return repositorio.save(cancion);
    }

    // Método eliminar
    public void eliminaCancion(Long id) {
        repositorio.deleteById(id);
    }
    
    // Canción por ID 
    public Cancion obtenerCancionPorId(Long id) {
        Optional<Cancion> opcionalCancion = repositorio.findById(id);
        if(opcionalCancion.isPresent()) {
            return opcionalCancion.get();
        } else {
            return null;
        }
    }
}