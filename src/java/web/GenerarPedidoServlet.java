/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import db.Bebida;
import db.Cliente;
import db.Pedido;
import db.Plato;
import ejb.BebidaFacade;
import ejb.PlatoFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lucas
 */
@WebServlet(name = "GenerarPedidoServlet", urlPatterns = {"/generarPedido"})
public class GenerarPedidoServlet extends HttpServlet {

    @EJB
    private PlatoFacade pf;
    @EJB
    private BebidaFacade bf;
    
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
        if(request.getSession(false).getAttribute("usuario") == null) {
            response.sendRedirect("/index");
            return;
        }
        
        request.setAttribute("platos", pf.findAll());
        request.setAttribute("bebidas", bf.findAll());
        request.getRequestDispatcher("generarPedido.jsp").forward(request, response);
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
        for(String nombre: Collections.list(request.getParameterNames())){
            if(request.getParameter(nombre).isEmpty()) {
                forwardError("No puede haber campos vacios!", request, response);
                return;
            }
        }
        
        String plato = request.getParameter("plato");
        String bebida = request.getParameter("bebida");
        Boolean domicilio = request.getParameter("domicilio") != null;
        Plato platoEntidad = pf.find(Integer.parseInt(plato));
        Bebida bebidaEntidad = bf.find(Integer.parseInt(bebida));
        
        Pedido pedido = new Pedido();
        pedido.setBebida(bebidaEntidad);
        pedido.setPlato(platoEntidad);
        pedido.setDespacho(domicilio);
        pedido.setFechaHora(new Date());
        pedido.setCliente((Cliente)request.getSession(false).getAttribute("usuario"));
        pedido.setTotal(platoEntidad.getPrecioPlato() + bebidaEntidad.getPrecioBebida());
        
        request.getSession(false).setAttribute("compra", pedido);
        request.getRequestDispatcher("confirmarPedido.jsp").forward(request, response);
    }
    
    private void forwardError(String mensaje, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("color", "red");
        request.getRequestDispatcher("generarPedido.jsp").forward(request, response);
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
