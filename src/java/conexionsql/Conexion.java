

package conexionsql;

import java.sql.Connection;
import java.sql.DriverManager;


public class Conexion {
Connection con;
String  url="jdbc:mysql://localhost:3306/milamocarrito";
String user="root";
String pass="";


public Connection getConnection(){
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection(url,user,pass);
    } catch (Exception e) {
        System.out.println(""+e);
    }
    return con;
}
}
