package testMS;

public class LoginInfo {
    private boolean logined=false;
    private int userID=0;
    private String userName;
    private String userType;
    /** Creates a new instance of LoginInfo */
    public void login(int userID,String userName,String userType)
    {
        logined=true;
        this.userID=userID;
        this.userName=userName;
        this.userType=userType;
    }
    public void logout()
    {
        logined=false;
        this.userID=0;
        this.userName="";
        this.userType="";
    }
    public LoginInfo() {
    }

    public boolean isLogined() {
        return logined;
    }

    public int getUserID() {
        return userID;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserType() {
        return userType;
    }
}
