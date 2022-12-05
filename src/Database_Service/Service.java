
package Database_Service;

//import com.milon.GetTableData;
import DB_CONNECTION.DBConnection;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Service {
    
    private Statement stm;
    
    public Service(){
        try {
            DBConnection dbc = new DBConnection();
            stm = dbc.getStatement();
        } catch (Exception ex) {
            Logger.getLogger(Service.class.getName()).log(Level.SEVERE, null, ex);
            //System.out.println("error!");
        }
    }
    
    public String execute(String sql){
        
        String mgs = "";
        try {
            stm.execute(sql);
            mgs = "Query has Successfully";
        } catch (SQLException ex) {
             mgs = "Error : "+ex.getMessage();
            //.getLogger(Service.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println(mgs);
        }
        
        return mgs;
    }
    
    public String executeQuery(String sql){
        
        String result = "";
        
            try {
                ResultSet rs = stm.executeQuery(sql);
                ResultSetMetaData rsMetaData = rs.getMetaData();

                int cmc = rsMetaData.getColumnCount();
                int kid = 0;

                JSONObject jsonObject = new JSONObject();
                while (rs.next()) {
                    kid++;
                    JSONObject ob = new JSONObject();
                    for (int i = 1; i <= cmc; i++) {

                        ob.put("" + rsMetaData.getColumnName(i), rs.getString(rsMetaData.getColumnName(i)));
                    }

                    jsonObject.put("" + kid, ob);
                }

                result = jsonObject.toString();
                  //System.out.println("JOB : \n"+job);
              

            } catch (Exception ex) {
                result = "Error : "+ex.getMessage();
                //Logger.getLogger(GetTableData.class.getName()).log(Level.SEVERE, null, ex);
                
            }

            return  result;
    }
    
    
    
    
    
}
