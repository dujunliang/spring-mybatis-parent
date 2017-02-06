package com.vss.sys.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * Created by dujunliang on 16/12/16.
 */
@Controller
@RequestMapping("/resolver")
public class LanguageResolver {


    @Autowired
    CookieLocaleResolver resolver;
    /**
     * 语言切换
     */
    @RequestMapping("/language.do")
    public ModelAndView language(HttpServletRequest request,HttpServletResponse response,String language){

        language=language.toLowerCase();
        if(language==null||language.equals("")){
            return new ModelAndView("redirect:/");
        }else{
            if(language.equals("zh_cn")){
                resolver.setLocale(request, response, Locale.SIMPLIFIED_CHINESE );
            }else if(language.equals("en")){
                resolver.setLocale(request, response, Locale.ENGLISH );
            }else{
                resolver.setLocale(request, response, Locale.CHINA );
            }
        }

        return new ModelAndView("redirect:/");
    }

}
