CREATE DATABASE NUOCGIAIKHAC
--create table
CREATE TABLE NHACC
(
	MaNCC CHAR(3) ,
	TenNCC VARCHAR(40),
	DiaChiNCC VARCHAR(40),
	DTNCC VARCHAR(20),
	PRIMARY KEY (MaNCC)
)
CREATE TABLE KH 
(
	MaKH CHAR(4) ,
	TenKH VARCHAR(20),
	DCKH VARCHAR(40),
	DTKH VARCHAR(20),
	PRIMARY KEY (MaKH)
)
CREATE TABLE CT_DDH
(
	SoDDH VARCHAR(5),
	MaNGK CHAR(3),
	SLDat INT,
	PRIMARY KEY (SoDDH,MaNGK)
)
CREATE TABLE CT_PGH
(
	SoPGH VARCHAR(5),
	MaNGK CHAR(3),
	SLGiao INT,
	DGGiao MONEY,
	PRIMARY KEY (SoPGH,MaNGK)
)
CREATE TABLE CT_HOADON
( 
	SoHD CHAR(4),
	MaNGK CHAR(3),
	SLKHMua INT,
	DGBan MONEY,
	PRIMARY KEY (SoHD,MaNGK)
)
CREATE TABLE CT_PH
(
	SoPH CHAR(4),
	MaNGK CHAR(3),
	SLHen INT,
	PRIMARY KEY (SoPH,MaNGK)
)
CREATE TABLE LOAINGK
(
	MaLoaiNGK CHAR(3),
	TenLoaiNGK VARCHAR(20),
	MaNCC CHAR(3),
	PRIMARY KEY (MaLoaiNGK),
	FOREIGN KEY (MaNCC) REFERENCES dbo.NHACC (MaNCC)
)
CREATE TABLE NGK
(
	MaNGK CHAR(3),
	TenNGK VARCHAR(20),
	QuyCach VARCHAR(10),
	MaLoaiNGK CHAR(3),
	PRIMARY KEY (MaNGK),
	FOREIGN KEY (MaLoaiNGK) REFERENCES dbo.LOAINGK (MaLoaiNGK)
)
CREATE TABLE DDH
(
	SoDDH VARCHAR(5),
	NgayDH SMALLDATETIME,
	MaNCC CHAR(3),
	PRIMARY KEY (SoDDH),
	FOREIGN KEY (MaNCC) REFERENCES dbo.NHACC (MaNCC)
)
CREATE TABLE PHIEUGH
(
	SoPGH VARCHAR(5),
	NgayGH SMALLDATETIME,
	SoDDH VARCHAR(5),
	PRIMARY KEY (SoPGH),
	FOREIGN KEY (SoDDH) REFERENCES dbo.DDH (SoDDH)
)
CREATE TABLE HOADON
(
	SoHD CHAR(4),
	NgaylapHD SMALLDATETIME,
	MaKH CHAR(4),
	PRIMARY KEY (SoHD),
	FOREIGN KEY (MaKH) REFERENCES dbo.KH (MaKH)
)
CREATE TABLE PHIEUHEN
(
	SoPH CHAR(4),
	NgayLapPH SMALLDATETIME,
	NgayHenGiao SMALLDATETIME,
	MaKH CHAR(4),
	PRIMARY KEY (SoPH),
	FOREIGN KEY (MaKH) REFERENCES dbo.KH (MaKH)
)
CREATE TABLE PHIEUTRANO
(	
	SoPTN VARCHAR(5),
	NgayTra SMALLDATETIME,
	SoTienTra MONEY,
	SoHD CHAR(4),
	PRIMARY KEY (SoPTN),
	FOREIGN KEY (SoHD) REFERENCES dbo.HOADON (SoHD)
)
--insert data TABLE dbo.NHACC
INSERT INTO dbo.NHACC VALUES ('NC1','Cong ty NGK quoc te CocaCola','Xa lo Ha Noi, Thu Duc, TP.HCM','088967908')
INSERT INTO dbo.NHACC VALUES ('NC2','Cong ty NGK quoc te Pepsi','Ben Chuong Duong, Q.1, TP.HCM','083663366')
INSERT INTO dbo.NHACC VALUES ('NC3','Cong ty NGK Ben Chuong Duong','Ham Tu, Q.5, TP.HCM','089456677')

--insert data table dbo.KH
INSERT INTO dbo.KH VALUES ('KH01','Cua hang BT','144 XVNT','088405996')
INSERT INTO dbo.KH VALUES ('KH02','Cua hang tra','198/42 NTT','085974572')
INSERT INTO dbo.KH VALUES ('KH03','Sieu thi Coop','24 DTH','086547888')

--insert data table dbo.CT_DDH
INSERT INTO dbo.CT_DDH VALUES ('DDH01','CC1',20)
INSERT INTO dbo.CT_DDH VALUES ('DDH01','CC2',15)
INSERT INTO dbo.CT_DDH VALUES ('DDH01','PS1',18)
INSERT INTO dbo.CT_DDH VALUES ('DDH01','VS2',12)
INSERT INTO dbo.CT_DDH VALUES ('DDH02','CC2',30)
INSERT INTO dbo.CT_DDH VALUES ('DDH02','PS2',10)
INSERT INTO dbo.CT_DDH VALUES ('DDH02','SV1',5)
INSERT INTO dbo.CT_DDH VALUES ('DDH02','ST1',15)
INSERT INTO dbo.CT_DDH VALUES ('DDH02','C2',10)
INSERT INTO dbo.CT_DDH VALUES ('DDH03','OD',45)
INSERT INTO dbo.CT_DDH VALUES ('DDH04','CC1',8)
INSERT INTO dbo.CT_DDH VALUES ('DDH04','ST2',12)

--insert data table dbo.CT_PGH
INSERT INTO dbo.CT_PGH VALUES ('PGH01','CC1',15,5000)  
INSERT INTO dbo.CT_PGH VALUES ('PGH01','CC2',15,4000) 
INSERT INTO dbo.CT_PGH VALUES ('PGH01','SV2',10,4000) 
INSERT INTO dbo.CT_PGH VALUES ('PGH02','SV2',2,4000) 
INSERT INTO dbo.CT_PGH VALUES ('PGH03','CC2',30,5000) 
INSERT INTO dbo.CT_PGH VALUES ('PGH03','PS2',10,4000) 
INSERT INTO dbo.CT_PGH VALUES ('PGH03','ST1',15,9000) 
INSERT INTO dbo.CT_PGH VALUES ('PGH03','C2',10,8000) 

--insert data table dbo.CT_HOADON
INSERT INTO dbo.CT_HOADON VALUES ('HD01','CC1',20,6000)
INSERT INTO dbo.CT_HOADON VALUES ('HD01','CC2',50,5000)
INSERT INTO dbo.CT_HOADON VALUES ('HD02','ST1',40,10000)
INSERT INTO dbo.CT_HOADON VALUES ('HD03','SV2',60,5000)
INSERT INTO dbo.CT_HOADON VALUES ('HD04','PS2',25,5000)
INSERT INTO dbo.CT_HOADON VALUES ('HD05','CC1',100,6000)
INSERT INTO dbo.CT_HOADON VALUES ('HD05','SV1',12,8000)
INSERT INTO dbo.CT_HOADON VALUES ('HD05','C2',80,9000)
INSERT INTO dbo.CT_HOADON VALUES ('HD06','OD',55,1000)
INSERT INTO dbo.CT_HOADON VALUES ('HD06','ST2',50,11000)

--insert data table dbo.CT_PH
INSERT INTO dbo.CT_PH VALUES ('PH01','ST2',10)
INSERT INTO dbo.CT_PH VALUES ('PH01','OD',8)
INSERT INTO dbo.CT_PH VALUES ('PH02','CC1',20)
INSERT INTO dbo.CT_PH VALUES ('PH03','ST1',7)
INSERT INTO dbo.CT_PH VALUES ('PH03','SV2',12)
INSERT INTO dbo.CT_PH VALUES ('PH03','CC2',9)
INSERT INTO dbo.CT_PH VALUES ('PH04','PS2',15)

--insert data table dbo.LOAINGK
INSERT INTO dbo.LOAINGK VALUES ('NK1','Nuoc ngot co gas','NC1')
INSERT INTO dbo.LOAINGK VALUES ('NK2','Nuoc ngot khong gas','NC2')
INSERT INTO dbo.LOAINGK VALUES ('NK3','Tra','NC1')
INSERT INTO dbo.LOAINGK VALUES ('NK4','Sua','NC2')

--insert data table dbo.NGK
INSERT INTO dbo.NGK VALUES ('CC1','Coca Cola', 'Chai', 'NK1')
INSERT INTO dbo.NGK VALUES ('CC2','Coca Cola', 'Lon', 'NK1')
INSERT INTO dbo.NGK VALUES ('PS1','Pepsi', 'Chai', 'NK1')
INSERT INTO dbo.NGK VALUES ('PS2','Pepsi', 'Lon', 'NK1')
INSERT INTO dbo.NGK VALUES ('SV1','Seven Up', 'Chai', 'NK1')
INSERT INTO dbo.NGK VALUES ('SV2','Seven Up', 'Lon', 'NK1')
INSERT INTO dbo.NGK VALUES ('NO1','Number One', 'Chai', 'NK1')
INSERT INTO dbo.NGK VALUES ('NO2','Number One', 'Lon', 'NK1')
INSERT INTO dbo.NGK VALUES ('ST1','Sting dau', 'Chai', 'NK1')
INSERT INTO dbo.NGK VALUES ('ST2','Sting dau', 'Lon', 'NK1')
INSERT INTO dbo.NGK VALUES ('C2','Tra C2', 'Chai', 'NK2')
INSERT INTO dbo.NGK VALUES ('OD','Tra xanh 0 do', 'Chai', 'NK2')
INSERT INTO dbo.NGK VALUES ('ML1','Sua tuoi tiet trung', 'Bich', 'NK1')
INSERT INTO dbo.NGK VALUES ('WT1','Nuoc uong dong chai', 'Lon', 'NK2')

--insert data table dbo.DDH
INSERT INTO dbo.DDH VALUES ('DDH01','2011-05-10','NC1')
INSERT INTO dbo.DDH VALUES ('DDH02','2011-05-20','NC1')
INSERT INTO dbo.DDH VALUES ('DDH03','2011-05-26','NC2')
INSERT INTO dbo.DDH VALUES ('DDH04','2011-06 -03','NC2')

--insert data table dbo.PHIEUGH
INSERT INTO dbo.PHIEUGH VALUES ('PGH01','2010-05-12','DDH01')
INSERT INTO dbo.PHIEUGH VALUES ('PGH02','2010-05-12','DDH01')
INSERT INTO dbo.PHIEUGH VALUES ('PGH03','2010-05-21','DDH02')
INSERT INTO dbo.PHIEUGH VALUES ('PGH04','2010-05-22','DDH02')
INSERT INTO dbo.PHIEUGH VALUES ('PGH05','2010-05-28','DDH03')

--insert dada table dbo.HOADON 
INSERT INTO dbo.HOADON VALUES ('HD01','2010-05-12','KH01')
INSERT INTO dbo.HOADON VALUES ('HD02','2010-05-20','KH01')
INSERT INTO dbo.HOADON VALUES ('HD03','2010-06-05','KH02')
INSERT INTO dbo.HOADON VALUES ('HD04','2010-05-16','KH02')
INSERT INTO dbo.HOADON VALUES ('HD05','2011-05-22','KH02')
INSERT INTO dbo.HOADON VALUES ('HD06','2010-07-08','KH03')

--insert data table dbo.PHIEUHEN
INSERT INTO dbo.PHIEUHEN VALUES ('PH01','2010-05-02','2010-06-09','KH01')
INSERT INTO dbo.PHIEUHEN VALUES ('PH02','2010-05-25','2010-06-28','KH02')
INSERT INTO dbo.PHIEUHEN VALUES ('PH03','2010-06-01','2010-06-02','KH03')

--insert data table dbo.PHIEUTRANO
INSERT INTO dbo.PHIEUTRANO VALUES('PTN01','2010-05-18',500000,'HD01')
INSERT INTO dbo.PHIEUTRANO VALUES('PTN02','2010-06-01',350000,'HD01')
INSERT INTO dbo.PHIEUTRANO VALUES('PTN03','2010-06-02',650000,'HD02')
INSERT INTO dbo.PHIEUTRANO VALUES('PTN04','2010-06-15',1020000,'HD03')
INSERT INTO dbo.PHIEUTRANO VALUES('PTN05','2010-07-01',1080000,'HD03')

--cau 1: Liệt kê các NGK và loại NGK tương ứng
SELECT dbo.NGK.*,dbo.LOAINGK.* FROM dbo.NGK INNER JOIN dbo.LOAINGK ON LOAINGK.MaLoaiNGK = NGK.MaLoaiNGK

--cau 2: Cho biết thông tin về nhà cung cấp ở Thành phố HCM
SELECT * FROM dbo.NHACC WHERE DiaChiNCC LIKE '%TP.HCM'

--cau 3: Liệt kê các hóa đơn mua hàng trong tháng 5/2010
SELECT * FROM dbo.HOADON WHERE YEAR(NgaylapHD)=2010 AND MONTH(NgaylapHD)=05

--cau 4: Cho biết tên các nhà cung cấp có cung cấp NGK ‘Coca Cola’
SELECT TenNCC FROM dbo.NHACC WHERE MaNCC IN (SELECT MaNCC FROM dbo.LOAINGK WHERE MaLoaiNGK IN (SELECT MaLoaiNGK FROM dbo.NGK WHERE TenNGK ='Coca Cola'))

--cau 5: Cho biết tên các nhà cung cấp có thể cung cấp nhiều loại NGK nhất
SELECT TenNCC FROM dbo.NHACC WHERE MaNCC IN (SELECT MaNCC FROM dbo.LOAINGK WHERE MaLoaiNGK IN (SELECT MaLoaiNGK FROM dbo.NGK GROUP BY MaLoaiNGK HAVING COUNT(*) >=ALL (SELECT COUNT(*) FROM dbo.NGK GROUP BY MaLoaiNGK)))

--cau 6: Cho biết tên nhà cung cấp không có khả năng cung cấp NGK có tên ‘Pepsi’.
SELECT TenNCC FROM dbo.NHACC WHERE MaNCC NOT IN  (SELECT MaNCC FROM dbo.LOAINGK WHERE MaLoaiNGK IN (SELECT MaLoaiNGK FROM dbo.NGK WHERE TenNGK ='Pepsi'))

--cau 7: Hiển thị thông tin của NGK chưa bán được
SELECT * FROM dbo.NGK WHERE MaNGK NOT IN (SELECT MaNGK FROM dbo.CT_DDH) 

--cau 8:  Hiển thị tên và tổng số lượng bán của từng NGK
	
SELECT c.MaNGK,TenNGK, SUM(SLKHMua)  AS TSLuong   FROM dbo.CT_HOADON c JOIN dbo.NGK n ON n.MaNGK = c.MaNGK  GROUP BY c.MaNGK,TenNGK

--cau 9: Hiển thị tên và tổng số lượng của NGK nhập về
SELECT c.MaNGK,TenNGK, SUM(SLDat)  AS TSLuong   FROM dbo.CT_DDH c JOIN dbo.NGK n ON n.MaNGK = c.MaNGK  GROUP BY c.MaNGK,TenNGK

--cau 10: Hiển thị ĐĐH đã đặt NGK với số lượng nhiều nhất so với các ĐĐH khác có đặt NGK đó. Thông tin hiển thị: SoDDH, MaNGK, [SL đặt nhiều nhất]
SELECT * FROM dbo.CT_DDH WHERE SLDat = (SELECT MAX(SLDat) FROM dbo.CT_DDH)


--cau 11: Hiển thị các NGK không được nhập trong tháng 1/2010
SELECT * FROM dbo.NGK WHERE MaLoaiNGK IN (SELECT MaLoaiNGK FROM dbo.LOAINGK WHERE MaNCC NOT IN (SELECT MaNCC FROM dbo.DDH WHERE YEAR(NgayDH) = 2010 AND MONTH(NgayDH) = 01))

--cau 12: Hiển thị tên các NGK không bán được trong tháng 6/2010
SELECT TenNGK FROM dbo.NGK WHERE MaNGK IN (SELECT MaNGK FROM dbo.CT_HOADON WHERE SoHD NOT IN (SELECT SoHD FROM dbo.HOADON WHERE YEAR(NgaylapHD) = 2010 AND MONTH(NgaylapHD) = 06))

--cau 13: Cho biết cửa hàng bán bao nhiêu thứ NGK
SELECT COUNT(DISTINCT(TenNGK)) FROM dbo.NGK

--cau 14: Cho biết cửa hàng bán bao nhiêu loại NGK
SELECT COUNT(DISTINCT(MaLoaiNGK)) FROM dbo.LOAINGK

--cau 15: Hiển thị thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất (căn cứ vào số lần mua hàng)
SELECT * FROM dbo.KH WHERE MaKH IN (SELECT MaKH FROM dbo.HOADON GROUP BY MaKH HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM dbo.HOADON GROUP BY MaKH))

--cau 16: Tính tổng doanh thu năm 2010 của cửa hàng

--cau 17: Liệt kê 5 loại NGK bán chạy nhất (doanh thu) trong tháng 5/2010
SELECT TOP 5 MaNGK,SUM(SLKHMua) FROM dbo.CT_HOADON GROUP BY MaNGK  ORDER BY SUM(SLKHMua) DESC

--cau 18: Liệt kê thông tin bán NGK của tháng 5/2010. Thông tin hiển thị: Mã NGK, Tên NGK, SL bán
SELECT c.MaNGK,TenNGK, SUM(SLKHMua)  AS TSLuong   FROM dbo.CT_HOADON c JOIN dbo.NGK n ON n.MaNGK = c.MaNGK WHERE c.SoHD IN (SELECT SoHD FROM dbo.HOADON WHERE YEAR(NgaylapHD)=2010 AND MONTH(NgaylapHD) = 05)  GROUP BY c.MaNGK,TenNGK

--cau 19:Liệt kê thông tin của NGK có nhiều người mua nhất.
SELECT TOP 1 c.MaNGK,TenNGK, SUM(SLKHMua) AS TSLuong  FROM dbo.CT_HOADON c JOIN dbo.NGK n ON n.MaNGK = c.MaNGK  GROUP BY c.MaNGK,TenNGK ORDER BY SUM(SLKHMua) DESC

--cau 20: Hiển thị ngày nhập hàng gần nhất của cửa hàng
SELECT TOP 1  NgayDH FROM dbo.DDH ORDER BY NgayDH DESC

--cau 21: Cho biết số lần mua hàng của khách có mã là ‘KH01’
SELECT COUNT(MaKH) AS SLMuaHang FROM dbo.HOADON WHERE MaKH='KH01'

--cau 22: Cho biết tổng tiền của từng hóa đơn
SELECT SoHD,SUM(SLKHMua*DGBan) AS TongTien FROM  dbo.CT_HOADON  GROUP BY SoHD

--cau 23: Cho biết danh sách các hóa đơn gồm SoHD, NgaylapHD, MaKH, TenKH và tổng trị giá của từng HoaDon. Danh sách sắp xếp tăng dần theo ngày và giảm dần theo tổng trị giá của hóa đơn
SELECT c.SoHD,h.NgaylapHD,n.TenNGK, SUM(c.SLKHMua*c.DGBan) FROM dbo.HOADON h JOIN dbo.CT_HOADON c JOIN dbo.NGK n ON n.MaNGK = c.MaNGK ON c.SoHD = h.SoHD GROUP BY c.SoHD,h.NgaylapHD, n.TenNGK ORDER BY h.NgaylapHD ASC, SUM(SLKHMua*DGBan) DESC

--cau 24:  Cho biết các hóa đơn có tổng trị giá lớn hơn tổng trị giá trung bình của các hóa đơn trong ngày 8/06/2010


--cau 25: Cho biết số lượng từng NGK tiêu thụ theo từng tháng của năm 2010


--cau 26: Đưa ra danh sách NGK chưa được bán trong tháng 9 năm 2010
SELECT TenNGK  FROM dbo.NGK WHERE MaNGK NOT IN (SELECT MaNGK FROM dbo.CT_HOADON WHERE SoHD IN (SELECT SoHD FROM dbo.HOADON WHERE YEAR(NgaylapHD)=2010 AND MONTH(NgaylapHD)=09))

--cau 27: Đưa ra danh sách khách hàng có địa chỉ ở TP.HCM và từng mua NGK trong tháng 9 năm 2010

--cau 28: Đưa ra số lượng đã bán tương ứng của từng NGK trong tháng 10 năm 2010
SELECT h.MaNGK,SLKHMua FROM dbo.CT_HOADON h JOIN dbo.HOADON ON HOADON.SoHD = h.SoHD WHERE YEAR(NgaylapHD) = 2010 AND MONTH(NgaylapHD)=10 

--cau 29: Hiển thị thông tin khách hàng đã từng mua và tổng số lượng của từng NGK tại cửa hàng
SELECT h.MaKH, c.MaNGK, c.SLKHMua FROM dbo.HOADON h JOIN dbo.CT_HOADON c ON c.SoHD = h.SoHD

--cau 30:Cho biết trong năm 2010, khách hàng nào đã mua nợ nhiều nhất
 SELECT TOP 1 KH.MaKH,HOADON.SoHD, SUM(SoTienTra) FROM dbo.KH JOIN dbo.HOADON JOIN dbo.PHIEUTRANO ON PHIEUTRANO.SoHD = HOADON.SoHD ON HOADON.MaKH = KH.MaKH WHERE YEAR(dbo.PHIEUTRANO.NgayTra) =2010 GROUP BY HOADON.SoHD,KH.MaKH ORDER BY SUM(SoTienTra) DESC

--cau 31:Có bao nhiêu hóa đơn chưa thanh toán hết số tiền?
SELECT COUNT(DISTINCT SoHD) FROM dbo.PHIEUTRANO

--cau 32:Liệt kê các hóa đơn cùng tên của khách hàng tương ứng đã mua NGK và thanh toán tiền đầy đủ 1 lần
SELECT * FROM dbo.HOADON WHERE SoHD NOT IN (SELECT SoHD FROM dbo.PHIEUTRANO)

--cau 33:Thông kê cho biết thông tin đặt hàng của cửa hàng trong năm 2010: Mã NGK, Tên NGK, Tổng SL đặt.
SELECT  CT_DDH.MaNGK,TenNGK, SUM(SLDat) AS SLDat FROM dbo.NGK JOIN dbo.DDH JOIN dbo.CT_DDH ON CT_DDH.SoDDH = DDH.SoDDH ON CT_DDH.MaNGK = NGK.MaNGK WHERE YEAR( DDH.NgayDH) =2010  GROUP BY CT_DDH.MaNGK,TenNGK 

--cau 34:Để thuận tiện trong việc tặng quà Tết cho khách hàng, hãy liệt kê danh sách khách hàng đã mua NGK với tổng số tiền tương ứng trong năm 2010 (hiển thị giảm dần theo số tiền đã mua)
SELECT c.SoHD,h.MaKH, SUM(c.SLKHMua*c.DGBan) FROM dbo.HOADON h JOIN dbo.CT_HOADON c  ON  c.SoHD = h.SoHD WHERE YEAR(h.NgaylapHD) =2010 GROUP BY c.SoHD,h.MaKH  ORDER BY  SUM(c.SLKHMua*c.DGBan) DESC

