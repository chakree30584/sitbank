/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.bank.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import sit.bank.model.Account;
import sit.bank.model.User;

/**
 *
 * @author chakree30584
 */
public class SearchAjaxServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        String searchValue = request.getParameter("searchValue");
        String type = request.getParameter("type");
        JSONObject json = new JSONObject();
        if (type.equals("name")) {
            List<User> ac = User.findByName(searchValue);
            if (ac.size()==0) {
                json.put("result", 0);
            } else {
                json.put("result", 1);
                json.put("acc", ac);
            }
        }else if(type.equals("id")){
            List<User> ac = User.findByAccIdGetUser(Long.parseLong(searchValue));
            if (ac == null) {
                json.put("result", 0);
            } else {
                json.put("result", 1);
                json.put("acc", ac);
            }
        }else if(type.equals("getacc")){
            List<Account> ac = Account.findAccountOfUid(Long.parseLong(searchValue));
            if (ac.size()==0) {
                json.put("result", 0);
            } else {
                json.put("result", 1);
                json.put("acc", ac);
            }
        }else if(type.equals("getcurrentacc")){
            Account ac = Account.findByAccountId(Long.parseLong(searchValue));
            if (ac == null) {
                json.put("result", 0);
            } else {
                List<Account> acc = new ArrayList();
                acc.add(ac);
                json.put("result", 1);
                json.put("acc", acc);
            }
        }else if(type.equals("getcurrentuser")){
            User u = User.findByUserId(Long.parseLong(searchValue));
            if (u == null) {
                json.put("result", 0);
            } else {
                List<User> uu = new ArrayList();
                uu.add(u);
                json.put("result", 1);
                json.put("acc", uu);
            }
        }
        try (PrintWriter out = response.getWriter()) {
            out.print(json);
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
