/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctl.servlets;

import com.ctl.dao.UserDao;
import com.ctl.entities.Message;
import com.ctl.entities.User;
import com.ctl.helper.ConnectionProvider;
import com.ctl.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //fetch all data
            String userName = request.getParameter("user_name");
            String userEmai = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("user_image");
            String imageName = part.getSubmittedFileName();

            //get the user from session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setName(userName);
            user.setEmail(userEmai);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            String oldFile=user.getProfile();
            user.setProfile(imageName);

            //update database
            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            boolean updateUser = dao.updateUser(user);
            if (updateUser) {

                String path = request.getRealPath("/") + "profile" + File.separator + user.getProfile();
                String oldFilepath = request.getRealPath("/") + "profile" + File.separator + oldFile;
               if(!oldFile.equals("default.png")){
                    Helper.deletFile(oldFilepath);
               }
                if (Helper.saveFile( part.getInputStream(), path))
                        {

                    Message msg = new Message("Details updated successfully", "success", "alert-success");

                    s.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Some things went wrong...try again", "error", "alert-danger");

                    s.setAttribute("msg", msg);

                }

            } else {
                Message msg = new Message("Some things went wrong...try again", "error", "alert-danger");

                s.setAttribute("msg", msg);

            }

            response.sendRedirect("Profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
