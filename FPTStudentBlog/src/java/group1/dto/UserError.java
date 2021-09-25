/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dto;

/**
 *
 * @author Admin
 */
public class UserError {
    private String userIDError;
    private String nameError;
    private String passwordError;
    private String confirmError;
    private String messageError;

    
    public UserError() {
        this.userIDError="";
        this.nameError="";
        this.passwordError="";
        this.confirmError="";  
        this.messageError="";
    }
    public UserError(String userIDError, String nameError, String passwordError, String confirmError, String messageError) {
        this.userIDError = userIDError;
        this.nameError = nameError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.messageError = messageError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }

    @Override
    public String toString() {
        return "UserError{" + "userIDError=" + userIDError + ", nameError=" + nameError + ", passwordError=" + passwordError + ", confirmError=" + confirmError + ", messageError=" + messageError + '}';
    }
}
