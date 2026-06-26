package com.cl.controladores;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import com.cl.modelos.Cancion;
import com.cl.modelos.Artista;
import com.cl.servicios.ServicioCanciones;
import com.cl.servicios.ServicioArtistas;
import jakarta.validation.Valid; 

@Controller
public class ControladorCanciones {

    @Autowired
    private ServicioCanciones servicio;
    
    @Autowired
    private ServicioArtistas servicioArtistas;

    //Catálogo General
    @GetMapping("/canciones")
    public String desplegarCanciones(Model modelo) {
        List<Cancion> canciones = servicio.obtenerTodasLasCanciones();
        modelo.addAttribute("listaCanciones", canciones);
        return "canciones";
    }

    //Detalle
    @GetMapping("/canciones/detalle/{idCancion}")
    public String desplegarDetalleCancion(@PathVariable("idCancion") Long idCancion, Model modelo) {
        Cancion cancion = servicio.obtenerCancionPorId(idCancion);
        modelo.addAttribute("cancion", cancion);
        return "detalleCancion";
    }

    //Formulario de Inserción
    @GetMapping(value = {"/canciones/formulario/agregar", "/canciones/formulario/agregar/{idCancion}"})
    public String formularioAgregarCancion(@PathVariable(value = "idCancion", required = false) Long idCancion, @ModelAttribute("cancion") Cancion cancion, Model modelo) {
        modelo.addAttribute("listaArtistas", servicioArtistas.obtenerTodosLosArtistas()); 
        return "agregarCancion";
    }

    // Procesar Inserción
    @PostMapping("/canciones/procesa/agregar")
    public String procesarAgregarCancion(@Valid @ModelAttribute("cancion") Cancion cancion, BindingResult result, Model modelo) {
        if (result.hasErrors()) {
            modelo.addAttribute("listaArtistas", servicioArtistas.obtenerTodosLosArtistas());
            return "agregarCancion"; 
        }
        
        if(cancion.getArtista() != null && cancion.getArtista().getId() != null) {
            Artista artistaVinculado = servicioArtistas.obtenerArtistaPorId(cancion.getArtista().getId());
            cancion.setArtista(artistaVinculado);
        }
        
        servicio.agregarCancion(cancion);
        return "redirect:/canciones"; 
    }

    //Formulario de Edición
    @GetMapping("/canciones/formulario/editar/{idCancion}")
    public String formularioEditarCancion(@PathVariable("idCancion") Long idCancion, Model modelo) {
        Cancion cancionActual = servicio.obtenerCancionPorId(idCancion);
        modelo.addAttribute("cancion", cancionActual); 
        return "editarCancion";
    }

    // Procesar Edición
    @PutMapping("/canciones/procesa/editar/{idCancion}")
    public String procesarEditarCancion(
            @Valid @ModelAttribute("cancion") Cancion cancion, 
            BindingResult result, 
            @PathVariable("idCancion") Long idCancion) {
            
        if (result.hasErrors()) {
            return "editarCancion";
        }
        
        cancion.setId(idCancion); 
        servicio.actualizaCancion(cancion);
        return "redirect:/canciones";
    }

    // Procesar Eliminación
    @DeleteMapping("/canciones/eliminar/{idCancion}")
    public String procesarEliminarCancion(@PathVariable("idCancion") Long idCancion) {
        servicio.eliminaCancion(idCancion);
        return "redirect:/canciones";
    }
}