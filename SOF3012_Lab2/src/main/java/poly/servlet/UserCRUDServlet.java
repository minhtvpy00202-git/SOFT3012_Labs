package poly.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import poly.DAO.Impl.UserDAOImpl;
import poly.DAO.UserDAO;
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
        UserDAO dao = new UserDAOImpl();
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
            form = dao.findById(id);
        } else if (path.contains("create")) {
            dao.create(form);
            message = "Create: " + form.getId();
            form = new User();
        } else if (path.contains("update")) {
            dao.update(form);
            message = "Update: " +form.getId();
        } else if (path.contains("delete")) {
            dao.deleteById(form.getId());
            message = "Delete " +form.getId();
            form = new User();
        }  else if (path.contains("reset")) {
            form = new User();
        }

        List<User> list = dao.findAll();

        req.setAttribute("message", message);
        req.setAttribute("user", form);
        req.setAttribute("users", list);
        req.getRequestDispatcher("/pages/user-crud.jsp").forward(req, resp);
    }
}
