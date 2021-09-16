/**
* @filename:${entityName}ServiceImpl ${createTime}
* @project ${project}  ${version}
* Copyright(c) 2018 ${author} Co. Ltd.
* All right reserved.
*/
package ${serviceImplUrl};

import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.ibatis.annotations.Param;

import ${entityUrl}.${entityName};
import ${daoUrl}.${entityName}Dao;
import ${serviceUrl}.${entityName}Service;
import com.gzpg.txycypt.common.plugin.Order;
import com.gzpg.txycypt.common.plugin.Page;
import com.gzpg.txycypt.common.entity.Common;

/**
*
* @Description:  ${entityComment}——服务层实现
* @Author:       ${author}
* @CreateDate:   ${createTime}
* @Version:      ${version}
*
*/
@Service
public class ${entityName}ServiceImpl implements ${entityName}Service {
	private ${entityName}Dao ${objectName}Dao;

	@Autowired
	public ${entityName}ServiceImpl(${entityName}Dao ${objectName}Dao)
	{
		this.${objectName}Dao = ${objectName}Dao;
	}

	public Integer addByObject(${entityName} ${objectName}){
		return ${objectName}Dao.addByObject(${objectName});
	}

	public Integer addByObjects(List<${entityName}> ${objectName}List){
		return ${objectName}Dao.addByObjects(${objectName}List);
	}

	public Integer deleteByObject(${entityName} ${objectName}){
		return ${objectName}Dao.deleteByObject(${objectName});
	}

	public Integer deleteByLike(${entityName} ${objectName}){
		return ${objectName}Dao.deleteByLike(${objectName});
	}

	public Integer deleteByObjects(${entityName} ${objectName}Pre,${entityName} ${objectName}Post){
		return ${objectName}Dao.deleteByObjects(${objectName}Pre,${objectName}Post);
	}

	public Integer update(${entityName} ${objectName}){
		return ${objectName}Dao.update(${objectName});
	}

	public Integer updateByObject(${entityName} ${objectName}Pre,${entityName} ${objectName}){
		return ${objectName}Dao.updateByObject(${objectName}Pre,${objectName});
	}

	public Integer updateByLike(${entityName} ${objectName}Pre,${entityName} ${objectName}){
		return ${objectName}Dao.updateByLike(${objectName}Pre,${objectName});
	}

	public Integer updateByObjects(${entityName} ${objectName}Pre,${entityName} ${objectName}Post,${entityName} ${objectName}){
		return ${objectName}Dao.updateByObjects(${objectName}Pre,${objectName}Post,${objectName});
	}

	public List<${entityName}> queryByObject(${entityName} ${objectName} , Order order, Page page){
		return ${objectName}Dao.queryByObject(${objectName},order , page);
	}

	public List<${entityName}> queryByLike(${entityName} ${objectName} , Order order, Page page){
		return ${objectName}Dao.queryByLike(${objectName},order , page);
	}

	public List<${entityName}> queryByObjects(${entityName} ${objectName}Pre,${entityName} ${objectName}Post , Order order, Page page){
		return ${objectName}Dao.queryByObjects(${objectName}Pre,${objectName}Post,order , page);
	}
}