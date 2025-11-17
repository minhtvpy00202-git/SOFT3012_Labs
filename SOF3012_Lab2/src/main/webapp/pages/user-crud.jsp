<%@ page pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>User CRUD</title>
        <style>
         body {
                font-family: Arial, sans-serif;
                background: #f2f5f7;
                display: flex;
                justify-content: center;
                padding-top: 20px;
            }

           .container {
                   background: white;
                   padding: 20px 30px;
                   width: 650px;
                   border-radius: 10px;
                   box-shadow: 0 4px 12px rgba(0,0,0,0.1);
               }

                h2 {
                       text-align: center;
                       margin-bottom: 15px;
                       color: #333;
                   }

                    i {
                           display: block;
                           text-align: center;
                           margin-bottom: 10px;
                           font-style: normal;
                           color: #007bff;
                       }
                 form label {
                        display: inline-block;
                        width: 120px;
                        font-weight: bold;
                        margin: 6px 0;
                    }

               form input[type="text"],
                   form input[type="password"] {
                       width: 300px;
                       padding: 6px;
                       margin: 6px 0;
                       border: 1px solid #ccc;
                       border-radius: 5px;
                   }


          form input[type="radio"] {
                  margin-left: 10px;
              }


          button {
                  padding: 8px 15px;
                  margin-right: 8px;
                  border: none;
                  background: #007bff;
                  color: white;
                  border-radius: 5px;
                  cursor: pointer;
                  transition: 0.2s;
              }


          button:hover {
                 background: #0056b3;
             }


hr {
        margin: 15px 0;
    }

            table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 10px;
                    font-size: 14px;
                }

                th, td {
                    border: 1px solid #ccc;
                    padding: 8px;
                    text-align: left;
                }

                th {
                    background: #007bff;
                    color: white;
                }

                tr:nth-child(even) {
                    background: #f8f9fa;
                }

                td a {
                    color: #007bff;
                    text-decoration: none;
                    font-weight: bold;
                }

                td a:hover {
                    text-decoration: underline;
                }
          .crud-button{
            text-align: center;
          }
        </style>
    </head>

    <body>
    <div class="containner">
        <i>${message}</i>
        <c:url var="url" value="/user/crud" />
        <form method="post">
            <label>User Id: </label>
            <input name="id" value="${user.id}" placeholder="Nhập Id"><br>
            <label>Password: </label>
            <input name="password" type="password" value="${user.password}" placeholder="Nhập mật khẩu"><br>
            <label>Fullname: </label>
            <input name="fullname" value="${user.fullname}" placeholder="Nhập Họ và tên"><br>
            <label>Email: </label>
            <input name="email" value="${user.email}" placeholder="user@example.com"><br>
            <label>Vai trò: </label>
            <input name="admin" type="radio" value="true" ${user.admin?'checked':''}>
            Admin
            <input name="admin" type="radio" value="false" ${!user.admin?'':'checked'}>
            User
            <hr>
            <div class="crud-button">
            <button formaction="${url}/create">Create</button>
            <button formaction="${url}/update">Update</button>
            <button formaction="${url}/delete">Delete</button>
            <button formaction="${url}/reset">Reset</button>
            </div>
        </form>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Password</th>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.password}</td>
                        <td>${u.fullname}</td>
                        <td>${u.email}</td>
                        <td>${u.admin?'Admin':'User'}</td>
                        <td><a href="${url}/edit/${u.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
    </body>
</html>