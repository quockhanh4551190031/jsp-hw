<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-4">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title text-center">Đăng nhập</h3>
          <% if (request.getAttribute("error") != null) { %>
          <div class="alert alert-danger">
            <%= request.getAttribute("error") %>
          </div>
          <% } %>
          <form action="<%=request.getContextPath()%>/login" method="post">
            <div class="mb-3">
              <label for="username" class="form-label">Tên đăng nhập</label>
              <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Mật khẩu</label>
              <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
          </form>
          <div class="text-center mt-3">
            <p>Chưa có tài khoản? <a href="<%=request.getContextPath()%>/register.jsp">Đăng ký</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>