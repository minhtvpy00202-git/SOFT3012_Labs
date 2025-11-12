
//Tạo database
USE master
GO
CREATE DATABASE PolyOE
GO
USE PolyOE
GO
CREATE TABLE Users(
    Id NVARCHAR(20) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Fullname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    Admin BIT NOT NULL,
    PRIMARY KEY(Id)
)

--Chèn tay vài bản ghi
  INSERT INTO Users (Id, Password, Fullname, Email, Admin) VALUES
  ('U02','p2',N'Lê Thị Na','na@gmail.com',0),
('U03','p3',N'Phạm Văn An','an@fpt.edu.vn',1),
('U04','p4',N'Trần Quốc Khánh','khanh@fpt.edu.vn',0),
('U05','p5',N'Huỳnh Nhật Minh','minh@gmail.com',1),
('U06','p6',N'Võ Thị Hoa','hoa@fpt.edu.vn',0),
('U07','p7',N'Đoàn Tuấn Kiệt','kiet@gmail.com',0),
('U08','p8',N'Bùi Gia Huy','huy@fpt.edu.vn',0),
('U09','p9',N'Ngô Mỹ Duyên','duyen@gmail.com',0),
('U10','p10',N'Đặng Quốc Thái','thai@fpt.edu.vn',1),
('U11','p11',N'Nguyễn Thảo Ly','ly@fpt.edu.vn',0),
('U12','p12',N'Phan Nhã Uyên','uyen@gmail.com',0),
('U13','p13',N'Hồ Đức Phúc','phuc@fpt.edu.vn',0),
('U14','p14',N'Tạ Nhật Long','long@gmail.com',0),
('U15','p15',N'Lương Hải Yến','yen@fpt.edu.vn',0),
('U16','p16',N'Võ Nhật Minh','minh@fpt.edu.vn',0),
('U17','p17',N'Hạ Hồng Anh','anh@fpt.edu.vn',0);

