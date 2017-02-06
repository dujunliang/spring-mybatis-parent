package com.vss.sys.service.impl;

import com.vss.sys.batis.mapper.PermissInfoMapper;
import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.service.Select2Service;
import com.vss.sys.service.process.Select2ServiceProcess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * Created by dujunliang on 17/1/6.
 */
@Transactional
@Service
public class Select2ServiceImpl implements Select2Service {



    @Autowired
    public Select2ServiceProcess select2ServiceProcess;

    @Override
    public Page<ParamDTO> select2SelectPermiss(PageRequest<Map<String, Object>> map) {
        return select2ServiceProcess.select2SelectPermiss(map);
    }

    @Override
    public Page<ParamDTO> select2SelectRole(PageRequest<Map<String, Object>> map) {
        return select2ServiceProcess.select2SelectRole(map);
    }


}
