/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;


/**
 *
 * @author ADMIN
 */
public class randomDateTime {
    public static void main(String[] args) {
        // Lấy thời gian hiện tại
        LocalDateTime currentDateTime = LocalDateTime.now();
        
        // Tạo định dạng ngày giờ mong muốn
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // Tạo ngẫu nhiên một giá trị thời gian trong khoảng 10 ngày trước đến hiện tại
        LocalDateTime randomDateTime = currentDateTime.minusMonths((long) (Math.random() * 3))
                .minusHours((long) (Math.random() * 24))
                .minusMinutes((long) (Math.random() * 60))
                .minusSeconds((long) (Math.random() * 60));
        
        // Định dạng và in ra giá trị ngẫu nhiên của datetime
        String formattedDateTime = randomDateTime.format(formatter);
        System.out.println("Random DateTime: " + formattedDateTime);
    }
}
