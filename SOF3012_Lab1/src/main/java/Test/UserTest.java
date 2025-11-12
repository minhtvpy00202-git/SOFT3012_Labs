package Test;

import Entity.UserManager;

public class UserTest {
    public static void main(String[] args) {
        UserManager um = new UserManager();
        try {
            System.out.println("=== CREATE ===");
            um.create();                  // thêm U01

            System.out.println("=== FIND ALL ===");
            um.findAll();                 // in toàn bộ user

            System.out.println("=== FIND BY ID (U01) ===");
            um.findById("U01");           // tìm U01

            System.out.println("=== UPDATE (U01) ===");
            um.update();                  // đổi tên + email U01

            System.out.println("=== FIND BY ID (U01) SAU UPDATE ===");
            um.findById("U01");

            System.out.println("=== DELETE (U01) ===");
            um.deleteById();              // xoá U01

            System.out.println("=== FIND ALL SAU DELETE ===");
            um.findAll();

            //Bài 3:
            System.out.println("=== TÌM USER EMAIL @fpt.edu.vn KHÔNG PHẢI ADMIN ===");
            um.findFptUser();

            //Bài 4:
            System.out.println("=== PAGE 3, SIZE 5 ===");
            um.listPage(2, 5); // trang thứ 3 (0-based)

        } finally {
            um.close();
        }
    }
}
