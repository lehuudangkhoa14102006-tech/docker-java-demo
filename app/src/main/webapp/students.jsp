<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản lý sinh viên</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <div class="container">
    <h1>Quản lý sinh viên</h1>
    <p class="host">Request được xử lý bởi container: <strong><c:out value="${host}"/></strong></p>

    <form method="post" action="students" class="add-form">
      <input type="hidden" name="action" value="add">
      <input type="text" name="fullName" placeholder="Họ và tên" required>
      <input type="email" name="email" placeholder="Email" required>
      <input type="text" name="major" placeholder="Ngành học" required>
      <button type="submit">Thêm</button>
    </form>

    <table>
      <thead>
        <tr><th>ID</th><th>Họ tên</th><th>Email</th><th>Ngành</th><th></th></tr>
      </thead>
      <tbody>
        <c:forEach var="s" items="${students}">
          <tr>
            <td>${s.id}</td>
            <td><c:out value="${s.fullName}"/></td>
            <td><c:out value="${s.email}"/></td>
            <td><c:out value="${s.major}"/></td>
            <td>
              <form method="post" action="students">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${s.id}">
                <button type="submit" class="danger">Xóa</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</body>
</html>