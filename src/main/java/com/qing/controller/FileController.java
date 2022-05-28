package com.qing.controller;

import com.qing.service.WorkerIndexService;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

@Controller
public class FileController {

    @Autowired
    @Qualifier("WorkerIndexServiceImpl")
    private WorkerIndexService workerIndexService;

    @RequestMapping("/upLoad")
    @ResponseBody
    public String fileUpload(@RequestParam("file") CommonsMultipartFile file , HttpServletRequest request) throws IOException {

        //获取文件名 : file.getOriginalFilename();
        String uploadFileName = file.getOriginalFilename();
        //文件名,如spring
        String name = uploadFileName.substring(0, uploadFileName.indexOf("."));
        //文件后缀,如.jpeg
        String suffix = uploadFileName.substring(uploadFileName.lastIndexOf("."));

        //如果文件名为空，直接回到首页！
        if ("".equals(uploadFileName)){
            return "users";
        }
        System.out.println("上传文件名 : "+uploadFileName);

        //上传路径保存设置
        String path = request.getServletContext().getRealPath("/upload");
        //如果路径不存在，创建一个
        File realPath = new File(path);
        if (!realPath.exists()){
            realPath.mkdir();
        }
        System.out.println("上传文件保存地址："+realPath);

        //修改文件名
        String fileName = RandomStringUtils.randomAlphanumeric(5);
        uploadFileName = fileName+suffix;

        //判断文件是否已存在
        File discFile = new File(realPath + "\\\\" +uploadFileName);
        int i = 1;
        while (discFile.exists()){
            String j = String.valueOf(i);
            uploadFileName = fileName+ j + suffix;
            i++;
        }

        InputStream is = file.getInputStream(); //文件输入流
        OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流

        //读取写出
        int len=0;
        byte[] buffer = new byte[1024];
        while ((len=is.read(buffer))!=-1){
            os.write(buffer,0,len);
            os.flush();
        }
        os.close();
        is.close();

        workerIndexService.updateWorkerHand((String) request.getSession().getAttribute("username"), uploadFileName);
        request.getSession().setAttribute("workerHand",uploadFileName);

        return uploadFileName;
    }
}
