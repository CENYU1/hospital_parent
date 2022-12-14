package com.cenyu.yygh.cmn.controller;

import com.cenyu.yygh.cmn.service.DictService;
import com.cenyu.yygh.common.result.Result;
import com.cenyu.yygh.model.cmn.Dict;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Api(tags = "数据字典接口")
@RestController
@RequestMapping("/admin/cmn/dict")
@CrossOrigin
public class DictController {
    @Autowired
    private DictService dictService;

    @ApiOperation(value = "根据数据id查询子数据列表")
    @GetMapping("/findChildData/{id}")
    public Result findChildData(@PathVariable Long id) {
        List<Dict> list = dictService.findChildData(id);
        return Result.ok(list);
    }

    @ApiOperation(value = "导出数据字典接口")
    @GetMapping("/exportData")
    public void exportData(HttpServletResponse response) {
        dictService.exportDictData(response);
    }

    @ApiOperation(value = "导入数据字典接口")
    @PostMapping("/importData")
    public void importData(MultipartFile file) {
        dictService.importDictData(file);
    }
}
