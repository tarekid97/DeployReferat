package demo;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

class AppTest {

    @Test
    void greetingContainsHelloWorld() {
        assertTrue(App.greeting().contains("Hello World"));
    }
}
