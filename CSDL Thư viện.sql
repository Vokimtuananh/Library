CREATE TABLE `BanDoc` (
  `MaBanDoc` varchar(255) PRIMARY KEY,
  `HoTen` varchar(255),
  `NgaySinh` datetime,
  `NgayLamThe` datetime,
  `SDT` int UNIQUE,
  `CCCD` int UNIQUE
);

CREATE TABLE `ThuThu` (
  `MaThuThu` varchar(255) PRIMARY KEY,
  `HoTen` varchar(255),
  `NgaySinh` datetime,
  `ThoiGianCongTac` datetime,
  `GioiTinh` varchar2,
  `Email` varchar(255) UNIQUE,
  `SDT` int UNIQUE
);

CREATE TABLE `CaTruc` (
  `ThoiGianTruc` datetime PRIMARY KEY,
  `MaThuThu` varchar(255),
  `MaTuan` varchar(255)
);

CREATE TABLE `LichTuan` (
  `MaTuan` varchar(255) PRIMARY KEY,
  `ThoiGianBatDau` datetime,
  `ThoiGianKetThuc` datetime
);

CREATE TABLE `GiaSach` (
  `MaGia` varchar(255) PRIMARY KEY,
  `SoluongSach` int,
  `TheLoai` varchar(255)
);

CREATE TABLE `Sach` (
  `MaSach` varchar(255) PRIMARY KEY,
  `MaGia` varchar(255),
  `TuaDe` varchar(255),
  `MaTacGia` varchar(255),
  `NhaXuatBan` varchar(255),
  `TinhTrang` varchar(255),
  `NgayNhapKho` datetime
);

CREATE TABLE `TacGia` (
  `MaTacGia` varchar(255) PRIMARY KEY,
  `TenTacGia` varchar(255),
  `NamSinh` year,
  `NamMat` year,
  `GioiTinh` varchar(255),
  `QuocTich` varchar(255)
);

CREATE TABLE `PhieuMuon` (
  `MaSach` varchar(255),
  `HanTra` datetime,
  `ThoiGianTruc` datetime,
  `MaBanDoc` varchar(255)
);

CREATE TABLE `ThuThu_CaTruc` (
  `ThuThu_MaThuThu` varchar,
  `CaTruc_MaThuThu` varchar,
  PRIMARY KEY (`ThuThu_MaThuThu`, `CaTruc_MaThuThu`)
);

ALTER TABLE `ThuThu_CaTruc` ADD FOREIGN KEY (`ThuThu_MaThuThu`) REFERENCES `ThuThu` (`MaThuThu`);

ALTER TABLE `ThuThu_CaTruc` ADD FOREIGN KEY (`CaTruc_MaThuThu`) REFERENCES `CaTruc` (`MaThuThu`);


ALTER TABLE `CaTruc` ADD FOREIGN KEY (`MaTuan`) REFERENCES `LichTuan` (`MaTuan`);

ALTER TABLE `Sach` ADD FOREIGN KEY (`MaGia`) REFERENCES `GiaSach` (`MaGia`);

CREATE TABLE `TacGia_Sach` (
  `TacGia_MaTacGia` varchar,
  `Sach_MaTacGia` varchar,
  PRIMARY KEY (`TacGia_MaTacGia`, `Sach_MaTacGia`)
);

ALTER TABLE `TacGia_Sach` ADD FOREIGN KEY (`TacGia_MaTacGia`) REFERENCES `TacGia` (`MaTacGia`);

ALTER TABLE `TacGia_Sach` ADD FOREIGN KEY (`Sach_MaTacGia`) REFERENCES `Sach` (`MaTacGia`);


ALTER TABLE `Sach` ADD FOREIGN KEY (`MaGia`) REFERENCES `PhieuMuon` (`MaSach`);

ALTER TABLE `PhieuMuon` ADD FOREIGN KEY (`MaBanDoc`) REFERENCES `BanDoc` (`MaBanDoc`);

ALTER TABLE `PhieuMuon` ADD FOREIGN KEY (`ThoiGianTruc`) REFERENCES `CaTruc` (`ThoiGianTruc`);
