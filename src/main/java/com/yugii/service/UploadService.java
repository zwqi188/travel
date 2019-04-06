package com.yugii.service;

import com.yugii.response.LeResponse;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by mac on 2019/4/6.
 */
public interface UploadService {

    /**
     * 上传图片接口
     * @param file
     * @return
     */
    LeResponse uploadImg(MultipartFile file);
}
