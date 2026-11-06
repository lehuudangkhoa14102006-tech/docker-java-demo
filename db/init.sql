CREATE TABLE IF NOT EXISTS students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  major VARCHAR(100) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO students(full_name, email, major) VALUES
('Nguyễn Văn A', 'a@example.com', 'Công nghệ thông tin'),
('Trần Thị B', 'b@example.com', 'Kỹ thuật phần mềm');