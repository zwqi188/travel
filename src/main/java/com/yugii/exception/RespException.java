package com.yugii.exception;

import com.yugii.enums.ResponseEnums;
import com.yugii.response.LeResponse;

/**
 * Created by apple on 19/3/18.
 */
public class RespException extends RuntimeException {

    private String respCode;

    private String respMsg;

    public RespException() {}

    public RespException(String respCode, String respMsg) {
        this.respCode = respCode;
        this.respMsg = respMsg;
    }

    public RespException(ResponseEnums enums) {
        this.respCode = enums.getCode();
        this.respMsg = enums.getResponseMsg();
    }


    public String getRespCode() {
        return respCode;
    }

    public void setRespCode(String respCode) {
        this.respCode = respCode;
    }

    public String getRespMsg() {
        return respMsg;
    }

    public void setRespMsg(String respMsg) {
        this.respMsg = respMsg;
    }

    public LeResponse toResopnse() {
        return new LeResponse(this.respCode, this.respMsg);
    }
}
