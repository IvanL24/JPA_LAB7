package ca.sait.jpa.services;

import ca.sait.jpa.dataaccess.RoleDB;
import ca.sait.jpa.models.Role;
import java.util.List;

public class RoleService {
    private RoleDB roleDB = new RoleDB();
    
    public List<Role> getAll() throws Exception {
        List<Role> roles = this.roleDB.getAll();
        return roles;
    }

    public int getRoleId(String roleName) throws Exception {
        int id = this.roleDB.lookupRoleId(roleName);
        return id;
    }
}