package View;

import java.util.List;

/**
 * Created by Asus on 2/21/2020.
 */
public class DbWithTable {
    private String dbName;
    private List<String> tblList;

    public DbWithTable() {
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public List<String> getTblList() {
        return tblList;
    }

    public void setTblList(List<String> tblList) {
        this.tblList = tblList;
    }


}

