/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ADMIN
 */
public class Validation {
 
    public static boolean validStr(String password, String regex){
        for(int i=0; i<password.length(); i++){
            if(password.matches(regex)){
                return true;
            }
        }
        return false;
    }
    
    public static boolean readPattern(String password) {      
        String pattern = ".*[!@#$%&*()_+=|<>?{}\\[\\]~-].*";
        if (password.matches(pattern)) {
            return true;
        }
        return false;
    }
    
    public static boolean numberPattern(String password){
        if(password.matches(".*\\d.*")){
            return true;
        }
        return false;
    }

    public static boolean checkUpperCase(String password) {
        for (int i = 0; i < password.length(); i++) {
            if (Character.isUpperCase(password.charAt(i))) {
                return true;
            }
        }
        return false;
    }
}
