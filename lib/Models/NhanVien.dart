// ignore_for_file: file_names, non_constant_identifier_names

class NhanVien {
  late int? nhanvien_id;
  late String? nhanvien_manv;
  late String? nhanvien_hoten;
  late int? nhanvien_donvi;
  late String? nhanvien_taikhoan;
  late String? nhanvien_didong;
  late int? nhanvien_chucdanh;
  late String? nhanvien_matkhau;
  late int? nhanvien_trangthai;
  late String? nhanvien_mst;
  late String? nhanvien_manv_thns;
  late String? nhanvien_smcs;
  late int? nhanvien_congty_t3;
  late DateTime? ngay_bd_lamviec;
  late DateTime? ngay_kt_lamviec;
  late int? gioitinh;
  late DateTime? ngaysinh;
  late String? cmnd;
  late String? diachi;
  late String? trinhdo;
  late String? ghichu;
  late int? chuyenmon;
  late String? tk_atm;
  late int? loaihd;
  late int? dangvien;
  late int? doanvien;
  late DateTime? ngay_bd_hd;
  late DateTime? ngay_vaodang;
  late DateTime? ngaycap;
  late String? noicap;
  late String? so_so_bhyt;
  late String? so_so_bhxh;
  late String? nhanvien_odp;
  late String? tk_atm_vcb;
  NhanVien(
      {this.nhanvien_id,
      this.nhanvien_manv,
      this.nhanvien_hoten,
      this.nhanvien_donvi,
      this.nhanvien_taikhoan,
      this.nhanvien_didong,
      this.nhanvien_chucdanh,
      this.nhanvien_matkhau,
      this.nhanvien_trangthai,
      this.nhanvien_mst,
      this.nhanvien_manv_thns,
      this.nhanvien_smcs,
      this.nhanvien_congty_t3,
      this.ngay_bd_lamviec,
      this.ngay_kt_lamviec,
      this.gioitinh,
      this.ngaysinh,
      this.cmnd,
      this.diachi,
      this.trinhdo,
      this.ghichu,
      this.chuyenmon,
      this.tk_atm,
      this.loaihd,
      this.dangvien,
      this.doanvien,
      this.ngay_bd_hd,
      this.ngay_vaodang,
      this.ngaycap,
      this.noicap,
      this.so_so_bhyt,
      this.so_so_bhxh,
      this.nhanvien_odp,
      this.tk_atm_vcb});
  factory NhanVien.fromJson(Map<String, dynamic> json) {
    return NhanVien(
      nhanvien_id: json['nhanvienId'],
      nhanvien_manv: json['nhanvienManv'],
      nhanvien_hoten: json['nhanvienHoten'],
      nhanvien_donvi: json['nhanvienDonvi'],
      nhanvien_taikhoan: json['nhanvienTaikhoan'],
      nhanvien_didong: json['nhanvienDidong'],
      nhanvien_chucdanh: json['nhanvienChucdanh'],
      nhanvien_matkhau: json['nhanvienMatkhau'],
      nhanvien_trangthai: json['nhanvienTrangthai'],
      nhanvien_mst: json['nhanvienMst'],
      nhanvien_manv_thns: json['nhanvienManvThns'],
      nhanvien_smcs: json['nhanvienSmcs'],
      nhanvien_congty_t3: json['nhanvienCongtyT3'],
      ngay_bd_lamviec: DateTime.parse(json['ngayBdLamviec']),
      ngay_kt_lamviec: DateTime.parse(json['ngayKtLamviec']),
      gioitinh: json['gioitinh'],
      ngaysinh: DateTime.parse(json['ngaysinh']),
      cmnd: json['cmnd'],
      diachi: json['diachi'],
      trinhdo: json['trinhdo'],
      ghichu: json['ghichu'],
      chuyenmon: json['chuyenmon'],
      tk_atm: json['tkAtm'],
      loaihd: json['loaihd'],
      dangvien: json['dangvien'],
      doanvien: json['doanvien'],
      ngay_bd_hd: json['ngayBdHd'] == null
          ? DateTime(0)
          : DateTime.parse(json['ngayBdHd']),
      ngay_vaodang: json['ngayVaodang'] == null
          ? DateTime(0)
          : DateTime.parse(json['ngayVaodang']),
      ngaycap: json['ngaycap'] == null
          ? DateTime(0)
          : DateTime.parse(json['ngaycap']),
      noicap: json['noicap'],
      so_so_bhyt: json['soSoBhyt'],
      so_so_bhxh: json['soSoBhxh'],
      nhanvien_odp: json['nhanvienOdp'],
      tk_atm_vcb: json['tkAtmVcb'],
    );
  }
}

NhanVien localNhanVien = NhanVien(
    nhanvien_hoten: 'Dev mode',
    nhanvien_manv: 'quyenplp.agg',
    nhanvien_didong: '0346470921',
    nhanvien_donvi:13,
    nhanvien_manv_thns: 'VNP033333',
    nhanvien_chucdanh: 7,
    nhanvien_smcs: 'vinp.agg',
    nhanvien_id: 884);
String nhanvien_TenDonVi = 'Phòng Điều hành - Nghiệp vụ';
String nhanvien_TenDonVi2 = 'Phòng BHKV Châu Đốc';
String nhanvien_DonVi_MoTa= 'Phòng ĐHNV';
String nhanvien_donvi_Pttb = '175545';