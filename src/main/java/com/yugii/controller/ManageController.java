package com.yugii.controller;

import com.yugii.constants.Param;
import com.yugii.enums.ResponseEnums;
import com.yugii.response.LeResponse;
import com.yugii.service.MenuService;
import com.yugii.service.SpotService;
import com.yugii.service.UploadService;
import com.yugii.service.UserService;
import com.yugii.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * Created by mac on 2019/3/28.
 * 管理站点使用的controler
 */
@Controller
@RequestMapping("/manage")
public class ManageController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private UploadService uploadService;

    @Autowired
    private SpotService spotService;

    @Autowired
    private UserService userService;

    /**
     * 用户注册 /getMenuList.json
     * 请求参数
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /M/详细信息
     */
    @ResponseBody
    @RequestMapping(value = "/getMenuList.json",method = RequestMethod.GET)
    public String getMuenuList(){
        //校验参数
        return JsonUtils.objectToString(menuService.getMenuList());

    }


    /**
     * 用户注册 /getMenuListByParentId.json
     * 请求参数
     * @param param
     *      parentId        /M/父节点编号
     * @return
     *      respCode        /M/返回码
     *      respMsg         /M/返回信息
     *      data            /M/详细信息
     */
    @ResponseBody
    @RequestMapping(value = "/getMenuListByParentId.json",method = RequestMethod.POST)
    public String getMenuListByParentId(@RequestParam Map<String,Object> param){
        //校验参数
        Integer parentId = (Integer) param.get(Param.PARENT_ID);
        if(parentId == null) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        return JsonUtils.objectToString(menuService.getMenuListByParentId(parentId));

    }

    /**
     * 假装进行一次授权
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getUid.json",method = RequestMethod.GET)
    public String getUid(@RequestParam Map<String, Object> param) {
        Object obj = "admin";
        return JsonUtils.objectToString(LeResponse.success(obj));
    }

    /**
     * 上传图片接口
     * @param file 图片信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/uploadImg.json")
    public String uploadImg(MultipartFile file) {
        if(file == null) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        return JsonUtils.objectToString(uploadService.uploadImg(file));
    }


    /**
     * 添加景点信息
     * @param param
     *      spotName        |M|景点名称
     *      cityId          |M|城市编号
     *      price           |M|价格
     *      spotImg         |M|景点图片
     *      spotDesc        |M|景点描述
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/addSpot.json",method = RequestMethod.POST)
    public String addSpot(@RequestParam Map<String,Object> param){
        //校验参数
        String spotName = (String) param.get(Param.SPOT_NAME);
        String cityId = (String) param.get(Param.CITY_ID);
        String price = (String) param.get(Param.PRICE);
        String spotImg = (String) param.get(Param.SPOT_IMG);
        String spotDesc = (String) param.get(Param.SPOT_DESC);
        return JsonUtils.objectToString(spotService.addSpot(spotName,cityId,price,spotImg,spotDesc));

    }


    /**
     * 通过用户账户获取用户信息
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getUserInfoByAccount.json", method = RequestMethod.POST)
    public String getUserInfoByAccount(@RequestParam Map<String,Object> param) {
        String account = (String) param.get(Param.ACCOUNT);
        if(StringUtils.isEmpty(account)) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        return JsonUtils.objectToString(userService.getUserInfoByAccount(account));
    }

    @ResponseBody
    @RequestMapping(value = "/deleteByUserId.json", method = RequestMethod.POST)
    public String deleteByUserId(@RequestParam Map<String, Object> param) {
        String userId = (String) param.get(Param.USER_ID);
        if(StringUtils.isEmpty(userId)) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        return JsonUtils.objectToString(userService.deleteByUserId(userId));
    }
}
