package com.vss.sys.auto;

import com.vss.sys.batis.model.JiraIssueWithBLOBs;
import com.vss.sys.service.FileService;
import com.vss.sys.service.HttpClientService;
import com.vss.sys.service.JiraIssueService;
import com.vss.sys.param.SysParams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by dujunliang on 12/23/16.
 */
@Component
public class AutoJob extends FileProcess {

    private static final Logger logger = LoggerFactory.getLogger(AutoJob.class);

    @Autowired
    protected FileService fileService;

    @Autowired
    protected JiraIssueService jiraIssueService;

    @Autowired
    protected HttpClientService httpClientService;

    public void run() {

        /**
         * 如果文件目錄不存在則不執行
         */
        String csv = getCsvPath();
        if (!exitPath(csv)) {
            return;
        }
        List<File> filelist = fileService.readfile(csv);

        if (filelist != null) {
            /**
             * 查看該目錄是否存在需要入庫的文件
             */
            for (File file : filelist) {

                List<JiraIssueWithBLOBs> listjira = new ArrayList<JiraIssueWithBLOBs>();
                /**
                 * 单文件读取
                 */
                String filepath = file.getPath().replace("\\", "");

                logger.info("開始讀取文件PATH:" + filepath);

                List<String> datalist = fileService.readFileByLines(filepath);

                /**
                 * bean 信息組合
                 */
                for (String str : datalist) {
                    String[] data = str.split(",");
                    JiraIssueWithBLOBs issue = contendInfo(data);
                    listjira.add(issue);
                }
                /**
                 * 保存成功後刪除原文件
                 */
                if (jiraIssueService.save(listjira)) {
                    fileService.deleteFolder(filepath);
                }
                logger.info("結束讀取文件PATH:" + filepath);

            }


        }

    }







}
