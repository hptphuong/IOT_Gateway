-- =============================================
-- Author:      Phuong Hoang
-- Create date: 01/07/2017
-- Description: Them chien dich vao bang chien dich, dong thoi cap nhat thong tin trong bang quangcao
-- Parameters:
--   _TenChienDich - Ten chien dich, kieu varchar(255)
--   
-- Returns:    
-- History:
--   01/07/2017 Phuong Hoang: Create store proc.
-- =============================================
CREATE DEFINER=`hptphuong`@`localhost` PROCEDURE `inserToCChiendich`(
  _TenChienDich VARCHAR(255) ,
  _TGBatDau VARCHAR(20) ,
  _TGKetThuc DATETIME ,
  _SoLuongXe INT ,
  _TrangThaiCD VARCHAR(255) ,
  _KhuVuc VARCHAR(45) ,
  _Tong4Cho INT ,
  _Tong7Cho INT ,
  _StatusRecord VARCHAR(45) ,
  _TaiKhoanKH VARCHAR(45) ,
  _CreatedDate DATETIME,
  _loai_quang_cao varchar(255),
  _url_quang_cao varchar(255) 
)
BEGIN
  INSERT INTO `cchiendich` (
  `TenChienDich`, 
  `TGBatDau`, 
  `TGKetThuc`, 
  `SoLuongXe`, 
  `TrangThaiCD`, 
  `KhuVuc`, 
  `Tong4Cho`, 
  `Tong7Cho`, 
  `StatusRecord`, 
  `TaiKhoanKH`, 
  `CreatedDate`) 
  VALUES (
  _TenChienDich, 
   str_to_date(_TGBatDau, '%Y%m%d'), 
  _TGKetThuc,
  _SoLuongXe,
  _TrangThaiCD,
  _KhuVuc,
  _Tong4Cho,
  _Tong7Cho,
  _StatusRecord,
  _TaiKhoanKH,
  _CreatedDate
  );
  -- INSERT INTO CChienDich(TenChienDich,TGBatDau)
  -- values (_TenChienDich,_TGBatDau);
  SET @last_ID = LAST_INSERT_ID();
  SELECT concat('myvar is ', @last_ID);
  INSERT INTO cquangcao(chien_dich_id,loai_quang_cao,url_quang_cao)
  values (@last_id,_loai_quang_cao,_url_quang_cao);
  
END