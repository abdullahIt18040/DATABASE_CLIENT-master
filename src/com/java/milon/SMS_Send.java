package Sms;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by Asus on 2/26/2020.
 */
public class SMS_Send {
    public static void send_sms(String message) throws IOException {
        URL url =new URL("");
        HttpURLConnection connection=(HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        int status=connection.getResponseCode();
        System.out.println(status);
    }
}
