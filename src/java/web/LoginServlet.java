/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import db.Cliente;
import ejb.ClienteFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import javax.ejb.EJB;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        for(String nombre : Collections.list(request.getParameterNames())){
            if(request.getParameter(nombre).isEmpty()) {
                forwardError("Todos los campos deben llenarse!", request, response);
                return;
            }
        }
        
        if(!clf.existeUsuario(Integer.parseInt(request.getParameter("rut")))){
            forwardError("Este rut no se encuentra registrado", request, response);
            return;
        }
        
        if(!validarTiposRutYDv(request.getParameter("rut"), request.getParameter("dv").charAt(0), request, response)){
            return;
        }
        
        if(!validarDigitoVerificador(request.getParameter("rut"), request.getParameter("dv").charAt(0), request, response)){
            return;
        }
        
        Cliente cliente = clf.findByRut(Integer.parseInt(request.getParameter("rut")));
        
        if(!BCrypt.checkpw(request.getParameter("clave"), cliente.getClave())){
            forwardError("Usuario o clave incorrectas", request, response);
            return;
        }
        
        request.getSession(true).setAttribute("usuario", cliente);
        response.sendRedirect("/index");
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
    
    private void forwardError(String mensaje, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("color", "red");
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
