package com.cenyu.yygh.hosp.controller;

import com.cenyu.yygh.common.result.Result;
import com.cenyu.yygh.hosp.service.HospitalSetService;
import com.cenyu.yygh.model.hosp.HospitalSet;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
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
}
