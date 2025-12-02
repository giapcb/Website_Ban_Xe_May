/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;
/**
 *
 * @author Asus TUF
 */
public class EmailSender {
    private static final String SENDER_EMAIL = "giapthoi09@gmail.com"; 
private static final String SENDER_PASSWORD = "ufekwhzsqihpgeki";  
    private static final String SMTP_HOST = "smtp.gmail.com";

   private static Session getMailSession() {
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.ssl.enable", "true");
    props.put("mail.smtp.ssl.checkserveridentity", "true");
    props.put("mail.smtp.ssl.protocols", "TLSv1.2 TLSv1.3");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.connectiontimeout", "10000");
    props.put("mail.smtp.timeout", "10000");
    props.put("mail.smtp.writetimeout", "10000");

    Session session = Session.getInstance(props, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
        }
    });

    session.setDebug(true);

    return session; // ⭐ Bắt buộc phải có
}


    /**
     * Gửi email xác nhận đơn hàng/thanh toán.
     */
    public static boolean sendOrderConfirmation(String recipientEmail, long maDH, double tongTien, String paymentMethod) {
        try {
            Session session = getMailSession();
            Message message = new MimeMessage(session);
            
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            
            // Tùy chỉnh tiêu đề và nội dung email
            String subject = "XÁC NHẬN ĐƠN HÀNG #" + maDH + " từ Motor Bike Shop";
            String content = buildEmailContent(maDH, tongTien, paymentMethod);

            message.setSubject(subject);
            message.setContent(content, "text/html; charset=UTF-8"); // Dùng HTML
            
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Hàm hỗ trợ xây dựng nội dung email
    private static String buildEmailContent(long maDH, double tongTien, String paymentMethod) {
        String paymentStatus = "COD".equals(paymentMethod) ? "Thanh toán khi nhận hàng" : "Chờ xác nhận chuyển khoản";
        
        // Định dạng tiền tệ đơn giản (bạn có thể cải tiến hơn)
        String formattedTotal = String.format("%,.0f₫", tongTien);

        // Nội dung HTML đơn giản
        return "<html><body>"
                + "<h3>Xin chào! Đơn hàng của bạn đã được tiếp nhận.</h3>"
                + "<p>Thông tin chi tiết đơn hàng:</p>"
                + "<ul>"
                + "<li><strong>Mã đơn hàng:</strong> #" + maDH + "</li>"
                + "<li><strong>Tổng cộng:</strong> " + formattedTotal + "</li>"
                + "<li><strong>Phương thức thanh toán:</strong> " + paymentStatus + "</li>"
                + "<li><strong>Tình trạng:</strong> " + ("COD".equals(paymentMethod) ? "Đang chờ xử lý" : "Chờ thanh toán") + "</li>"
                + "</ul>"
                + "<p>Cảm ơn quý khách đã mua hàng!</p>"
                + "</body></html>";
    }
    public static boolean sendEmail(String recipientEmail, String subject, String htmlContent) {
    try {
        Session session = getMailSession();
        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress(SENDER_EMAIL));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));

        message.setSubject(subject);
        message.setContent(htmlContent, "text/html; charset=UTF-8");

        Transport.send(message);
        return true;

    } catch (MessagingException e) {
        e.printStackTrace();
        return false;
    }
}

}
