package com.vss.sys.auto;

import com.vss.sys.batis.model.JiraIssueWithBLOBs;
import com.vss.sys.param.SysParams;
import com.vss.sys.service.FileService;
import com.vss.sys.service.HttpClientService;
import com.vss.sys.service.JiraIssueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dujunliang on 12/23/16.
 */
@Component
public class AutoWriteJob extends FileProcess {

    private static final Logger logger = LoggerFactory.getLogger(AutoWriteJob.class);

    @Autowired
    protected FileService fileService;

    @Autowired
    protected JiraIssueService jiraIssueService;


    public void run() {
        /**
         * 如果文件目錄不存在則不執行
         */
        String csvPath = getCsvPath();
        String wirtePath = getWritePath();
        if (!exitPath(csvPath) && !exitPath(wirtePath)) {
            return;
        }

        List<File> filelist = fileService.readfile(csvPath);

        if (filelist != null) {
            /**
             * 查看該目錄是否存在需要入庫的文件
             */
            for (File file : filelist) {

                List<String[]> listeria = new ArrayList<String[]>();
                /**
                 * 单文件读取
                 */
                String filepath = parsefilepath(file.getPath());

                logger.info("開始讀取文件PATH:" + filepath);

                List<String> dalis = fileService.readFileByLines(filepath);
                /**
                 * bean 信息組合
                 */
                for (String str : dalis) {
                    String[] data = str.split(",");
                    data[11] = desc(data[10]);
                    listeria.add(data);
                }

                fileService.writeCsv(wirtePath,listeria);

                logger.info("結束寫入文件PATH:" + filepath);

            }


        }

    }







}
