package ru.itis.biology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.itis.biology.dto.SignUpDto;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

@Service
public class SmsServiceImpl implements SmsService {

    @Autowired
    private ExecutorService executorService;

    private final RestTemplate restTemplate = new RestTemplate();

    @Value("${sms.aero.email}")
    private String smsAeroEmail;

    @Value("${sms.aero.api-key}")
    private String smsAeroApiKey;

    @Value("${sms.aero.from}")
    private String smsAeroFrom;

    @Value("${sms.aero.type}")
    private String smsAeroType;

    @Value("${sms.aero.url}")
    private String smsAeroUrl;

    @Override
    public Future<Boolean> send(SignUpDto form) {
        return executorService.submit(() -> {
            String request = smsAeroUrl + "?user="
                    + smsAeroEmail + "&password="
                    + smsAeroApiKey + "&to="
                    + form.getPhone() +
                    "&text=Регистрация прошла успешно, ваш e-mail: "
                    + form.getEmail() + "%20Пароль:%20" + form.getPassword()
                    + "&from="
                    + smsAeroFrom + "&type="
                    + smsAeroType;
            ResponseEntity<String> responseEntity = restTemplate.getForEntity(request, String.class);
            if (responseEntity.getBody().contains("accepted")) {
                return true;
            } else {
                throw new IllegalArgumentException("Incorrect phone number");
            }
        });
    }
}
