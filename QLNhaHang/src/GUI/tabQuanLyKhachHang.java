/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package GUI;

import CRUD.ConnectSQL;
import CRUD.layDuLieuSQL;
import Object.KhachHang;
import com.formdev.flatlaf.extras.FlatSVGIcon;
import java.awt.Color;
import java.sql.CallableStatement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author HoCanhQuy
 */
public class tabQuanLyKhachHang extends javax.swing.JPanel {

    DefaultTableModel tableModel;
    layDuLieuSQL layDuLieu = new layDuLieuSQL();
    int selected = -1;
    public tabQuanLyKhachHang() {
        initComponents();
        layDuLieu();
        tbHienThiKhachHang.setShowGrid(true);
        tbHienThiKhachHang.setGridColor(new Color(224, 224, 224));
        FlatSVGIcon iconDel = new FlatSVGIcon("Images/delete.svg", 25, 25);
        btnXoa.setIcon(iconDel);
        FlatSVGIcon iconChange = new FlatSVGIcon("Images/edit.svg", 25, 25);
        btnSua.setIcon(iconChange);
        FlatSVGIcon iconnew = new FlatSVGIcon("Images/refresh.svg", 25, 25);
        btnLamMoi.setIcon(iconnew);
        FlatSVGIcon iconadd = new FlatSVGIcon("Images/add.svg", 25, 25);
        btnThem.setIcon(iconadd);
    }
    private boolean kiemTraDuLieu() {
    String tenKH = txtTenKhachHang.getText().trim();
    String sdt = txtSoDienThoai.getText().trim();

    if (tenKH.isEmpty()) {
        JOptionPane.showMessageDialog(this, "Tên khách hàng không được để trống!", "Lỗi", JOptionPane.ERROR_MESSAGE);
        return false;
    }
    
    if (!sdt.isEmpty()) {
        if (!sdt.matches("^0\\d{9}$")) {
            JOptionPane.showMessageDialog(this, "Số điện thoại không hợp lệ! Phải có 10 chữ số và bắt đầu bằng 0.", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }
    
    return true;
}
    public void layDuLieu(){
        tableModel = new DefaultTableModel(){
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; 
            }
        };
        tableModel.addColumn("Mã khách hàng");
        tableModel.addColumn("Tên khách hàng");
        tableModel.addColumn("Số điện thoại");
        tableModel.addColumn("Địa chỉ");
        for(KhachHang kh: layDuLieu.getDsKhachHang()){
            tableModel.addRow(new Object[]{
                kh.getMaKhachHang(),
                kh.getTenKhachHang(),
                kh.getSoDienThoai(),
                kh.getDiaChi()
            });
        }
        tbHienThiKhachHang.setModel(tableModel);
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtTenKhachHang = new javax.swing.JTextField();
        txtSoDienThoai = new javax.swing.JTextField();
        txtDiaChi = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tbHienThiKhachHang = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        btnThem = new javax.swing.JButton();
        btnSua = new javax.swing.JButton();
        btnXoa = new javax.swing.JButton();
        btnLamMoi = new javax.swing.JButton();

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông tin khách hàng", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        jLabel1.setText("Tên khách hàng:");

        jLabel2.setText("Số điện thoại:");

        jLabel3.setText("Địa chỉ:");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(30, 30, 30)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txtSoDienThoai)
                    .addComponent(txtTenKhachHang)
                    .addComponent(txtDiaChi))
                .addGap(60, 60, 60))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtTenKhachHang, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtSoDienThoai, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtDiaChi, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        tbHienThiKhachHang.setModel(new javax.swing.table.DefaultTableModel(
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
        tbHienThiKhachHang.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tbHienThiKhachHangMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tbHienThiKhachHang);

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Chức năng", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 14))); // NOI18N

        btnThem.setBackground(new java.awt.Color(51, 204, 255));
        btnThem.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnThem.setText("Thêm khách hàng");
        btnThem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemActionPerformed(evt);
            }
        });

        btnSua.setBackground(new java.awt.Color(51, 204, 255));
        btnSua.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnSua.setText("Sửa thông tin");
        btnSua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaActionPerformed(evt);
            }
        });

        btnXoa.setBackground(new java.awt.Color(51, 204, 255));
        btnXoa.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnXoa.setText("Xoá khách hàng");
        btnXoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaActionPerformed(evt);
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

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnThem, javax.swing.GroupLayout.DEFAULT_SIZE, 150, Short.MAX_VALUE)
                    .addComponent(btnSua, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(40, 40, 40)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnXoa, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnLamMoi, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnXoa)
                    .addComponent(btnThem))
                .addGap(30, 30, 30)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnSua, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnLamMoi, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(20, 20, 20))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 978, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 318, Short.MAX_VALUE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void tbHienThiKhachHangMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tbHienThiKhachHangMouseClicked
        // TODO add your handling code here:
        selected = tbHienThiKhachHang.getSelectedRow();
        if(selected >= 0){
            txtTenKhachHang.setText(tbHienThiKhachHang.getValueAt(selected, 1).toString());
            txtSoDienThoai.setText(tbHienThiKhachHang.getValueAt(selected, 2).toString());
            txtDiaChi.setText(tbHienThiKhachHang.getValueAt(selected, 3).toString());
        }
    }//GEN-LAST:event_tbHienThiKhachHangMouseClicked

    private void btnThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemActionPerformed
        // TODO add your handling code here:
        if (!kiemTraDuLieu()) {
            return;
        }

        String tenKH = txtTenKhachHang.getText().trim();
        String sdt = txtSoDienThoai.getText().trim();
        String diaChi = txtDiaChi.getText().trim();
        
        
        String sql = "{call sp_ThemKhachHang(?, ?, ?)}"; 
        try (Connection conn = CRUD.ConnectSQL.getConnection(); 
             CallableStatement cs = conn.prepareCall(sql)) {

            cs.setString(1, tenKH);
            if (sdt.isEmpty()) {
                cs.setNull(2, java.sql.Types.CHAR);
            } else {
                cs.setString(2, sdt);
            }

            cs.setString(3, diaChi);

            cs.execute();
            JOptionPane.showMessageDialog(this, "Thêm khách hàng thành công!");
            layDuLieu();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi thêm khách hàng: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
//        String sql = "INSERT INTO KHACHHANG (TenKhachHang, SoDienThoai, DiaChi) VALUES (?, ?, ?)";
//
//        try (Connection conn = ConnectSQL.getConnection();
//            PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setString(1, tenKH);
//
//            if (sdt.isEmpty()) {
//                ps.setNull(2, java.sql.Types.CHAR);
//            } else {
//                ps.setString(2, sdt);
//            }
//
//            ps.setString(3, diaChi);
//
//            int result = ps.executeUpdate();
//            if (result > 0) {
//                JOptionPane.showMessageDialog(this, "Thêm khách hàng thành công!");
//                layDuLieu(); 
//            }
//        } catch (SQLException ex) {
//            if (ex.getMessage().contains("UNIQUE KEY")) {
//                JOptionPane.showMessageDialog(this, "Số điện thoại này đã tồn tại!", "Lỗi Trùng lặp", JOptionPane.ERROR_MESSAGE);
//            } else {
//                JOptionPane.showMessageDialog(this, "Lỗi khi thêm khách hàng: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
//            }
//        }
    }//GEN-LAST:event_btnThemActionPerformed

    private void btnSuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaActionPerformed
        // TODO add your handling code here:
        int selectedRow = tbHienThiKhachHang.getSelectedRow();
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một khách hàng để sửa!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }

        if (!kiemTraDuLieu()) {
            return;
        }

        int maKH = (int) tbHienThiKhachHang.getValueAt(selectedRow, 0);
        String tenKH = txtTenKhachHang.getText().trim();
        String sdt = txtSoDienThoai.getText().trim();
        String diaChi = txtDiaChi.getText().trim();
        
        String sql = "{call sp_SuaKhachHang(?, ?, ?, ?)}"; 
        try (Connection conn = CRUD.ConnectSQL.getConnection(); 
             CallableStatement cs = conn.prepareCall(sql)) {

            cs.setString(1, tenKH);
            if (sdt.isEmpty()) {
                cs.setNull(2, java.sql.Types.CHAR);
            } else {
                cs.setString(2, sdt);
            }
            cs.setString(3, diaChi);
            cs.setInt(4, maKH);

            cs.execute();
            JOptionPane.showMessageDialog(this, "Cập nhật khách hàng thành công!");
            layDuLieu();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi cập nhật khách hàng: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }
//        String sql = "UPDATE KHACHHANG SET TenKhachHang = ?, SoDienThoai = ?, DiaChi = ? WHERE MaKhachHang = ?";
//
//        try (Connection conn = ConnectSQL.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setString(1, tenKH);
//            if (sdt.isEmpty()) {
//                ps.setNull(2, java.sql.Types.CHAR);
//            } else {
//                ps.setString(2, sdt);
//            }
//            ps.setString(3, diaChi);
//            ps.setInt(4, maKH);
//
//            int result = ps.executeUpdate();
//            if (result > 0) {
//                JOptionPane.showMessageDialog(this, "Cập nhật khách hàng thành công!");
//                layDuLieu();
//            }
//        } catch (SQLException ex) {
//            if (ex.getMessage().contains("UNIQUE KEY")) {
//                JOptionPane.showMessageDialog(this, "Số điện thoại này đã tồn tại ở một khách hàng khác!", "Lỗi Trùng lặp", JOptionPane.ERROR_MESSAGE);
//            } else {
//                JOptionPane.showMessageDialog(this, "Lỗi khi cập nhật khách hàng: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
//            }
//        }
    }//GEN-LAST:event_btnSuaActionPerformed

    private void btnXoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaActionPerformed
        // TODO add your handling code here:
        int selectedRow = tbHienThiKhachHang.getSelectedRow();
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một khách hàng để xóa!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Bạn có chắc chắn muốn xóa khách hàng này?", "Xác nhận xóa", JOptionPane.YES_NO_OPTION);
        if (confirm != JOptionPane.YES_OPTION) {
            return;
        }

        int maKH = (int) tbHienThiKhachHang.getValueAt(selectedRow, 0);
        
        String sql = "{call sp_XoaKhachHang(?)}"; 
        try (Connection conn = CRUD.ConnectSQL.getConnection(); 
             CallableStatement cs = conn.prepareCall(sql)) {

            cs.setInt(1, maKH);

            cs.execute();
            JOptionPane.showMessageDialog(this, "Xóa khách hàng thành công!");
            layDuLieu();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Lỗi khi xóa khách hàng: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
        }
//        try (Connection conn = ConnectSQL.getConnection()) {
//            String[] tablesToCheck = {"HOADON", "DANHGIA", "CHITIETDATBAN"};
//            for (String table : tablesToCheck) {
//                String checkSql = "SELECT COUNT(*) FROM " + table + " WHERE MaKhachHang = ?";
//                try (PreparedStatement psCheck = conn.prepareStatement(checkSql)) {
//                    psCheck.setInt(1, maKH);
//                    ResultSet rs = psCheck.executeQuery();
//                    if (rs.next() && rs.getInt(1) > 0) {
//                        JOptionPane.showMessageDialog(this, "Không thể xóa! Khách hàng này đã có dữ liệu liên quan trong bảng " + table + ".", "Xóa bị chặn", JOptionPane.ERROR_MESSAGE);
//                        return;
//                    }
//                }
//            }
//
//            String deleteSql = "DELETE FROM KHACHHANG WHERE MaKhachHang = ?";
//            try (PreparedStatement psDelete = conn.prepareStatement(deleteSql)) {
//                psDelete.setInt(1, maKH);
//                int result = psDelete.executeUpdate();
//                if (result > 0) {
//                    JOptionPane.showMessageDialog(this, "Xóa khách hàng thành công!");
//                    layDuLieu();
//                }
//            }
//
//        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(this, "Lỗi khi xóa khách hàng: " + ex.getMessage(), "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
//        }
    }//GEN-LAST:event_btnXoaActionPerformed

    private void btnLamMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLamMoiActionPerformed
        // TODO add your handling code here:
        txtTenKhachHang.setText("");
        txtSoDienThoai.setText("");
        txtDiaChi.setText("");
        layDuLieu();
    }//GEN-LAST:event_btnLamMoiActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnLamMoi;
    private javax.swing.JButton btnSua;
    private javax.swing.JButton btnThem;
    private javax.swing.JButton btnXoa;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tbHienThiKhachHang;
    private javax.swing.JTextField txtDiaChi;
    private javax.swing.JTextField txtSoDienThoai;
    private javax.swing.JTextField txtTenKhachHang;
    // End of variables declaration//GEN-END:variables
}
