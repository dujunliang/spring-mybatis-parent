package com.vss.sys.batch;


import java.text.SimpleDateFormat;
import java.util.Date;

import com.vss.sys.util.SpringConfigTool;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.beans.factory.annotation.Autowired;

public class MyFirstJob {


    @Autowired
    private SpringConfigTool springConfigTool;

    public void excute(){
        System.out.print(new SimpleDateFormat("YYYY-mm-dd HH:mm:ss").format(new Date())+"========Spring Job Hello World!");
        SimpleJobLauncher launcher = (SimpleJobLauncher) springConfigTool.getBean("testLuncher");
        Job job = (Job) springConfigTool.getBean("testJob");
        JobParametersBuilder builder = (JobParametersBuilder) springConfigTool.getBean("paramsBuilder");
        builder.addDate("date", new Date());

        try {
            launcher.run(job, builder.toJobParameters());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}