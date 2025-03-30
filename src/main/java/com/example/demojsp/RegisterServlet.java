package com.example.demojsp;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Kiểm tra xem username đã tồn tại chưa
        if (userDAO.isUsernameExists(username)) {
            request.setAttribute("error", "Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng User và lưu vào cơ sở dữ liệu
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);

        if (userDAO.registerUser(user)) {
            // Đăng ký thành công, chuyển hướng về trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            // Đăng ký thất bại, hiển thị lỗi
            request.setAttribute("error", "Đăng ký thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}