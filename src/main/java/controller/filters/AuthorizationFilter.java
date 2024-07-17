package controller.filters;

import controller.database.DatabaseController;

public class AuthorizationFilter {

    // This method determines the role of the user based on the username
    public static String determineUserRole(String username) {
        DatabaseController dbController = new DatabaseController();
        // You can modify this logic based on your requirements
        if ("pratik5004".equals(username)) {
            return "admin";
        } else {
            return "regular";
        }
    }
}
