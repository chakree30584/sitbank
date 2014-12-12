/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sit.bank.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sit.bank.model.User;

/**
 *
 * @author Man
 */
public class ManageUser extends HttpServlet {

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
        String act = request.getParameter("act");
        if(act!=null){    
            String fullName = new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
            String lastName = new String(request.getParameter("lastname").getBytes("ISO-8859-1"), "UTF-8");
            String sex = request.getParameter("sex");
            String identification = request.getParameter("identification");
            String email = request.getParameter("email");
            String homePhone = request.getParameter("homephone");
            String mobilePhone = request.getParameter("mobilephone");
            String address = request.getParameter("address");
            String road = new String(request.getParameter("road").getBytes("ISO-8859-1"), "UTF-8");
            String subDistrict = new String(request.getParameter("subDistrict").getBytes("ISO-8859-1"), "UTF-8");
            String district = new String(request.getParameter("district").getBytes("ISO-8859-1"), "UTF-8");
            String country = new String(request.getParameter("country").getBytes("ISO-8859-1"), "UTF-8");
            String province = new String(request.getParameter("province").getBytes("ISO-8859-1"), "UTF-8");
            String zip = request.getParameter("zip");

            String accountName = new String(request.getParameter("accountName").getBytes("ISO-8859-1"), "UTF-8");
            String typeAccount = new String(request.getParameter("typeAccount").getBytes("ISO-8859-1"), "UTF-8");
            double money = Double.parseDouble(request.getParameter("money"));

            if(act.equals("Register")){
                boolean result = new User().addUser(fullName, lastName, sex, 
                        identification, email, mobilePhone, homePhone, address,
                        road, subDistrict, district, country, province, zip, 
                        accountName, typeAccount, money);
                if(result){
                    request.setAttribute("acknowledge", "Open Account Finished");
                    getServletContext().getRequestDispatcher("/userlist.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("acknowledge", "Cann't Open Account");
                    getServletContext().getRequestDispatcher("/registerpage.jsp").forward(request, response);
                }
            }
            else if(act.equals("Edit")){

            }
        }
        else{
            //response.sendRedirect("/registerpage.jsp");
            getServletContext().getRequestDispatcher("/registerpage.jsp").forward(request, response);
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
