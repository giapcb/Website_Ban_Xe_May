package model;

public class Mau {
    private int id;
    private int maSP;
    private String tenMau;
    private String anhMau;

    public Mau() {
    }

    public Mau(int id, int maSP, String tenMau, String anhMau) {
        this.id = id;
        this.maSP = maSP;
        this.tenMau = tenMau;
        this.anhMau = anhMau;
    }

    // getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getMaSP() { return maSP; }
    public void setMaSP(int maSP) { this.maSP = maSP; }

    public String getTenMau() { return tenMau; }
    public void setTenMau(String tenMau) { this.tenMau = tenMau; }

    public String getAnhMau() { return anhMau; }
    public void setAnhMau(String anhMau) { this.anhMau = anhMau; }
}
