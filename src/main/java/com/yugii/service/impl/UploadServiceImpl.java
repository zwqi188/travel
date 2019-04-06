package com.yugii.service.impl;

import com.yugii.constants.Constant;
import com.yugii.response.LeResponse;
import com.yugii.service.UploadService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

/**
 * Created by mac on 2019/4/6.
 */
@Service("uploadServiceImpl")
public class UploadServiceImpl implements UploadService {
    @Override
    public LeResponse uploadImg(MultipartFile file) {
        String path = Constant.UPLOAD_IMG_PATH + UUID.randomUUID().toString();
        File dir = new File(path);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        //返回原来在客户端的文件系统的文件名
        String fileName = file.getOriginalFilename();
        FileOutputStream imgOut= null;//根据 dir 抽象路径名和 img 路径名字符串创建一个新 File 实例。
        try {
            imgOut = new FileOutputStream(new File(dir,fileName));
            imgOut.write(file.getBytes());//返回一个字节数组文件的内容
            imgOut.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String rpath = path+"/"+fileName;
        return LeResponse.succ(rpath);
    }
}
