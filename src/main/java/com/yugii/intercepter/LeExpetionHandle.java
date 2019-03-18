package com.yugii.intercepter;


import com.yugii.exception.RespException;
import com.yugii.response.LeResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by apple on 19/3/18.
 */
@ControllerAdvice
public class LeExpetionHandle {

    private static final Log LOG = LogFactory.getLog(LeExpetionHandle.class);

    @ExceptionHandler(RespException.class)
    @ResponseBody
    public LeResponse handleRespException(RespException e) {
        LOG.info("RespException", e);
        return new LeResponse(e.getRespCode(), e.getRespMsg());
    }
}
