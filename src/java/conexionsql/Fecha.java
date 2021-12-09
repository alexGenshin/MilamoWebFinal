
package conexionsql;
import java.util.Calendar;
import java.text.SimpleDateFormat;
public class Fecha {
    public static Calendar calendario=Calendar.getInstance();
    private static String fecha;
    public Fecha(){
    }
    
    public static String Fecha(){
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yyyy");
        fecha=sf.format(calendario.getTime());
        return fecha;
    }
    public static String FechaBD(){
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
        fecha=sf.format(calendario.getTime());
        return fecha;
    }
}
