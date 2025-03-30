<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chào mừng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body text-center">
                    <h1>Chào mừng, <%= ((model.User) session.getAttribute("user")).getUsername() %>!</h1>
                    <p>Bạn đã đăng nhập thành công.</p>
                    <a href="<%=request.getContextPath()%>/logout" class="btn btn-danger">Đăng xuất</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>