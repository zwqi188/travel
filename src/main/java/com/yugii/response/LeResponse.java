package com.yugii.response;

import com.yugii.constants.Response;

/**
 * Created by apple on 19/3/6.
 */
public class LeResponse {

    private String code;

    private String message;

    private Object data;

    public LeResponse() {}

    public LeResponse(String code,String message) {
        this.code = code;
        this.message = message;
    }

    public LeResponse(String code,String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static LeResponse success(){
        return new LeResponse(Response.SUCCESS, Response.SUCCESS_MESSAGE);
    }

    public static LeResponse fail(){
        return new LeResponse(Response.FAIL, Response.FAIL_MESSAGE);
    }
}
