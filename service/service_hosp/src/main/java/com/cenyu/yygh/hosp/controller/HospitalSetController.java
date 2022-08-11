package com.cenyu.yygh.hosp.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cenyu.yygh.common.result.Result;
import com.cenyu.yygh.hosp.service.HospitalSetService;
import com.cenyu.yygh.model.hosp.HospitalSet;
import com.cenyu.yygh.vo.hosp.HospitalSetQueryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = "医院设置管理")
@RestController
@RequestMapping("/admin/hosp/hospitalSet")
public class HospitalSetController {
    @Autowired
    private HospitalSetService hospitalSetService;

    @ApiOperation(value = "获取所有医院设置")
    @GetMapping("/findAll")
    public Result findAllHospitalSet() {
        List<HospitalSet> data = hospitalSetService.list();
        return Result.ok(data);
    }

    @ApiOperation(value = "逻辑删除医院设置")
    @DeleteMapping("/delete/{id}")
    public Result removeHospitalSet(@PathVariable Long id) {
        boolean flag = hospitalSetService.removeById(id);
        if(flag) return Result.ok();
        else return Result.fail();
    }

    @ApiOperation(value = "条件查询带分页")
    @PostMapping("/findPageHospSet/{current}/{limit}")
    public Result findPageHospSet(@PathVariable Long current,
                                  @PathVariable Long limit,
                                  @RequestBody(required = false) HospitalSetQueryVo hospitalSetQueryVo) {
        Page<HospitalSet> page = new Page<>(current, limit);
        QueryWrapper<HospitalSet> queryWrapper = new QueryWrapper<>();
        String hosname = hospitalSetQueryVo.getHosname();
        String hoscode = hospitalSetQueryVo.getHoscode();
        if(!StringUtils.isEmpty(hosname)) queryWrapper.like("hosname", hosname);
        if(!StringUtils.isEmpty(hoscode)) queryWrapper.eq("hoscode", hoscode);
        Page<HospitalSet> pageHospitalSet = hospitalSetService.page(page, queryWrapper);
        return Result.ok(pageHospitalSet);
    }

}
