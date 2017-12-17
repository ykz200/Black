package com.bhusk.black;

import com.bhusk.black.util.CheckMobile;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * springboot启动类
 */
@Controller
@EnableWebMvc
@SpringBootApplication
@ServletComponentScan
@ImportResource(locations={"classpath:mykaptcha.xml"})
@MapperScan(basePackages = "com.bhusk.black.mapper")
public class Application extends WebMvcConfigurerAdapter {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @RequestMapping("/")
    String home(HttpServletRequest request, HttpServletResponse response) {
        CheckMobile checkMobile = new CheckMobile();
        /**
         * 入口移动端和PC端 区分
         */
        if ("mobile".equals(checkMobile.check(request, response))) {
            return "redirect:/map/index";
        } else if ("pc".equals(checkMobile.check(request, response))) {
            return "redirect:index";
        } else {
            return "redirect:index";
        }
    }
}
