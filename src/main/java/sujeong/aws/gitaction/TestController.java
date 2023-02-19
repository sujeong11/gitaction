package sujeong.aws.gitaction;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/")
    public String hello() {
        return "hello";
    }

    @GetMapping("/test")
    public String test() {
        return "CI/CD 동작확인";
    }
}
