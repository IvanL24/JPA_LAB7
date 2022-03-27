<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body class="d-flex justify-content-around">
        <div>
            <h1>Add user</h1>
            <form action="user" method="POST"  class="d-flex flex-column align-items-center">
                <input type="hidden" name="action" value="add">
                <div >
                    <input class="m-1" type="email" name="email" id="email" placeholder="Email">
                </div>
                <div>
                    <input type="text" name="firstName" id="firstName" placeholder="First name">
                </div>
                <div>
                    <input type="text" name="lastName" id="lastName" placeholder="Last name">
                </div>
                <div>
                    <input type="password" name="password" id="password" placeholder="Password">
                </div>
                <div >
                    <select name="role" id="role">
                        <option>Choose your role</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.roleName}">${role.roleName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div >
                    <button type="submit">Add user</button>
                </div>
                
            </form>
        </div>
        
        <div>
            
            <h1>User management system</h1>
            <form action="user" method="POST">
                <table class="table">
                    <thead>
                        <tr>
                            <th>E-mail</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Role</th>
                            <th>Active</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.email}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.role.roleName}</td>
                                <td>${user.active ? "Y": "N"}</td>
                                <td>
                                    <button type="submit" name="action" value="edit?${user.email}">Edit</button>
                                </td>
                                <td>
                                    <button type="submit" name="action" value="delete?${user.email}">Delete</button>
                                </td>
                            </tr>    
                        </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
        
        <div >
            <h1>Edit user</h1>
            <form action="user" method="POST">
                <input type="hidden" name="action" value="edit">
                <div>
                    <input type="email" name="email" id="email" readonly value="${user.email}">
                </div>
                <div>
                    <input type="text" name="firstName" id="firstName" value="${user.firstName}">
                </div>
                <div>
                    <input type="text" name="lastName" id="lastName" value="${user.lastName}">
                </div>
                <div>
                    <input type="password" name="password" id="password" value="${user.password}">
                </div>
                <div >
                    <select name="role" id="role">
                        <option>Choose your role</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.roleName}">${role.roleName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div >
                    <button type="submit">Save</button>
                </div>
                <div >
                    <button type="submit">Cancel</button>
                </div>
            </form>
                <p>${message}</p>
        </div>
        
    </body>
</html>
