package com.vss.sys.service;

import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.dto.UserDTO;

import java.util.Map;

/**
 * Created by dujunliang on 17/1/6.
 */
public interface Select2Service {

    public Page<ParamDTO> select2SelectPermiss(PageRequest<Map<String, Object>> map);

    public Page<ParamDTO> select2SelectRole(PageRequest<Map<String, Object>> map);

}
