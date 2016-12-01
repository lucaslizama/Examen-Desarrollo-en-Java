/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import com.sun.net.httpserver.HttpServer;
import db.Cliente;
import ejb.ClienteFacade;
import ejb.ComunaFacade;
import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author lucas
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/registro"})
public class RegistroServlet extends HttpServlet {

    @EJB
    private ComunaFacade cf;
    @EJB
    private ClienteFacade clf;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession(false).getAttribute("usuario") != null) {
            response.sendRedirect("/index");
            return;
        }
        
        request.setAttribute("comunas", cf.findAll());
        request.getRequestDispatcher("registro.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession(false).getAttribute("usuario") != null) {
            response.sendRedirect("/index");
            return;
        }
        
        for(String nombre : Collections.list(request.getParameterNames())){
            if(request.getParameter(nombre).isEmpty()){
                forwardError("El campo " + nombre + " no puede estar vacio!", request, response);
                return;
            }
        }
        
        if(!validarTiposRutYDv(request.getParameter("rut"), request.getParameter("dv").charAt(0), request, response)){
            return;
        }
        
        if(!validarDigitoVerificador(request.getParameter("rut"), request.getParameter("dv").charAt(0), request, response)){
            return;
        }
        
        if(!validarTelefono(request.getParameter("telefono"))){
            forwardError("Telefono invalido", request, response);
            return;
        }
        
        if(!validarNumeracion(request.getParameter("numeracion"))){
            forwardError("La numeracion debe ser un numero", request, response);
            return;
        }
        
        if(!validarClaves(request.getParameter("clave"),request.getParameter("clave2"))){
            forwardError("Las claves no son identicas", request, response);
            return;
        }
        
        if(clf.existeUsuario(Integer.parseInt(request.getParameter("rut")))){
            forwardError("El usuario ya se encuentra registrado!", request, response);
            return;
        }
        
        Cliente cliente = crearCliente(request);
        
        try {
            clf.create(cliente);
        } catch (EJBException ex) {
            forwardError("Error al ingresar cliente, intente nuevamente", request, response);
            return;
        }
        
        request.getSession(true).setAttribute("usuario", clf.find(cliente.getId()));
        response.sendRedirect("/index");
    }
    
    private Cliente crearCliente(HttpServletRequest request) {
        Cliente cliente = new Cliente();
        cliente.setRut(Integer.parseInt(request.getParameter("rut")));
        cliente.setDv(request.getParameter("dv").charAt(0));
        cliente.setNombreCliente(request.getParameter("nombre"));
        cliente.setApellidoPaterno(request.getParameter("apellidoPaterno"));
        cliente.setApellidoMaterno(request.getParameter("apellidoMaterno"));
        cliente.setComuna(cf.find(Integer.parseInt(request.getParameter("comuna"))));
        cliente.setNumeracion(Integer.parseInt(request.getParameter("numeracion")));
        cliente.setClave(BCrypt.hashpw(request.getParameter("clave"), BCrypt.gensalt(12)));
        cliente.setDireccionCliente(request.getParameter("direccion"));
        cliente.setTelefono(request.getParameter("telefono"));
        return cliente;
    }
    
    private boolean validarClaves(String pass1, String pass2) {
        if(pass1.equals(pass2)){
            return true;
        }
        return false;
    }
    
    private boolean validarNumeracion(String numeracion) {
        try {
            Integer.parseInt(numeracion);
        } catch (NumberFormatException ex) {
            return false;
        }
        
        return true;
    }
    
    private boolean validarTelefono(String telefono){
        try {
            Integer.parseInt(telefono);
        } catch (NumberFormatException ex) {
            return false;
        }
        
        if(telefono.length() < 9){
            return false;
        }
        
        return true;
    }
    
    private boolean validarDigitoVerificador(String rut,Character dv,HttpServletRequest request,HttpServletResponse response) 
            throws ServletException, IOException{
        int factor = 2;
        Integer suma = 0;
        Integer modulo;
        Integer digitoVerificador;
        
        for (int i = rut.length() - 1; i >= 0; i--) {
            Character digito = rut.charAt(i);
            suma += Integer.parseInt(digito.toString()) * factor;
            factor = (factor + 1) > 7 ? 2 : (factor + 1); 
        }

        modulo = suma % 11;
        digitoVerificador = 11 - modulo; 
        
        Character aux = digitoVerificador == 10 ? 'k' : digitoVerificador.toString().charAt(0);
        
        if(!aux.equals(dv)){
            forwardError("El rut ingresado es invalido",request,response);
            return false;
        }
        
        return true;
    }
    
    private boolean validarTiposRutYDv(String rut,Character dv,HttpServletRequest request,HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            Integer.parseInt(rut);
        }catch(NumberFormatException ex) {
            forwardError("El rut solo debe contener numeros!",request,response);
            return false;
        }
        
        if(!Character.isDigit(dv) && Character.toLowerCase(dv) != 'k'){
            forwardError("El digito verificador debe ser un numero entre 1-9 o una 'k'!",request,response);
            return false;
        }
        
        return true;
    }
    
    public void forwardError(String mensaje, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("color", "red");
        request.getRequestDispatcher("registro.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
