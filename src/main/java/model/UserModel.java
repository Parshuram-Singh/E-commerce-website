package model;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * A class representing a user model.
 * This class stores information about a user, including full name, username, birthday,
 * email, phone number, gender, and password.
 * 
 * coded by: pratik singh rathour
 */
public class UserModel implements Serializable{
    /**
	 * Serial version UID for serialization.
	 */
	private static final long serialVersionUID = 1L;
	
	// Fields to store user information
    private String fullName;
    private String userName;
    private LocalDate birthday;
    private String email;
    private String phoneNumber;
    private String gender;
    private String newPassword;
    
    /**
     * Default constructor.
     */
    public UserModel() {
		// Empty constructor
	}

    /**
     * Parameterized constructor to initialize a user with provided information.
     * 
     * @param fullName      The full name of the user.
     * @param userName      The username of the user.
     * @param birthday      The birthday of the user.
     * @param email         The email of the user.
     * @param phoneNumber   The phone number of the user.
     * @param gender        The gender of the user.
     * @param newPassword   The new password of the user.
     */
    public UserModel(String fullName, String userName, LocalDate birthday,
                     String email, String phoneNumber, String gender, String newPassword) {
        this.fullName = fullName;
        this.userName = userName;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.newPassword = newPassword;
    }

    // Getter and setter methods for user fields

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
