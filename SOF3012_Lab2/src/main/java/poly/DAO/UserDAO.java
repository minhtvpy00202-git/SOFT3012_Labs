package poly.DAO;

import poly.entity.User;

import java.util.List;

public interface UserDAO {

    List<User> findAll();

    User findById(String id);

    void create(User entity);

    void update(User entity);

    void deleteById(String id);
}
