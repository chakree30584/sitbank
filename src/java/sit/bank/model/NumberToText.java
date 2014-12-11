/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.bank.model;
import java.util.InputMismatchException;
/**
 *
 * @author peacepeace
 */
public class NumberToText {

    
    public static void main(String[] args) {
        String number[] = {"","หนึ่ง","สอง","สาม","สี่","ห้า","หก","เจ็ด","แปด","เก้า"};
        String c[] = {"","สิบ","ร้อย","พัน","หมื่น","แสน","ล้าน","สิบ","ร้อย","พัน","หมื่น","แสน","ล้าน"};
        String result = "";
        int x = 0;
        boolean check = true;
        try{
            x = new java.util.Scanner(System.in).nextInt();
        }catch(InputMismatchException im){
            System.out.println("Insert Number Limit (Same X)");
            check = false;
        }
        if(check){
            String num = x+"";
            int leng = num.length();
            for(int i=0;i<num.length();i++,leng--){
                if(num.length() > 1){
                    if((i == num.length()-1) && (num.charAt(i)-'0' == 1)){
                        result += "เอ็ด";
                    }else if(((i == num.length()-2) && (num.charAt(i)-'0' == 2)) || ((leng == 8) && (num.charAt(i)-'0' == 2)) ){
                        result += "ยี่";
                    }else if((i == num.length()-2 && num.charAt(i)-'0' == 1) || (((leng == 8) || (leng == 7)) && (num.charAt(i)-'0' == 1)) ){

                    }
                    else if(num.charAt(i)-'0' != 1 || num.charAt(i)-'0' != 2){
                        result += number[num.charAt(i)-'0'];
                    }
                    if(num.charAt(i)-'0' != 0){
                        result += c[leng-1];
                    }
                }else{
                    result = (num.charAt(i)-'0' == 0 ? "ศูนย์" : number[num.charAt(i)-'0']);
                }
            }
            System.out.println(result);
        }
    }
}
