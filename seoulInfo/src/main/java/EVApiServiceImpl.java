import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.service.EVApiService;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Service
public class EVApiServiceImpl implements EVApiService {

    @Value("${api.service.key}")
    private String serviceKey;

    public String getParkingInfo() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_prkplce_info_api");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") 	+ "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") 	+ "=" + URLEncoder.encode("100", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") 		+ "=" + URLEncoder.encode("xml", "UTF-8"));

        System.out.println("service : "+ urlBuilder);
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        return sb.toString();
    }
}
