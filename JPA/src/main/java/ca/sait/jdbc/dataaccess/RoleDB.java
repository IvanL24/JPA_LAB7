package ca.sait.jdbc.dataaccess;

import ca.sait.jdbc.models.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleDB {

    public List<Role> getAll() throws Exception {
        List<Role> roles = new ArrayList<>();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM role";
        
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
//          rs = con.createStatement().executeQuery(sql);
            
            while (rs.next()) {
                int roleId = rs.getInt(1);
                String roleName = rs.getString(2);
                
                Role role  = new Role(roleId, roleName);
                
                roles.add(role);
                
            }
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }

        return roles;
    }

    public int lookupRoleId(String roleName) throws SQLException {
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = -1;
        String sql = "SELECT role_id FROM role WHERE role_name = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, roleName);
            rs = ps.executeQuery();                      
            
            if(rs.next()){
             id = rs.getInt(1);
            }
            
        } finally {
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }

        return id;
    
    }
}
