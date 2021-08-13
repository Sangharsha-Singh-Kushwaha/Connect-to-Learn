
package com.ctl.dao;
import java.sql.*;

public class LikeDao {
    
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean doLike(int pid, int uid){
        boolean f=false;
        try {
            String query="inset into like (pid,uid) values(?,?)";
            PreparedStatement psmt=con.prepareStatement(query);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
              
            e.printStackTrace();
            
        }
        return f;
    }
    
}
