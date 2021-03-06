package com.yugii.controller;

import com.yugii.constants.Param;
import com.yugii.entity.Spot;
import com.yugii.enums.ResponseEnums;
import com.yugii.response.LeResponse;
import com.yugii.service.MenuService;
import com.yugii.service.SpotService;
import com.yugii.service.UploadService;
import com.yugii.service.UserService;
import com.yugii.utils.ComUtils;
import com.yugii.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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
        String label = (String) param.get(Param.LABEL);
        String startPoint = (String) param.get(Param.START_POINT);
        if(StringUtils.isEmpty(spotName) || StringUtils.isEmpty(cityId)
                || StringUtils.isEmpty(spotImg) || StringUtils.isEmpty(spotDesc) ) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        Spot spot = new Spot();
        spot.setSpotName(spotName);
        spot.setCityId(cityId);
        spot.setPrice(price);
        spot.setSpotImg(spotImg);
        spot.setSpotDesc(spotDesc);
        spot.setLabel(label);
        spot.setStartPoint(startPoint);
        return JsonUtils.objectToString(spotService.addSpot(spot));

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

    /**
     * 通过userId删除
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteByUserId.json", method = RequestMethod.POST)
    public String deleteByUserId(@RequestParam Map<String, Object> param) {
        String userId = (String) param.get(Param.USER_ID);
        if(StringUtils.isEmpty(userId)) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        return JsonUtils.objectToString(userService.deleteByUserId(userId));
    }


    /**
     * 添加菜单
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/addMenu.json", method = RequestMethod.POST)
    public String addMenu(@RequestParam Map<String,Object> param) {
        String parentId = (String) param.get(Param.PARENT_ID);
        String menuName = (String) param.get(Param.MENU_NAME);
        String menuId = (String) param.get(Param.MENU_ID);
        String menuIcon = (String) param.get(Param.MENU_THUNBNAIL);
        String menuUrl = (String) param.get(Param.MENU_URI);
        if(StringUtils.isEmpty(parentId) || StringUtils.isEmpty(menuName)
                  || StringUtils.isEmpty(menuUrl)) {
            return JsonUtils.objectToString(LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage()));
        }
        Integer pId = Integer.parseInt(parentId);
        return JsonUtils.objectToString(menuService.addMenu(pId,menuName,menuIcon, menuUrl, menuId));
    }

    /**
     * 获取图片
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/getImage.json",method= RequestMethod.GET)
    public void getImage(HttpServletResponse response, @RequestParam Map<String,Object> param)
            throws IOException {
        String path = (String) param.get(Param.IMAGE_URL);
        //设置不缓存图片
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "No-cache");
        response.setDateHeader("Expires", 0);
        //指定生成的响应图片,一定不能缺少这句话,否则错误.
        response.setContentType("image/jpeg");
        //创建BufferedImage对象,其作用相当于一图片
        BufferedImage image = ComUtils.readImageFile(new File(path));
        ImageIO.write(image,"JPEG",response.getOutputStream()); //输出图片
    }

}
