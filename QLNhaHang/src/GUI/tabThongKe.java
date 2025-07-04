/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package GUI;
import com.formdev.flatlaf.extras.FlatSVGIcon;
import java.awt.BasicStroke;
import java.awt.Color;
import java.sql.Connection;
import java.util.*;
import javax.swing.*;
import javax.swing.table.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
/**
 *
 * @author HoCanhQuy
 */
public class tabThongKe extends javax.swing.JPanel {

    DefaultTableModel model;
    int selectedRow = -1;
    String[] listDate = {"Ngày","Tháng","Năm"};
    public tabThongKe() {
        initComponents();
        layDuLieu();
        tableThongKe.setShowGrid(true);
        tableThongKe.setGridColor(new Color(224, 224, 224));
        cbDate.removeAllItems();
        for(String date:listDate){
            cbDate.addItem(date);
        }
        FlatSVGIcon iconView = new FlatSVGIcon("Images/viewtable.svg", 30, 30);
        btnTableDisplay.setIcon(iconView);
        FlatSVGIcon iconTK = new FlatSVGIcon("Images/thongke.svg", 25, 25);
        btnChartDisplay.setIcon(iconTK);
    }
    
    public void layDuLieu(){
        model = new DefaultTableModel();
        model.addColumn("Mã phiếu");
        model.addColumn("Ngày thống kê");
        model.addColumn("Doanh thu");
        model.addColumn("Thu");
        model.addColumn("Chi");
         try (Connection conn = CRUD.ConnectSQL.getConnection()) {
            String sql = "select * from PHIEUTHONGKE";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                long doanhThu = (long)rs.getDouble("DoanhThu");
                long thu = (long) rs.getDouble("Thu");
                long chi = (long) rs.getDouble("Chi");
                model.addRow(new Object[]{
                    rs.getInt("MaPhieu"),
                    rs.getDate("NgayThongKe"),
                    doanhThu,
                    thu,
                    chi
                });
            }
            tableThongKe.setModel(model);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this, "Lỗi khi lấy dữ liệu: " + e.getMessage());
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

        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        cbDate = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        dateStart = new com.toedter.calendar.JDateChooser();
        dateEnd = new com.toedter.calendar.JDateChooser();
        jPanel2 = new javax.swing.JPanel();
        btnTableDisplay = new javax.swing.JButton();
        btnChartDisplay = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tableThongKe = new javax.swing.JTable();

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Thống kê"));

        jLabel2.setText("Chu kỳ: ");

        cbDate.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Ngày", "Tháng", "Năm" }));

        jLabel3.setText("Ngày bắt đầu thống kê:");

        jLabel4.setText("Ngày kết thúc thống kê:");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(24, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel4)
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jLabel3)
                        .addComponent(jLabel2)))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(cbDate, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(dateStart, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(dateEnd, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(21, 21, 21))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(6, 6, 6)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(cbDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(dateStart, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(dateEnd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Thao Tác"));

        btnTableDisplay.setBackground(new java.awt.Color(51, 204, 255));
        btnTableDisplay.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnTableDisplay.setText("Thống kê vào bảng");
        btnTableDisplay.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTableDisplayActionPerformed(evt);
            }
        });

        btnChartDisplay.setBackground(new java.awt.Color(51, 204, 255));
        btnChartDisplay.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnChartDisplay.setText("Hiển thị biểu đồ");
        btnChartDisplay.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnChartDisplayActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(72, 72, 72)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnTableDisplay, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnChartDisplay, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(81, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnTableDisplay)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnChartDisplay)
                .addGap(16, 16, 16))
        );

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Danh sách phiếu thống kê", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Segoe UI", 3, 18))); // NOI18N

        tableThongKe.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Mã phiếu", "Ngày thống kê", "Doanh thu", "Thu", "Chi"
            }
        ));
        jScrollPane1.setViewportView(tableThongKe);

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 352, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 163, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(33, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnTableDisplayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTableDisplayActionPerformed
        // TODO add your handling code here:
        String selected = cbDate.getSelectedItem().toString();
        Date startDate = dateStart.getDate();
        Date endDate = dateEnd.getDate();

        if (startDate == null || endDate == null) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn đầy đủ thông tin!");
            return;
        }
        model = new DefaultTableModel(){
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; 
            }
        };
        model.addColumn("Thời gian");
        model.addColumn("Doanh thu");
        model.addColumn("Thu");
        model.addColumn("Chi");

        String sql = "";
        switch (selected){
            case "Ngày" -> sql = "select *from fn_ThongKeDoanhThuTheoNgay(?, ?)";
            case "Tháng" -> sql = "select *from fn_ThongKeDoanhThuTheoThang(?, ?)";
            case "Năm" -> sql = "select *from fn_ThongKeDoanhThuTheoNam(?, ?)";
        }
        try (Connection conn = CRUD.ConnectSQL.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, new java.sql.Date(startDate.getTime()));
            stmt.setDate(2, new java.sql.Date(endDate.getTime()));

            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                long doanhThu = (long) rs.getDouble("DoanhThu");
                long thu = (long) rs.getDouble("Thu");
                long chi = (long) rs.getDouble("Chi");
                model.addRow(new Object[]{
                    rs.getString("ThoiGian"),
                    doanhThu,
                    thu,
                    chi,
                });
            }
            tableThongKe.setModel(model);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this, "Lỗi thống kê: " + e.getMessage());
        }
    }//GEN-LAST:event_btnTableDisplayActionPerformed

    private void btnChartDisplayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnChartDisplayActionPerformed
        // TODO add your handling code here:
        String selected = cbDate.getSelectedItem().toString();
        Date startDate = dateStart.getDate();
        Date endDate = dateEnd.getDate();

        if (startDate == null || endDate == null) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn đầy đủ thông tin!");
            return;
        }
        model = new DefaultTableModel();
        model.addColumn("Thời gian");
        model.addColumn("Doanh thu");
        model.addColumn("Thu");
        model.addColumn("Chi");

        String sql = "";
        switch (selected){
            case "Ngày" -> sql = "select *from fn_ThongKeDoanhThuTheoNgay(?, ?)";
            case "Tháng" -> sql = "select *from fn_ThongKeDoanhThuTheoThang(?, ?)";
            case "Năm" -> sql = "select *from fn_ThongKeDoanhThuTheoNam(?, ?)";
        }
        try (Connection conn = CRUD.ConnectSQL.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, new java.sql.Date(startDate.getTime()));
            stmt.setDate(2, new java.sql.Date(endDate.getTime()));

            ResultSet rs = stmt.executeQuery();
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();

            while (rs.next()) {
                String time = rs.getString("ThoiGian");
                double doanhThu = rs.getDouble("DoanhThu");
                double thu = rs.getDouble("Thu");
                double chi = rs.getDouble("Chi");

                dataset.addValue(doanhThu, "Doanh thu", time);
                dataset.addValue(thu, "Thu", time);
                dataset.addValue(chi, "Chi", time);
            }

            JFreeChart chart = ChartFactory.createLineChart(
                "Thống kê doanh thu", "Thời gian", "Số tiền",
                dataset, PlotOrientation.VERTICAL, true, true, false
            );
            CategoryPlot plot = chart.getCategoryPlot();
            LineAndShapeRenderer renderer = new LineAndShapeRenderer();

            renderer.setSeriesPaint(0, Color.RED);
            renderer.setSeriesPaint(1, Color.BLUE);
            renderer.setSeriesPaint(2, Color.GREEN);

            renderer.setSeriesStroke(0, new BasicStroke(3.0f));
            renderer.setSeriesStroke(1, new BasicStroke(3.0f));
            renderer.setSeriesStroke(2, new BasicStroke(3.0f));

            renderer.setSeriesShapesVisible(0, true);
            renderer.setSeriesShapesVisible(1, true);
            renderer.setSeriesShapesVisible(2, true);

            plot.setRenderer(renderer);
            plot.setBackgroundPaint(Color.WHITE);
            plot.setRangeGridlinePaint(Color.LIGHT_GRAY);
            plot.setDomainGridlinePaint(Color.LIGHT_GRAY);

            ChartPanel chartPanel = new ChartPanel(chart);
            JFrame chartFrame = new JFrame("Biểu đồ thống kê");
            chartFrame.setContentPane(chartPanel);
            chartFrame.setSize(800, 600);
            chartFrame.setLocationRelativeTo(null);
            chartFrame.setVisible(true);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this, "Lỗi thống kê: " + e.getMessage());
        }
    }//GEN-LAST:event_btnChartDisplayActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnChartDisplay;
    private javax.swing.JButton btnTableDisplay;
    private javax.swing.JComboBox<String> cbDate;
    private com.toedter.calendar.JDateChooser dateEnd;
    private com.toedter.calendar.JDateChooser dateStart;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tableThongKe;
    // End of variables declaration//GEN-END:variables
}
