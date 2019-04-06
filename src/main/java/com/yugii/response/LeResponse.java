package com.yugii.response;

import com.yugii.constants.Response;

/**
 * Created by apple on 19/3/6.
 */
public class LeResponse {

    private String respCode;

    private String respMsg;

    private Object data;

    public LeResponse() {}

    public LeResponse(String code,String message) {
        this.respCode = code;
        this.respMsg = message;
    }

    public LeResponse(String code,String message, Object data) {
        this.respCode = code;
        this.respMsg = message;
        this.data = data;
    }

    public static LeResponse success(){
        return new LeResponse(Response.SUCCESS, Response.SUCCESS_MESSAGE);
    }

    public static LeResponse success(String respMsg){
        return new LeResponse(Response.SUCCESS, respMsg);
    }

    public static LeResponse success(Object data){
        return new LeResponse(Response.SUCCESS, Response.SUCCESS_MESSAGE, data);
    }

    public static LeResponse succ(String data){
        return new LeResponse(Response.SUCCESS, Response.SUCCESS_MESSAGE, data);
    }


    public static LeResponse fail(){
        return new LeResponse(Response.FAIL, Response.FAIL_MESSAGE);
    }

    public static LeResponse fail(String respMsg){
        return new LeResponse(Response.FAIL, respMsg);
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

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
