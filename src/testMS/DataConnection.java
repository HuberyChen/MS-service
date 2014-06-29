package testMS;
import java.sql.*;

public class DataConnection {
//    private static final String DRIVER="sun.jdbc.odbc.JdbcOdbcDriver";
    private static final String DRIVER="com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://127.0.0.1:3306/tikums";
    private static final String user = "root";
    private static final String password = "31";
//    private static final String CONN="jdbc:odbc:mysql;database=tikums";
    private Connection conn;
//    private Connection conn = DriverManager.getConnection(url, user, password);
    private Statement stmt;
    private ResultSet rs;
    private boolean loaded=false;
    /** Creates a new instance of DataConnection */
    public DataConnection() throws ClassNotFoundException, SQLException {
         init();
    }
    public void init() throws ClassNotFoundException, SQLException {
    	  Class.forName(DRIVER);
          conn=DriverManager.getConnection(url, user, password);
          stmt=conn.createStatement();
          loaded=true;
    }
    public boolean excute(String sql) throws SQLException
    {
        return stmt.execute(sql);
    }
    public void excuteQuery(String sql) throws SQLException
    {
         rs=stmt.executeQuery(sql);
    }
    public Connection getConn() throws Exception {
    	 
        return conn;
    }

    public Statement getStmt() {
        return stmt;
    }

    public boolean isLoaded() {
        return loaded;
    }

    public ResultSet getRs() {
        return rs;
    }
    public static void main(String[] args) throws Exception {
	 System.out.println(new DataConnection().getConn());
	}
}
