import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Created by Asus on 12/26/2019.
 */
public class InsertImage {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/insertimage","root","");
            PreparedStatement ps=con.prepareStatement("INSERT  INTO imgtable VALUES (?,?)");
            ps.setString(1,"abdullah");

            FileInputStream fin=new FileInputStream("F:\\products\\laptop.jpg");
            ps.setBinaryStream(2,fin,fin.available());
            int i=ps.executeUpdate();
            System.out.println(i+ " records affected");


            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
