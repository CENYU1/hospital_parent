package com.cenyu.yygh.cmn.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cenyu.yygh.cmn.mapper.DictMapper;
import com.cenyu.yygh.cmn.service.DictService;
import com.cenyu.yygh.model.cmn.Dict;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {
    @Override
    public List<Dict> findChildData(Long id) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("parent_id", id);
        List<Dict> dictList = baseMapper.selectList(wrapper);
        for(Dict dict : dictList) {
            boolean flag = hasChild(dict.getId());
            if(flag) dict.setHasChildren(true);
        }
        return dictList;
    }

    private boolean hasChild(Long id) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("parent_id", id);
        Integer count = baseMapper.selectCount(wrapper);
        return count > 0;
    }
}
