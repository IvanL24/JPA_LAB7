package ca.sait.jdbc.servlets;

import ca.sait.jdbc.models.Role;
import ca.sait.jdbc.models.User;
import ca.sait.jdbc.services.RoleService;
import ca.sait.jdbc.services.UserService;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ivanl
 */
public class UserServlet extends HttpServlet {
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
        String action = request.getParameter("action");
        String query = request.getQueryString();

        
        try {
        
            UserService userservice = new UserService();
            RoleService roleservice = new RoleService(); 

            List<User> users = userservice.getAll();
            request.setAttribute("users", users);
            
            List<Role> roles = roleservice.getAll();
            request.setAttribute("roles", roles);
            
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        
        String action = request.getParameter("action");
        
        if(action != null && action.equals("add")){
            try {
                
                String email = request.getParameter("email");
                boolean active = request.getParameter("active") != null;
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String password = request.getParameter("password");
                String roleName = request.getParameter("role");
                int roleId = 0;
                
                RoleService rs = new RoleService();
                List<Role> rolelist;
                rolelist = rs.getAll();
                
                for(Role role : rolelist){
                    if(role.getRoleName().equals(roleName)){
                        roleId = role.getRoleId();
                    }
                }
                
                if(roleId == 0){
                    throw new Exception("Invalid role");
                }
                
                Role role = new Role(roleId, roleName);
                UserService us = new UserService();
                us.insert(email, active, firstName, lastName, password, role);
                request.setAttribute("message", "user has been updated");
                
            }catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "user was not updated");
            }
        } else if(action != null && action.contains("edit?")){
            try{
                String email = action.split("\\?", 2)[1];
                UserService us = new UserService();
                User user = us.get(email);
                request.setAttribute("user", user);
                
            }catch(Exception ex){
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if(action != null && action.equals("edit")){
            try {
                
                String email = request.getParameter("email");
                boolean active = request.getParameter("active") != null;
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String password = request.getParameter("password");
                String roleName = request.getParameter("role");
                int roleId = 0;
                
                RoleService rs = new RoleService();
                List<Role> rolelist;
                rolelist = rs.getAll();
                
                for(Role role : rolelist){
                    if(role.getRoleName().equals(roleName)){
                        roleId = role.getRoleId();
                    }
                }
                
                if(roleId == 0){
                    throw new Exception("Invalid role");
                }
                
                Role role = new Role(roleId, roleName);
                UserService us = new UserService();
                us.update(email, active, firstName, lastName, password, role);
                request.setAttribute("message", "user has been updated");
                
            }catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "user was not updated");
            }
        }  else if(action != null && action.contains("delete?")){
            try{
                String email = action.split("\\?", 2)[1];
                UserService us = new UserService();
                us.delete(email);
                request.setAttribute("message", "user has been deleted");
                
            }catch(Exception ex){
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        try{
            UserService us = new UserService();
            List<User> users = us.getAll();
            RoleService rs = new RoleService();
            List<Role> roles = rs.getAll();
            
            request.setAttribute("users", users);
            request.setAttribute("roles", roles);
        } catch (Exception ex){
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);       
    }
}
