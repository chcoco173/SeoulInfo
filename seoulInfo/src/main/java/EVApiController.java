import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.EVApiService;

import java.io.IOException;

@RestController
@RequestMapping("/api")
public class EVApiController {

    private EVApiService apiService;

    public void ApiController(EVApiService apiService) {
        this.apiService = apiService;
    }

    @GetMapping("/parking-data")
    public ResponseEntity<String> getParkingInfo() {
        try {
        	String data = apiService.getParkingInfo();
        	System.out.println(data);
            return ResponseEntity.ok(data);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error :");
        }
    }
}
