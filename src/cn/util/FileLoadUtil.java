package cn.util;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileLoadUtil {
    public static String upload(HttpServletRequest request, MultipartFile file) {
        String p=null;
        if (file != null) {
            if (!file.isEmpty()) {
                String fileName;
                String path = request.getSession().getServletContext().getRealPath("/upload/images");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
                fileName = sdf.format(new Date());
                String imgUrl = path + "\\" + fileName + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
                File filePath = new File(imgUrl);
                if (!filePath.getParentFile().exists()) {
                    filePath.getParentFile().mkdirs();
                }
                try {
                    file.transferTo(filePath);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                p= "/upload/images/" + fileName + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
            }

        }
        return p;
    }

    public static ResponseEntity<byte[]> downLoad(HttpServletRequest request,String filePath) throws IOException {
        String path=request.getSession().getServletContext().getRealPath(filePath);
        File file=new File(path);
        String fileName=new String(filePath.substring(filePath.lastIndexOf('/')).getBytes("utf-8"), "ISO-8859-1");
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachment",fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
}
