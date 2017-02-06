package com.vss.sys.exception;

import com.vss.sys.bean.ResultBean;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by dujunliang on 12/27/16.
 */
public class ExceptionHandler extends SimpleMappingExceptionResolver {

    private static final Logger logger = LoggerFactory.getLogger(ExceptionHandler.class);


    @Override
    protected ModelAndView doResolveException(HttpServletRequest request,
                                              HttpServletResponse response, Object handler, Exception ex) {
        String viewName = determineViewName(ex, request);
        if (viewName != null) {// JSP格式返回
            if (!(requestType(request))) {
                Integer statusCode = determineStatusCode(request, viewName);
                if (statusCode != null) {
                    applyStatusCodeIfPossible(request, response, statusCode);
                }
                return getModelAndView(viewName, ex, request);
            } else {
                // JSON格式返回
                responseJson(ex, response);
                return null;
            }
        } else {
            return null;
        }
    }

    protected boolean requestType(HttpServletRequest request) {

        return request.getHeader("accept").indexOf("application/json") > -1 || (request
                .getHeader("X-Requested-With") != null && request
                .getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1);

    }

    protected void responseJson(Exception ex, HttpServletResponse response) {
        try {
            ResultBean resultBean = new ResultBean();
            resultBean.setMsg(ex.toString());
            resultBean.setSuccess(false);
            resultBean.setMsgType("error");
            PrintWriter writer = response.getWriter();
            writer.write(JSONObject.fromObject(resultBean).toString());
            writer.flush();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }


}
