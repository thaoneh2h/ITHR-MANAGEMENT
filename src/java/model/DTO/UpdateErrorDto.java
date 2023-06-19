 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

/**
 *
 * @author ADMIN
 */
public class UpdateErrorDto {
    private String passwordError;
    private String specialCharError;
    private String isNotMatch;
    private String passIsExisted;
    private String firstCharPasswordError;
    private String passwordLenError;
    private String newPasswordEmpty;
    

    public UpdateErrorDto() {
    }

    public UpdateErrorDto(String passwordError,String specialCharError, String isNotMatch, String passIsExisted, String firstCharPasswordError, String passwordLenError, String newPasswordEmpty) {
        this.passwordError = passwordError;
        this.specialCharError = specialCharError;
        this.isNotMatch = isNotMatch;
        this.passIsExisted = passIsExisted;
        this.firstCharPasswordError = firstCharPasswordError;
        this.passwordLenError = passwordLenError;
        this.newPasswordEmpty = newPasswordEmpty;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getSpecialCharError() {
        return specialCharError;
    }

    public void setSpecialCharError(String specialCharError) {
        this.specialCharError = specialCharError;
    }

    public String getIsNotMatch() {
        return isNotMatch;
    }

    public void setIsNotMatch(String isNotMatch) {
        this.isNotMatch = isNotMatch;
    }

    public String getPassIsExisted() {
        return passIsExisted;
    }

    public void setPassIsExisted(String passIsExisted) {
        this.passIsExisted = passIsExisted;
    }

    public String getFirstCharPasswordError() {
        return firstCharPasswordError;
    }

    public void setFirstCharPasswordError(String firstCharPasswordError) {
        this.firstCharPasswordError = firstCharPasswordError;
    }

    public String getPasswordLenError() {
        return passwordLenError;
    }

    public void setPasswordLenError(String passwordLenError) {
        this.passwordLenError = passwordLenError;
    }

    public String getNewPasswordEmpty() {
        return newPasswordEmpty;
    }

    public void setNewPasswordEmpty(String newPasswordEmpty) {
        this.newPasswordEmpty = newPasswordEmpty;
    }
       
    
}
