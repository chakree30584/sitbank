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
       
        /*
        boolean x = new User().register("daechatorn", "namjai",
                "139/40", "วุฒากาศ", 
                "บางค้อ", "จอมทอง", 
                "10150", "กรุงเทพมหานคร", 
                "ไทย", "1101500716771", 
                "0811163994", "028756701", 
                "daechatorn.man@gmail.com");
        System.out.println(x);
        */
        
        //System.out.println(new User().checkIdenUser("771"));
        
        //System.out.println("Regis: "+new User().regisEBank("Man", "12345", "1101500716771"));
        
        //System.out.println("Update: "+new User().resetPassword("Man", "1234"));
        /*System.out.println(new User().addUser("Aon", "Duan", 
                "Male", "1102399471003", "aonit18@gmail.com", 
                "0811111111", "022221432", "123/45",
                "Phutthabucha", "Bangkoknoi", "Bangmod", 
                "Bangkok", "Thailand", "10110"));
        */
        System.out.println(new User().findByUserId(1).get(0).getMyAccount().getType());
    }
}
