package com.yugii.request;

import javax.validation.constraints.NotNull;

/**
 * Created by apple on 19/3/6.
 */
public class UserRequest {


    private String userName;

    @NotNull(groups = {Register.class}, message = "密码不能为空")
    private String password;

    @NotNull(groups = {Register.class}, message = "手机号不能为空")
    private String mobile;

    @NotNull(groups = {Register.class}, message = "验证码不能为空")
    private String random;

    public interface Register{};
}
