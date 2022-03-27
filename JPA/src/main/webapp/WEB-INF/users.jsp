<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body class="form-group d-flex justify-content-around align p-5" style="background-color: #031235">
        <div class="px-5 py-3 rounded-3 align-items-center justify-content-center text-center" style="background-color: #5a93ffbd">
            <h1 class="text-white mb-4">Add user</h1>
            <form action="user" method="POST"  class="d-flex flex-column align-items-center">
                <input type="hidden" name="action" value="add">
                <div>
                    <input class="mt-1  rounded border-0" type="email" name="email" id="email" placeholder="Email">
                </div>
                <div>
                    <input class="mt-1 rounded border-0" type="text" name="firstName" id="firstName" placeholder="First name">
                </div>
                <div>
                    <input class="mt-1 rounded border-0" type="text" name="lastName" id="lastName" placeholder="Last name">
                </div>
                <div>
                    <input class="mt-1 rounded border-0" type="password" name="password" id="password" placeholder="Password">
                </div>
                
                <select class="mt-1 rounded-3 border-0 px-3 py-1" name="role" id="role">
                    <option>Choose your role</option>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.roleName}">${role.roleName}</option>
                    </c:forEach>
                </select>

                <button class="mt-4 rounded-pill px-4 py-1" type="submit">Add user</button>
                
            </form>
        </div>
        
        <div class="px-5 py-3 rounded-3 align-items-center justify-content-center" style="background-color: #5a93ffbd">
            
            <h1 class=" text-center text-white mb-4">User management system</h1>
            <form action="user" method="POST">
                <table class="table border-0 text-white">
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
                                <td  class="border-0">${user.email}</td>
                                <td class="border-0">${user.firstName}</td>
                                <td class="border-0">${user.lastName}</td>
                                <td class="border-0">${user.role.roleName}</td>
                                <td class="border-0">${user.active ? "Y": "N"}</td>
                                <td class="border-0">
                                    <button class="bi bi-pencil-square px-2 pb-2 rounded-3" type="submit" name="action" value="edit?${user.email}"></button>
                                </td>
                                <td class="border-0">
                                    <button class="bi bi-eraser-fill px-2 pb-2 rounded-3" style="color: #ff6044" type="submit" name="action" value="delete?${user.email}"></button>
                                </td>
                            </tr>    
                        </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
        
        <div class="px-5 py-3 rounded-3 align-items-center justify-content-center text-center" style="background-color: #5a93ffbd">
            <h1 class="text-white mb-4">Edit user</h1>
            <form action="user" method="POST" class="d-flex flex-column align-items-center">
                <input type="hidden" name="action" value="edit">
                <div>
                    <input class="mt-1  rounded border-0" type="email" name="email" id="email" readonly value="${user.email}">
                </div>
                <div>
                    <input class="mt-1  rounded border-0" type="text" name="firstName" id="firstName" value="${user.firstName}">
                </div>
                <div>
                    <input class="mt-1  rounded border-0" type="text" name="lastName" id="lastName" value="${user.lastName}">
                </div>
                <div>
                    <input class="mt-1  rounded border-0" type="password" name="password" id="password" value="${user.password}">
                </div>
                
                <select class="mt-1 rounded-3 border-0 px-3 py-1" name="role" id="role">
                    <option>Choose your role</option>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.roleName}">${role.roleName}</option>
                    </c:forEach>
                </select>
                
                <button class="mt-4 w-auto px-5 rounded-pill" type="submit">Save</button>

                <button class="mt-1 w-auto px-5 rounded-pill" type="submit">Cancel</button>
                
            </form>
        </div>
    </body>
</html>
