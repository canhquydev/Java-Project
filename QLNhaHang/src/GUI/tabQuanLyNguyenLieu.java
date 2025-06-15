/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package GUI;

import CRUD.ConnectSQL;
import CRUD.layDuLieuSQL;
import Object.NguyenLieu;
import com.formdev.flatlaf.extras.FlatSVGIcon;
import java.awt.Color;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author HoCanhQuy
 */
public class tabQuanLyNguyenLieu extends javax.swing.JPanel {
    DefaultTableModel model;
    int selectedRow = -1;
    layDuLieuSQL layDuLieu = new layDuLieuSQL();
    public tabQuanLyNguyenLieu() {
        initComponents();
        layDuLieu();
        FlatSVGIcon iconAdd = new FlatSVGIcon("Images/add.svg", 25, 25);
        btnThemNL.setIcon(iconAdd);
        FlatSVGIcon iconDel = new FlatSVGIcon("Images/delete.svg", 25, 25);
        btnXoaNL.setIcon(iconDel);
        FlatSVGIcon iconChange = new FlatSVGIcon("Images/edit.svg", 25, 25);
        btnSuaNL.setIcon(iconChange);
        FlatSVGIcon iconRefresh = new FlatSVGIcon("Images/refresh.svg", 25, 25);
        btnLamMoi.setIcon(iconRefresh);
        tbHienThiNguyenLieu.setShowGrid(true);
        tbHienThiNguyenLieu.setGridColor(new Color(224, 224, 224));
    }

    public void layDuLieu(){
        model = new DefaultTableModel(){
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; 
            }
        };
        model.addColumn("Mã nguyên liệu");
        model.addColumn("Tên nguyên liệu");
        model.addColumn("Loại");
        model.addColumn("Ngày sản xuất");
        model.addColumn("Hạn sử dụng");
        model.addColumn("Giá bán");
        model.addColumn("Đơn vị tính");
        model.addColumn("Số lượng tồn");
        Set<String> set = new HashSet<>();
        Set<String> set1 = new HashSet<>();
        for(NguyenLieu nl : layDuLieu.getDsNguyenLieu()){
            set.add(nl.getLoai());
            set1.add(nl.getDonViTinh());
            model.addRow(new Object[]{
                nl.getMaNguyenLieu(),
                nl.getTenNguyenLieu(),
                nl.getLoai(),
                nl.getNgaySanXuat(),
                nl.getHanSuDung(),
                nl.getGiaBan(),
                nl.getDonViTinh(),
                nl.getSoLuongTon()
            });
        }
        tbHienThiNguyenLieu.setModel(model);
        cbLoai.removeAllItems();
        cbLoai.addItem("Chọn loại");
        for(String s: set){
            cbLoai.addItem(s);
        }
        cbDonViTinh.removeAllItems();
        cbDonViTinh.addItem("Chọn đơn vị tính");
        for(String s: set1){
            cbDonViTinh.addItem(s);
        }
    }
    
    private boolean kiemTraDuLieu() {
        if (txtTenNguyenLieu.getText().trim().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Tên nguyên liệu không được để trống!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (cbLoai.getSelectedIndex() <= 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn loại nguyên liệu!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (txtNgaySX.getDate() == null) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn ngày sản xuất!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (txtHSD.getDate() == null) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn hạn sử dụng!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (txtNgaySX.getDate().after(txtHSD.getDate())) {
            JOptionPane.showMessageDialog(this, "Ngày sản xuất không thể sau hạn sử dụng!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (txtGiaBan.getText().trim().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Giá bán không được để trống!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        try {
            long giaBan = Long.parseLong(txtGiaBan.getText().trim());
            if (giaBan < 0) {
                JOptionPane.showMessageDialog(this, "Giá bán không được âm!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return false;
            }
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "Giá bán phải là một con số!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (cbDonViTinh.getSelectedIndex() <= 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn đơn vị tính!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (txtSoLuongTon.getText().trim().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Số lượng tồn không được để trống!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        try {
            int soLuong = Integer.parseInt(txtSoLuongTon.getText().trim());
             if (soLuong < 0) {
                JOptionPane.showMessageDialog(this, "Số lượng tồn không được âm!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return false;
            }
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "Số lượng tồn phải là một số nguyên!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        return true;
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnThongTinNhanVien = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txtTenNguyenLieu = new javax.swing.JTextField();
        txtGiaBan = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        cbLoai = new javax.swing.JComboBox<>();
        cbDonViTinh = new javax.swing.JComboBox<>();
        txtNgaySX = new com.toedter.calendar.JDateChooser();
        txtHSD = new com.toedter.calendar.JDateChooser();
        txtSoLuongTon = new javax.swing.JTextField();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tbHienThiNguyenLieu = new javax.swing.JTable();
        pnChucNang = new javax.swing.JPanel();
        btnThemNL = new javax.swing.JButton();
        btnXoaNL = new javax.swing.JButton();
        btnSuaNL = new javax.swing.JButton();
        btnLamMoi = new javax.swing.JButton();

        pnThongTinNhanVien.setBackground(new java.awt.Color(255, 255, 255));
        pnThongTinNhanVien.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông tin nguyên liệu", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        jLabel3.setText("Loại:");

        jLabel4.setText("Đơn vị tính:");

        jLabel5.setText("Tên nguyên liệu:");

        jLabel6.setText("Giá bán:");

        jLabel7.setText("Số lượng tồn:");

        jLabel8.setText("Ngày sản xuất:");

        jLabel9.setText("Hạn sử dụng:");

        cbLoai.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        cbDonViTinh.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        txtNgaySX.setDateFormatString("y-MM-dd");

        txtHSD.setDateFormatString("y-MM-dd");

        javax.swing.GroupLayout pnThongTinNhanVienLayout = new javax.swing.GroupLayout(pnThongTinNhanVien);
        pnThongTinNhanVien.setLayout(pnThongTinNhanVienLayout);
        pnThongTinNhanVienLayout.setHorizontalGroup(
            pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnThongTinNhanVienLayout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, 89, Short.MAX_VALUE)
                    .addComponent(jLabel8)
                    .addComponent(jLabel9))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtHSD, javax.swing.GroupLayout.PREFERRED_SIZE, 206, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtNgaySX, javax.swing.GroupLayout.DEFAULT_SIZE, 209, Short.MAX_VALUE)
                    .addComponent(cbLoai, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtTenNguyenLieu))
                .addGap(18, 18, 18)
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel7)
                    .addComponent(jLabel4)
                    .addComponent(jLabel6))
                .addGap(12, 12, 12)
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtGiaBan, javax.swing.GroupLayout.DEFAULT_SIZE, 172, Short.MAX_VALUE)
                    .addComponent(cbDonViTinh, 0, 172, Short.MAX_VALUE)
                    .addComponent(txtSoLuongTon, javax.swing.GroupLayout.DEFAULT_SIZE, 172, Short.MAX_VALUE))
                .addContainerGap())
        );
        pnThongTinNhanVienLayout.setVerticalGroup(
            pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnThongTinNhanVienLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtTenNguyenLieu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6)
                    .addComponent(txtGiaBan, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(6, 6, 6)
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel3)
                    .addComponent(cbLoai, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cbDonViTinh, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel8)
                        .addComponent(jLabel7)
                        .addComponent(txtSoLuongTon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(txtNgaySX, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pnThongTinNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txtHSD, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9))
                .addContainerGap())
        );

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Danh Sách Nguyên Liệu", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        tbHienThiNguyenLieu.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4", "Title 5", "Title 6", "Title 7", "Title 8", "Title 9"
            }
        ));
        tbHienThiNguyenLieu.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tbHienThiNguyenLieuMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tbHienThiNguyenLieu);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 996, Short.MAX_VALUE)
            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 930, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 317, Short.MAX_VALUE)
            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 317, Short.MAX_VALUE))
        );

        pnChucNang.setBackground(new java.awt.Color(255, 255, 255));
        pnChucNang.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Các thao tác", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        btnThemNL.setBackground(new java.awt.Color(51, 204, 255));
        btnThemNL.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnThemNL.setText("Thêm nguyên liệu");
        btnThemNL.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemNLActionPerformed(evt);
            }
        });

        btnXoaNL.setBackground(new java.awt.Color(51, 204, 255));
        btnXoaNL.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnXoaNL.setText("Xóa nguyên liệu");
        btnXoaNL.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaNLActionPerformed(evt);
            }
        });

        btnSuaNL.setBackground(new java.awt.Color(51, 204, 255));
        btnSuaNL.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnSuaNL.setText("Sửa nguyên liệu");
        btnSuaNL.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaNLActionPerformed(evt);
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
                .addGap(30, 30, 30)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnThemNL, javax.swing.GroupLayout.DEFAULT_SIZE, 154, Short.MAX_VALUE)
                    .addComponent(btnXoaNL, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnSuaNL, javax.swing.GroupLayout.DEFAULT_SIZE, 154, Short.MAX_VALUE)
                    .addComponent(btnLamMoi, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(30, 30, 30))
        );
        pnChucNangLayout.setVerticalGroup(
            pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pnChucNangLayout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnThemNL)
                    .addComponent(btnSuaNL))
                .addGap(18, 30, Short.MAX_VALUE)
                .addGroup(pnChucNangLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnXoaNL)
                    .addComponent(btnLamMoi))
                .addGap(25, 25, 25))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(pnThongTinNhanVien, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10, 10, 10)
                .addComponent(pnChucNang, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(0, 0, 0)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(pnChucNang, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(pnThongTinNhanVien, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(27, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void tbHienThiNguyenLieuMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tbHienThiNguyenLieuMouseClicked
        // TODO add your handling code here:
        selectedRow = tbHienThiNguyenLieu.getSelectedRow();
        if(selectedRow >= 0){
            txtTenNguyenLieu.setText(tbHienThiNguyenLieu.getValueAt(selectedRow, 1).toString());
            cbLoai.setSelectedItem(tbHienThiNguyenLieu.getValueAt(selectedRow, 2).toString().trim());
            Date ngaySX = Date.valueOf(tbHienThiNguyenLieu.getValueAt(selectedRow, 3).toString());
            txtNgaySX.setDate(ngaySX);
            Date hanSD = Date.valueOf(tbHienThiNguyenLieu.getValueAt(selectedRow, 4).toString());
            txtHSD.setDate(hanSD);
            txtGiaBan.setText(tbHienThiNguyenLieu.getValueAt(selectedRow, 5).toString());
            cbDonViTinh.setSelectedItem(tbHienThiNguyenLieu.getValueAt(selectedRow, 6).toString());
            txtSoLuongTon.setText(tbHienThiNguyenLieu.getValueAt(selectedRow, 7).toString());
        }
    }//GEN-LAST:event_tbHienThiNguyenLieuMouseClicked

    private void btnXoaNLActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaNLActionPerformed
        // TODO add your handling code here:
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một nguyên liệu để xóa!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Bạn có chắc chắn muốn xóa nguyên liệu này?", "Xác nhận xóa", JOptionPane.YES_NO_OPTION);
        if (confirm != JOptionPane.YES_OPTION) {
            return;
        }

        int maNL = (int) tbHienThiNguyenLieu.getValueAt(selectedRow, 0);

        try (Connection conn = ConnectSQL.getConnection()) {
            // Kiểm tra khóa ngoại trong các bảng liên quan
            String[] tablesToCheck = {"CHITIETNHAPHANG", "NGUYENLIEU_MONAN"};
            for (String table : tablesToCheck) {
                String checkSql = "SELECT COUNT(*) FROM " + table + " WHERE MaNguyenLieu = ?";
                try (PreparedStatement psCheck = conn.prepareStatement(checkSql)) {
                    psCheck.setInt(1, maNL);
                    ResultSet rs = psCheck.executeQuery();
                    if (rs.next() && rs.getInt(1) > 0) {
                        JOptionPane.showMessageDialog(this, "Không thể xóa! Nguyên liệu này đang được sử dụng trong bảng " + table + ".", "Xóa bị chặn", JOptionPane.ERROR_MESSAGE);
                        return; // Dừng việc xóa
                    }
                }
            }

            // Nếu không có ràng buộc, tiến hành xóa
            String deleteSql = "DELETE FROM NGUYENLIEU WHERE MaNguyenLieu = ?";
            try (PreparedStatement psDelete = conn.prepareStatement(deleteSql)) {
                psDelete.setInt(1, maNL);
                int result = psDelete.executeUpdate();
                if (result > 0) {
                    JOptionPane.showMessageDialog(this, "Xóa nguyên liệu thành công!");
                    layDuLieu();
                }
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi xóa nguyên liệu: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnXoaNLActionPerformed

    private void btnSuaNLActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaNLActionPerformed
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một nguyên liệu để sửa!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }
        if (!kiemTraDuLieu()) {
            return;
        }

        // Lấy dữ liệu từ form
        int maNL = (int) tbHienThiNguyenLieu.getValueAt(selectedRow, 0);
        String tenNL = txtTenNguyenLieu.getText().trim();
        String loai = cbLoai.getSelectedItem().toString();
        Date ngaySX = new Date(txtNgaySX.getDate().getTime());
        Date hsd = new Date(txtHSD.getDate().getTime());
        long giaBan = Long.parseLong(txtGiaBan.getText().trim());
        String donViTinh = cbDonViTinh.getSelectedItem().toString();
        int soLuongTon = Integer.parseInt(txtSoLuongTon.getText().trim());

        String sql = "UPDATE NGUYENLIEU SET TenNguyenLieu = ?, Loai = ?, NgaySanXuat = ?, HanSuDung = ?, GiaBan = ?, DonViTinh = ?, SoLuongTon = ? WHERE MaNguyenLieu = ?";

        try (Connection conn = ConnectSQL.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tenNL);
            ps.setString(2, loai);
            ps.setDate(3, ngaySX);
            ps.setDate(4, hsd);
            ps.setLong(5, giaBan);
            ps.setString(6, donViTinh);
            ps.setInt(7, soLuongTon);
            ps.setInt(8, maNL);

            int result = ps.executeUpdate();
            if (result > 0) {
                JOptionPane.showMessageDialog(this, "Cập nhật nguyên liệu thành công!");
                layDuLieu();
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi cập nhật nguyên liệu: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnSuaNLActionPerformed

    private void btnLamMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLamMoiActionPerformed
        // TODO add your handling code here:
        txtTenNguyenLieu.setText("");
        cbLoai.setSelectedIndex(0);
        txtNgaySX.setDate(null);
        txtHSD.setDate(null);
        txtGiaBan.setText("");
        cbDonViTinh.setSelectedIndex(0);
        txtSoLuongTon.setText("");
        layDuLieu();
    }//GEN-LAST:event_btnLamMoiActionPerformed

    private void btnThemNLActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemNLActionPerformed
        // TODO add your handling code here:
        if (!kiemTraDuLieu()) {
            return;
        }

        // Lấy dữ liệu từ form
        String tenNL = txtTenNguyenLieu.getText().trim();
        String loai = cbLoai.getSelectedItem().toString();
        Date ngaySX = new Date(txtNgaySX.getDate().getTime());
        Date hsd = new Date(txtHSD.getDate().getTime());
        long giaBan = Long.parseLong(txtGiaBan.getText().trim());
        String donViTinh = cbDonViTinh.getSelectedItem().toString();
        int soLuongTon = Integer.parseInt(txtSoLuongTon.getText().trim());

        String sql = "INSERT INTO NGUYENLIEU (TenNguyenLieu, Loai, NgaySanXuat, HanSuDung, GiaBan, DonViTinh, SoLuongTon) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConnectSQL.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tenNL);
            ps.setString(2, loai);
            ps.setDate(3, ngaySX);
            ps.setDate(4, hsd);
            ps.setLong(5, giaBan);
            ps.setString(6, donViTinh);
            ps.setInt(7, soLuongTon);

            int result = ps.executeUpdate();
            if (result > 0) {
                JOptionPane.showMessageDialog(this, "Thêm nguyên liệu thành công!");
                layDuLieu(); // Tải lại bảng
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi thêm nguyên liệu: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnThemNLActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnLamMoi;
    private javax.swing.JButton btnSuaNL;
    private javax.swing.JButton btnThemNL;
    private javax.swing.JButton btnXoaNL;
    private javax.swing.JComboBox<String> cbDonViTinh;
    private javax.swing.JComboBox<String> cbLoai;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPanel pnChucNang;
    private javax.swing.JPanel pnThongTinNhanVien;
    private javax.swing.JTable tbHienThiNguyenLieu;
    private javax.swing.JTextField txtGiaBan;
    private com.toedter.calendar.JDateChooser txtHSD;
    private com.toedter.calendar.JDateChooser txtNgaySX;
    private javax.swing.JTextField txtSoLuongTon;
    private javax.swing.JTextField txtTenNguyenLieu;
    // End of variables declaration//GEN-END:variables
}
