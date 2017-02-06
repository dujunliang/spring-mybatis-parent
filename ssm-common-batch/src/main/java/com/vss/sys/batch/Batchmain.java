package com.vss.sys.batch;

import org.springframework.batch.core.*;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by dujunliang on 16/12/2.
 */
public class Batchmain {


    public static void main(String[] args)
            throws JobExecutionAlreadyRunningException, JobRestartException,
            JobInstanceAlreadyCompleteException, JobParametersInvalidException {
        @SuppressWarnings("resource")
        ApplicationContext context = new ClassPathXmlApplicationContext(
                new String[]{"classpath:spring-batch2.xml"});
        JobParametersBuilder jobParametersBuilder = new JobParametersBuilder();
        Job job = (Job) context.getBean("sampleJob");
        JobLauncher launcher = (JobLauncher) context.getBean("jobLauncher");
        JobExecution result = launcher.run(job,
                jobParametersBuilder.toJobParameters());
        ExitStatus es = result.getExitStatus();
        if (es.getExitCode().equals(ExitStatus.COMPLETED.getExitCode())) {
            System.out.println("任务正常完成");
        } else {
            System.out.println("任务失败，exitCode=" + es.getExitCode());
        }
    }


}
