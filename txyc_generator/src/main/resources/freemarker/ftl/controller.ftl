/**
* @filename:${entityName}Controller ${createTime}
* @project ${project}  ${version}
* Copyright(c) 2018 ${author} Co. Ltd.
* All right reserved.
*/
package ${controllerUrl};
import java.util.List;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import ${entityUrl}.${entityName};
import ${serviceUrl}.${entityName}Service;
import com.gzpg.txycypt.common.entity.Result;
import com.gzpg.txycypt.common.plugin.Page;
import com.gzpg.txycypt.common.plugin.Order;

/**
*
* @Description:  ${entityComment}——控制层(外部接口)
* @Author:       ${author}
* @CreateDate:   ${createTime}
* @Version:      ${version}
*
*/
@RestController
@RequestMapping("/${objectName}")
public class ${entityName}Controller {
	private ${entityName}Service ${objectName}Service;

	@Autowired
	public ${entityName}Controller(${entityName}Service ${objectName}Service)
	{
		this.${objectName}Service = ${objectName}Service;
	}

	@RequestMapping("/getAll")
	public Result getAll(){
		Result result=new Result();
		try {
			Page page = new Page();
			page.setRows(2);
			List<${entityName}> ${objectName}List =${objectName}Service.queryByObject(null,null,page);
			if (${objectName}List!=null) {
				result.setFlag(true);
				result.setCode(1);
				result.setMessage("成功");
				result.setData(${objectName}List);
			} else {
				result.setCode(-1);
				result.setMessage("你获取的记录不存在");
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	@PostMapping("/add")
	public Result add(@RequestBody ${entityName} ${objectName}){
		Result result=new Result();
		try {
			<#if UUID>
			String ${ids[0].property} = UUID.randomUUID().toString().replaceAll("-", "");
			${objectName}.set${ids[0].property?cap_first}(${ids[0].property});
			</#if>
			int reg=${objectName}Service.addByObject(${objectName});
			result.setFlag(true);
			result.setCode(reg);
			result.setData(${objectName});
			if (reg>0) {
				result.setMessage("成功");
			} else {
				result.setMessage("未插入任何记录！");
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	@PostMapping("/delete")
	public Result delete(@RequestBody ${entityName} ${objectName}){
		Result result=new Result();
		try {
			int reg=${objectName}Service.deleteByObject(${objectName});
			result.setFlag(true);
			result.setCode(reg);
			result.setData(${objectName});
			if (reg>0) {
				result.setMessage("成功");
			} else {
				result.setMessage("未删除任何记录！");
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
	
	@PostMapping("/update")
	public Result update(@RequestBody ${entityName} ${objectName}){
		Result result=new Result();
		try {
			int reg = ${objectName}Service.update(${objectName});
			result.setFlag(true);
			result.setCode(reg);
			result.setData(${objectName});
			if (reg>0) {
				result.setMessage("成功");
			} else {
				result.setMessage("未更新任何记录！");
			}
		} catch (Exception e) {
			result.setCode(-1);
			result.setMessage("执行异常，请稍后重试");
		}
		return result;
	}
}