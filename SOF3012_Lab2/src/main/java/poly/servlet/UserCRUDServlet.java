package poly.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import poly.entity.User;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@WebServlet({
        "/",
        "/user/crud/index",
        "/user/crud/edit/*",
        "/user/crud/create",
        "/user/crud/update",
        "/user/crud/delete",
        "/user/crud/reset"
})
public class UserCRUDServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User form = new User();
        try {
            BeanUtils.populate(form, req.getParameterMap());

        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        String message = "Enter user information";
        String path = req.getServletPath();
        if(path.contains("edit")) {
            String id = req.getPathInfo().substring(1);
            message = "Edit: " +id;
        } else if (path.contains("create")) {
            message = "Create: " + form.getId();
            form = new User();
        } else if (path.contains("update")) {
            message = "Update: " +form.getId();
        } else if (path.contains("delete")) {
            message = "Delete " +form.getId();
            form = new User();
        }  else if (path.contains("reset")) {
            form = new User();
        }

        List<User> list = List.of(new User(), new User(), new User());

        req.setAttribute("message", message);
        req.setAttribute("user", form);
        req.setAttribute("users", list);
        req.getRequestDispatcher("/pages/user-crud.jsp");
    }
}
