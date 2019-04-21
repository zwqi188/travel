package com.yugii.controller;

import com.yugii.constants.Param;
import com.yugii.enums.ResponseEnums;
import com.yugii.response.LeResponse;
import com.yugii.service.SpotService;
import com.yugii.utils.ComUtils;
import com.yugii.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * Created by mac on 2019/4/20.
 */
@Controller
@RequestMapping(value = "/spot")
public class SpotController {


    @Autowired
    private SpotService spotService;

    @ResponseBody
    @RequestMapping(value = "/getRecommendSpot.json", method = RequestMethod.POST)
    public LeResponse getRecommendSpot(@RequestBody Map<String,Object> param) {
        String recommondType = (String) param.get(Param.RECOMMEND_TYPE);
        if(StringUtils.isEmpty(recommondType)) {
            return LeResponse.fail(ResponseEnums.ERROR_LACK_PARAM.getMessage());
        }
        return spotService.getRecommondSpot(recommondType);
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
