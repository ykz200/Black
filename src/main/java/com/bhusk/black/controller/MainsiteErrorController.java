package com.bhusk.black.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by kzyuan on 2017/7/11.
 */
@Controller
@RequestMapping("/error-pages")
public class MainsiteErrorController {

    @RequestMapping(value = "{error}")
    public ModelAndView error(@PathVariable String error) {
        ModelAndView result = new ModelAndView("error-pages/"+error);
        return result;
    }
}
