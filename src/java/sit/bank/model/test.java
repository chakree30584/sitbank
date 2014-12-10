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
        User a = new User();
        boolean x = a.register("daechatorn", 
                "139/40", "วุฒากาศ", 
                "บางค้อ", "จอมทอง", 
                "10150", "กรุงเทพมหานคร", 
                "ไทย", "1101500716771", 
                "0811163994", "028756701", 
                "daechatorn.man@gmail.com", "000000000000001");
        System.out.println(x);
    }
}
