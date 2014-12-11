/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sit.bank.model;


/**
 *
 * @author Man
 */
public class test {
    public static void main(String[] args) {
       
        
       
        
        
        //System.out.println(new User().checkIdenUser("771"));
        
        //System.out.println("Regis: "+new User().regisEBank("Man", "12345", "1101500716771"));
        
        //System.out.println("Update: "+new User().resetPassword("Man", "1234"));
        System.out.println(new User().addUser("Aon2", "Duan2", 
                "Male", "1102399471003", "aonit18@gmail.com", 
                "0811111111", "022221432", "123/45",
                "Phutthabucha", "Bangkoknoi", "Bangmod", 
                "Bangkok", "Thailand", "10110","Test Account","ออมทรัพย์",100.25));
        
        //System.out.println(new User().findByUserId(1).get(0).getMyAccount().getType());
        //System.out.println("Account: "+new Account().findMyAccount("T"));
        //System.out.println("Register E: "+new UserEBank().addUserE("ManE", "121212", 100));
        //System.out.println("Reset Pass: "+new UserEBank().resetPassword(1, "12345", "12345"));
        //System.out.println(new Account().numToText(20200000));
    }
}
