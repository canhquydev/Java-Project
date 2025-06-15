/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package GUI;

import CRUD.ConnectSQL;
import CRUD.layDuLieuSQL;
import Object.HoaDon;
import Object.ChiTietHoaDon;
import Object.KhachHang;
import Object.KhuyenMai;
import Object.MonAn;
import com.formdev.flatlaf.extras.FlatSVGIcon;
import java.awt.Color;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author HoCanhQuy
 */
public class tabQuanLyHoaDon extends javax.swing.JPanel {

    DefaultTableModel tableModel, model;
    layDuLieuSQL layDuLieu = new layDuLieuSQL();
    int selected = -1;
    int maNV;
    public tabQuanLyHoaDon() {
        initComponents();
        
    }
    public tabQuanLyHoaDon(int maNV){
        initComponents();
        this.maNV = maNV;
        layDuLieu();
        tbHoaDon.setShowGrid(true);
        tbHoaDon.setGridColor(new Color(224, 224, 224));
        tbChiTietHoaDon.setShowGrid(true);
        tbChiTietHoaDon.setGridColor(new Color(224, 224, 224));
        FlatSVGIcon iconCreate = new FlatSVGIcon("Images/createnew.svg", 25, 25);
        btnTaoHoaDon.setIcon(iconCreate);
        FlatSVGIcon iconDel = new FlatSVGIcon("Images/delete.svg", 25, 25);
        btnXoaMonAn.setIcon(iconDel);
        FlatSVGIcon iconChange = new FlatSVGIcon("Images/edit.svg", 25, 25);
        btnSuaHoaDOn.setIcon(iconChange);
        FlatSVGIcon iconnew = new FlatSVGIcon("Images/refresh.svg", 25, 25);
        btnLamMoi.setIcon(iconnew);
        FlatSVGIcon iconpay = new FlatSVGIcon("Images/pay.svg", 25, 25);
        btnThanhToan.setIcon(iconpay);
        FlatSVGIcon iconadd = new FlatSVGIcon("Images/add.svg", 25, 25);
        btnThemMonAn.setIcon(iconadd);
    }
    public void layChiTiet(int maHoaDon){
        model = new DefaultTableModel(){
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; 
            }
        };
        model.addColumn("Mã hoá đơn");
        model.addColumn("Tên món ăn");
        model.addColumn("Số lượng");
        for(ChiTietHoaDon hd: layDuLieu.getDsChiTietHoaDon()){
            if(hd.getMaHoaDon()== maHoaDon){
                String tenMonAn = "";
                for(MonAn mon: layDuLieu.getDsMonAn()){
                    if(mon.getMaMonAn()== hd.getMaMonAn()){
                        tenMonAn = mon.getTenMon();
                    }
                }
                model.addRow(new Object[]{
                    hd.getMaHoaDon(),
                    tenMonAn,
                    hd.getSoLuong()
                });
            }
        }
        tbChiTietHoaDon.setModel(model);
    }
    
    public void layDuLieu(){
        tableModel = new DefaultTableModel(){
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; 
            }
        };
        tableModel.addColumn("Mã hoá đơn");
        tableModel.addColumn("Mã nhân viên");
        tableModel.addColumn("Ngày lập");
        tableModel.addColumn("Tiền trước giảm");
        tableModel.addColumn("Tiền được giảm");
        tableModel.addColumn("Tiền đã giảm");
        tableModel.addColumn("Trạng thái");
        tableModel.addColumn("Tên khuyến mãi");
        tableModel.addColumn("Tên khách hàng");
        cbMaHoaDon.removeAllItems();
        cbTenKhachHang.addItem("Chọn mã hoá đơn");
        for(HoaDon hd: layDuLieu.getDsHoaDon()){
            cbMaHoaDon.addItem(String.valueOf(hd.getMaHoaDon()));
            String tenKM = "";
            for(KhuyenMai km: layDuLieu.getDsKhuyenMai()){
                if(hd.getMaKhuyenMai() == km.getMaKhuyenMai()){
                    tenKM = km.getTenKhuyenMai();
                    break;
                }
            }
            String tenKH = "";
            for(KhachHang kh: layDuLieu.getDsKhachHang()){
                if(hd.getMaKhachHang() == kh.getMaKhachHang()){
                    tenKH = kh.getTenKhachHang();
                    break;
                }
            }
            tableModel.addRow(new Object[]{
                hd.getMaHoaDon(),
                hd.getMaNhanVienLap(),
                hd.getNgayLapHoaDon(),
                hd.getTongTienTruocGiam(),
                hd.getSoTienGiam(),
                hd.getTongTienPhaiTra(),
                hd.getTrangThai(),
                tenKM,
                tenKH
            });
        }
        tbHoaDon.setModel(tableModel);
        
        cbTenKhachHang.removeAllItems();
        cbTenKhachHang.addItem("Chọn tên khách hàng");
        for(KhachHang kh: layDuLieu.getDsKhachHang()){
            cbTenKhachHang.addItem(kh.getTenKhachHang());
        }
        
        cbTenKhuyenMai.removeAllItems();
        cbTenKhuyenMai.addItem("Chọn khuyến mãi");
        for(KhuyenMai km: layDuLieu.getDsKhuyenMai()){
            cbTenKhuyenMai.addItem(km.getTenKhuyenMai());
        }
        
        cbTenMonAn.removeAllItems();
        cbTenMonAn.addItem("Chọn món ăn");
        for(MonAn mon: layDuLieu.getDsMonAn()){
            cbTenMonAn.addItem(mon.getTenMon());
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        pnChucNang = new javax.swing.JPanel();
        btnTaoHoaDon = new javax.swing.JButton();
        btnThanhToan = new javax.swing.JButton();
        btnXoaMonAn = new javax.swing.JButton();
        btnThemMonAn = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        cbMaHoaDon = new javax.swing.JComboBox<>();
        btnSuaHoaDOn = new javax.swing.JButton();
        btnLamMoi = new javax.swing.JButton();
        pnThongTinChiTiet = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        tbChiTietHoaDon = new javax.swing.JTable();
        jPanel1 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        cbTenMonAn = new javax.swing.JComboBox<>();
        txtSoLuong = new javax.swing.JSpinner();
        jLabel4 = new javax.swing.JLabel();
        pnThongTinPhieuNhap = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        cbTenKhachHang = new javax.swing.JComboBox<>();
        cbTenKhuyenMai = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        pnDanhSach = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tbHoaDon = new javax.swing.JTable();

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane2.setViewportView(jTable2);

        pnChucNang.setBackground(new java.awt.Color(255, 255, 255));
        pnChucNang.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Chức năng", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14), new java.awt.Color(51, 51, 51))); // NOI18N

        btnTaoHoaDon.setBackground(new java.awt.Color(51, 204, 255));
        btnTaoHoaDon.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnTaoHoaDon.setText("Tạo hoá đơn ");
        btnTaoHoaDon.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTaoHoaDonActionPerformed(evt);
            }
        });

        btnThanhToan.setBackground(new java.awt.Color(51, 204, 255));
        btnThanhToan.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnThanhToan.setText("Thanh toán");
        btnThanhToan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThanhToanActionPerformed(evt);
            }
        });

        btnXoaMonAn.setBackground(new java.awt.Color(51, 204, 255));
        btnXoaMonAn.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnXoaMonAn.setText("Xoá món ăn");
        btnXoaMonAn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaMonAnActionPerformed(evt);
            }
        });

        btnThemMonAn.setBackground(new java.awt.Color(51, 204, 255));
        btnThemMonAn.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnThemMonAn.setText("Thêm món ăn");
        btnThemMonAn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemMonAnActionPerformed(evt);
            }
        });

        jLabel1.setText("Mã hoá đơn:");

        cbMaHoaDon.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        btnSuaHoaDOn.setBackground(new java.awt.Color(51, 204, 255));
        btnSuaHoaDOn.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnSuaHoaDOn.setText("Sửa hoá đơn");
        btnSuaHoaDOn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaHoaDOnActionPerformed(evt);
            }
        });

        btnLamMoi.setBackground(new java.awt.Color(51, 204, 255));
        btnLamMoi.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnLamMoi.setText("Làm mới");
        btnLamMoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLamMoiActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout pnChucNangLayout = new javax.swing.GroupLayout(pnChucNang);
        pnChucNang.setLayout(pnChucNangLayout);
        pnChucNangLayout.setHorizontalGroup(
            pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnChucNangLayout.createSequentialGroup()
                .addGap(26, 26, 26)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(pnChucNangLayout.createSequentialGroup()
                        .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(btnSuaHoaDOn, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnThemMonAn, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnTaoHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, 147, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(50, 50, 50)
                        .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnThanhToan, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnLamMoi, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnXoaMonAn, javax.swing.GroupLayout.PREFERRED_SIZE, 147, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(pnChucNangLayout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cbMaHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(29, Short.MAX_VALUE))
        );
        pnChucNangLayout.setVerticalGroup(
            pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnChucNangLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cbMaHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnTaoHoaDon)
                    .addComponent(btnThanhToan))
                .addGap(12, 12, 12)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnSuaHoaDOn)
                    .addComponent(btnLamMoi))
                .addGap(12, 12, 12)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnXoaMonAn)
                    .addComponent(btnThemMonAn))
                .addContainerGap(20, Short.MAX_VALUE))
        );

        pnThongTinChiTiet.setBackground(new java.awt.Color(255, 255, 255));
        pnThongTinChiTiet.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông tin chi tiết", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        tbChiTietHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Mã phiếu", "Nguyên liệu", "Số lượng ", "Đơn giá"
            }
        ));
        jScrollPane3.setViewportView(tbChiTietHoaDon);

        javax.swing.GroupLayout pnThongTinChiTietLayout = new javax.swing.GroupLayout(pnThongTinChiTiet);
        pnThongTinChiTiet.setLayout(pnThongTinChiTietLayout);
        pnThongTinChiTietLayout.setHorizontalGroup(
            pnThongTinChiTietLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 322, Short.MAX_VALUE)
        );
        pnThongTinChiTietLayout.setVerticalGroup(
            pnThongTinChiTietLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
        );

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông tin chi tiết hoá đơn", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 1, 14))); // NOI18N

        jLabel3.setText("Tên món ăn:");

        cbTenMonAn.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        jLabel4.setText("Số lượng:");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(cbTenMonAn, 0, 289, Short.MAX_VALUE)
                    .addComponent(txtSoLuong))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cbTenMonAn, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtSoLuong, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pnThongTinPhieuNhap.setBackground(new java.awt.Color(255, 255, 255));
        pnThongTinPhieuNhap.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông tin hoá đơn", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        jLabel2.setText("Tên khách hàng:");

        cbTenKhachHang.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cbTenKhachHang.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbTenKhachHangActionPerformed(evt);
            }
        });

        cbTenKhuyenMai.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cbTenKhuyenMai.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbTenKhuyenMaiActionPerformed(evt);
            }
        });

        jLabel5.setText("Mã khuyến mãi:");

        javax.swing.GroupLayout pnThongTinPhieuNhapLayout = new javax.swing.GroupLayout(pnThongTinPhieuNhap);
        pnThongTinPhieuNhap.setLayout(pnThongTinPhieuNhapLayout);
        pnThongTinPhieuNhapLayout.setHorizontalGroup(
            pnThongTinPhieuNhapLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnThongTinPhieuNhapLayout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(pnThongTinPhieuNhapLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pnThongTinPhieuNhapLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(cbTenKhuyenMai, javax.swing.GroupLayout.PREFERRED_SIZE, 285, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cbTenKhachHang, javax.swing.GroupLayout.PREFERRED_SIZE, 285, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        pnThongTinPhieuNhapLayout.setVerticalGroup(
            pnThongTinPhieuNhapLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnThongTinPhieuNhapLayout.createSequentialGroup()
                .addGroup(pnThongTinPhieuNhapLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(cbTenKhachHang, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 9, Short.MAX_VALUE)
                .addGroup(pnThongTinPhieuNhapLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(cbTenKhuyenMai, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        pnDanhSach.setBackground(new java.awt.Color(255, 255, 255));
        pnDanhSach.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Danh sách hoá đơn", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        tbHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        tbHoaDon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tbHoaDonMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tbHoaDon);

        javax.swing.GroupLayout pnDanhSachLayout = new javax.swing.GroupLayout(pnDanhSach);
        pnDanhSach.setLayout(pnDanhSachLayout);
        pnDanhSachLayout.setHorizontalGroup(
            pnDanhSachLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 562, Short.MAX_VALUE)
        );
        pnDanhSachLayout.setVerticalGroup(
            pnDanhSachLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnDanhSachLayout.createSequentialGroup()
                .addGap(0, 0, 0)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 320, Short.MAX_VALUE)
                .addGap(0, 0, 0))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(pnThongTinPhieuNhap, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(pnChucNang, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGroup(layout.createSequentialGroup()
                .addComponent(pnDanhSach, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(0, 0, 0)
                .addComponent(pnThongTinChiTiet, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(5, 5, 5)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(pnChucNang, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(pnThongTinPhieuNhap, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(7, 7, 7)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(pnDanhSach, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(pnThongTinChiTiet, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnTaoHoaDonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTaoHoaDonActionPerformed
        // TODO add your handling code here:
        if (cbTenKhachHang.getSelectedIndex() <= 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn khách hàng để tạo hóa đơn!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // Lấy thông tin từ form
        String tenKH = cbTenKhachHang.getSelectedItem().toString();
        int maKH = -1;
        for (KhachHang kh : layDuLieu.getDsKhachHang()) {
            if (kh.getTenKhachHang().equals(tenKH)) {
                maKH = kh.getMaKhachHang();
                break;
            }
        }

        Integer maKM = null;
        if (cbTenKhuyenMai.getSelectedIndex() > 0) {
            String tenKM = cbTenKhuyenMai.getSelectedItem().toString();
            for (KhuyenMai km : layDuLieu.getDsKhuyenMai()) {
                if (km.getTenKhuyenMai().equals(tenKM)) {
                    maKM = km.getMaKhuyenMai();
                    break;
                }
            }
        }

        String sql = "INSERT INTO HOADON (MaNhanVienLap, NgayLapHoaDon, TongTienTruocGiam, SoTienGiam, TongTienPhaiTra, TrangThai, MaKhuyenMai, MaKhachHang) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConnectSQL.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, this.maNV);
            ps.setTimestamp(2, new java.sql.Timestamp(new Date().getTime()));
            ps.setLong(3, 0); // Tiền trước giảm ban đầu
            ps.setLong(4, 0); // Tiền giảm ban đầu
            ps.setLong(5, 0); // Tiền phải trả ban đầu
            ps.setString(6, "Chưa thanh toán");
            if (maKM != null) {
                ps.setInt(7, maKM);
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            ps.setInt(8, maKH);

            int result = ps.executeUpdate();
            if (result > 0) {
                JOptionPane.showMessageDialog(this, "Tạo hóa đơn mới thành công!");
                layDuLieu();
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi tạo hóa đơn: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }

    }//GEN-LAST:event_btnTaoHoaDonActionPerformed

    private void btnThanhToanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThanhToanActionPerformed
        // TODO add your handling code here:
        int selectedRow = tbHoaDon.getSelectedRow();
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một hóa đơn để thanh toán!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }

        int maHD = (int) tbHoaDon.getValueAt(selectedRow, 0);
        String trangThai = tbHoaDon.getValueAt(selectedRow, 6).toString();

        if(trangThai.equalsIgnoreCase("Đã thanh toán")) {
            JOptionPane.showMessageDialog(this, "Hóa đơn này đã được thanh toán rồi!", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Xác nhận thanh toán cho hóa đơn mã " + maHD + "?", "Xác nhận", JOptionPane.YES_NO_OPTION);
        if(confirm != JOptionPane.YES_OPTION) {
            return;
        }

        String sql = "UPDATE HOADON SET TrangThai = N'Đã thanh toán' WHERE MaHoaDon = ?";
        try(Connection conn = ConnectSQL.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maHD);
            int result = ps.executeUpdate();
            if(result > 0) {
                JOptionPane.showMessageDialog(this, "Thanh toán thành công!");
                layDuLieu();
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi thanh toán: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }

    }//GEN-LAST:event_btnThanhToanActionPerformed

    private void btnXoaMonAnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaMonAnActionPerformed
        // TODO add your handling code here:
        int selectedRow = tbChiTietHoaDon.getSelectedRow();
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một món ăn trong bảng chi tiết để xóa!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }

        int maHD = (int) tbChiTietHoaDon.getValueAt(selectedRow, 0);
        String tenMonAn = tbChiTietHoaDon.getValueAt(selectedRow, 1).toString();

        int maMonAn = -1;
        for(MonAn mon : layDuLieu.getDsMonAn()){
            if(mon.getTenMon().equals(tenMonAn)){
                maMonAn = mon.getMaMonAn();
                break;
            }
        }

        String sql = "DELETE FROM CHITIETHOADON WHERE MaHoaDon = ? AND MaMonAn = ?";
        try(Connection conn = ConnectSQL.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maHD);
            ps.setInt(2, maMonAn);

            int result = ps.executeUpdate();
            if(result > 0) {
                JOptionPane.showMessageDialog(this, "Xóa món ăn thành công!");
                layDuLieu();
                layChiTiet(maHD);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi xóa món ăn: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }

    }//GEN-LAST:event_btnXoaMonAnActionPerformed

    private void btnThemMonAnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemMonAnActionPerformed
        // TODO add your handling code here:
        if (cbMaHoaDon.getSelectedIndex() <= 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một hóa đơn để thêm món!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }
        if (cbTenMonAn.getSelectedIndex() <= 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một món ăn!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }
        int soLuong = (Integer) txtSoLuong.getValue();
        if (soLuong <= 0) {
            JOptionPane.showMessageDialog(this, "Số lượng phải lớn hơn 0!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return;
        }

        int maHD = Integer.parseInt(cbMaHoaDon.getSelectedItem().toString());

        String tenMon = cbTenMonAn.getSelectedItem().toString();
        int maMonAn = -1;
        for(MonAn mon : layDuLieu.getDsMonAn()){
            if(mon.getTenMon().equals(tenMon)){
                maMonAn = mon.getMaMonAn();
                break;
            }
        }

        String sql = "INSERT INTO CHITIETHOADON (MaHoaDon, MaMonAn, SoLuong) VALUES (?, ?, ?)";
        try(Connection conn = ConnectSQL.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maHD);
            ps.setInt(2, maMonAn);
            ps.setInt(3, soLuong);
            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Thêm món ăn thành công!");
            layDuLieu();
            layChiTiet(maHD);

        } catch (SQLException ex) {
            if (ex.getMessage().contains("PRIMARY KEY")) {
                JOptionPane.showMessageDialog(this, "Món ăn này đã có trong hóa đơn. Vui lòng xóa và thêm lại với số lượng mới.", "Lỗi trùng lặp", JOptionPane.ERROR_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this, "Lỗi khi thêm món ăn: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
            }
        }
    }//GEN-LAST:event_btnThemMonAnActionPerformed

    private void btnSuaHoaDOnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaHoaDOnActionPerformed
        // TODO add your handling code here:
        int selectedRow = tbHoaDon.getSelectedRow();
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một hóa đơn để sửa!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }

        int maHD = (int) tbHoaDon.getValueAt(selectedRow, 0);
        String trangThai = tbHoaDon.getValueAt(selectedRow, 6).toString();

        if (trangThai.equalsIgnoreCase("Đã thanh toán")) {
            JOptionPane.showMessageDialog(this, "Không thể sửa hóa đơn đã thanh toán!", "Thao tác bị chặn", JOptionPane.ERROR_MESSAGE);
            return;
        }

        Integer maKM = null;
        if (cbTenKhuyenMai.getSelectedIndex() > 0) {
            String tenKM = cbTenKhuyenMai.getSelectedItem().toString();
            for (KhuyenMai km : layDuLieu.getDsKhuyenMai()) {
                if (km.getTenKhuyenMai().equals(tenKM)) {
                    maKM = km.getMaKhuyenMai();
                    break;
                }
            }
        }

        String sql = "UPDATE HOADON SET MaKhuyenMai = ? WHERE MaHoaDon = ?";
        try (Connection conn = ConnectSQL.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement psUpdate = conn.prepareStatement(sql)) {
                if (maKM != null) {
                    psUpdate.setInt(1, maKM);
                } else {
                    psUpdate.setNull(1, java.sql.Types.INTEGER); // Gán NULL nếu không chọn khuyến mãi
                }
                psUpdate.setInt(2, maHD);
                psUpdate.executeUpdate();
            }

            String triggerPokeSql = "UPDATE CHITIETHOADON SET MaMonAn = MaMonAn WHERE MaHoaDon = ?";
            try(PreparedStatement psPoke = conn.prepareStatement(triggerPokeSql)) {
                psPoke.setInt(1, maHD);
                psPoke.executeUpdate();
            }

            conn.commit();

            JOptionPane.showMessageDialog(this, "Cập nhật khuyến mãi cho hóa đơn thành công!");
            layDuLieu();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi sửa hóa đơn: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnSuaHoaDOnActionPerformed

    private void btnLamMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLamMoiActionPerformed
        // TODO add your handling code here:
        layDuLieu();
    }//GEN-LAST:event_btnLamMoiActionPerformed

    private void cbTenKhachHangActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbTenKhachHangActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cbTenKhachHangActionPerformed

    private void cbTenKhuyenMaiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbTenKhuyenMaiActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cbTenKhuyenMaiActionPerformed

    private void tbHoaDonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tbHoaDonMouseClicked
        // TODO add your handling code here:
        selected = tbHoaDon.getSelectedRow();
        if(selected >= 0){
            int maHD = Integer.parseInt(tbHoaDon.getValueAt(selected, 0).toString());
            cbMaHoaDon.setSelectedItem(String.valueOf(maHD));
            layChiTiet(maHD);
        }
    }//GEN-LAST:event_tbHoaDonMouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnLamMoi;
    private javax.swing.JButton btnSuaHoaDOn;
    private javax.swing.JButton btnTaoHoaDon;
    private javax.swing.JButton btnThanhToan;
    private javax.swing.JButton btnThemMonAn;
    private javax.swing.JButton btnXoaMonAn;
    private javax.swing.JComboBox<String> cbMaHoaDon;
    private javax.swing.JComboBox<String> cbTenKhachHang;
    private javax.swing.JComboBox<String> cbTenKhuyenMai;
    private javax.swing.JComboBox<String> cbTenMonAn;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTable jTable2;
    private javax.swing.JPanel pnChucNang;
    private javax.swing.JPanel pnDanhSach;
    private javax.swing.JPanel pnThongTinChiTiet;
    private javax.swing.JPanel pnThongTinPhieuNhap;
    private javax.swing.JTable tbChiTietHoaDon;
    private javax.swing.JTable tbHoaDon;
    private javax.swing.JSpinner txtSoLuong;
    // End of variables declaration//GEN-END:variables
}
