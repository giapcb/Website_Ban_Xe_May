package model;

public class NguoiDung {
    private int MaND;
    private String HoTen;
    private String TenDN;
    private String MatKhau;
    private String Email;
    private String SDT;
    private String DiaChi;

    public NguoiDung() {}

    public NguoiDung(String hoTen, String tenDN, String matKhau, String email, String sdt, String diaChi) {
        this.HoTen = hoTen;
        this.TenDN = tenDN;
        this.MatKhau = matKhau;
        this.Email = email;
        this.SDT = sdt;
        this.DiaChi = diaChi;
    }

    public int getMaND() {
        return MaND;
    }

    public void setMaND(int maND) {
        this.MaND = maND;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String hoTen) {
        this.HoTen = hoTen;
    }

    public String getTenDN() {
        return TenDN;
    }

    public void setTenDN(String tenDN) {
        this.TenDN = tenDN;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public void setMatKhau(String matKhau) {
        this.MatKhau = matKhau;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String sdt) {
        this.SDT = sdt;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String diaChi) {
        this.DiaChi = diaChi;
    }
}
