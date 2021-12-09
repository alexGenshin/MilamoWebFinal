

package modelo;

public class Contacto {
    private int id;
    private String Nombre;
    private String Apellido;
    private String email;
    private String mensaje;
    
    public Contacto(){
        
    }
    public Contacto(int id, String Nombre,String Apellido, String email, String mensaje) {
        this.id = id;
        this.Nombre = Nombre;
        this.Apellido= Apellido;
        this.email = email;
        this.mensaje = mensaje;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    public String getApellido(){
        return Apellido;
    }
    public void setApellido(String Apellido){
        this.Apellido= Apellido;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
}
