/**
* @filename:${entityName}Service ${createTime}
* @project ${project}  ${version}
* Copyright(c) 2018 ${author} Co. Ltd.
* All right reserved.
*/
package ${serviceUrl};

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Date;

import com.gzpg.txycypt.common.plugin.Order;
import com.gzpg.txycypt.common.plugin.Page;
import ${entityUrl}.${entityName};

/**
*
* @Description:  ${entityComment}——服务接口层
* @Author:       ${author}
* @CreateDate:   ${createTime}
* @Version:      ${version}
*
*/
public interface ${entityName}Service {

	//插入一个记录。
	//如果主键为自增主键，则返回值为插入记录的主键，
	//对象${objectName}不能为空
	public Integer addByObject(${entityName} ${objectName});

	//批量插入记录。
	//插入字段由第一个对象(${objectName}List[0])中的非空属性界定，${objectName}List中至少存在一个对象
	public Integer addByObjects(List<${entityName}> ${objectName}List);

	//删除记录。
	//删除条件由对象${objectName}界定，
	//按主键删除需将对象${objectName}中除主键外属性置为空
	//对象${objectName}不能为空，为空或对象${objectName}所有属性为空将导致错误或删除所有记录
	public Integer deleteByObject(${entityName} ${objectName});

	//同deleteByObject。
	//区别在于存在字符串使用LIKE操作查找
	public Integer deleteByLike(${entityName} ${objectName});

	//同deleteByObject。
	//区别在于${objectName}Pre中非空属性界定下界，${objectName}Post中非空属性界定上界
	public Integer deleteByObjects(${entityName} ${objectName}Pre,${entityName} ${objectName}Post);

	//更新记录。
	//更新值由对象${objectName}中非主键字段指定，
	//更新条件由对象${objectName}中主键字段指定
	public Integer update(${entityName} ${objectName});

	//更新记录。
	//更新值由对象${objectName}指定
	//更新条件由对象${objectName}Pre界定，
	//对象${objectName}Pre不能为空，为空或对象${objectName}Pre所有属性为空将导致错误或更新所有记录
	public Integer updateByObject(${entityName} ${objectName}Pre,${entityName} ${objectName});

	//同updateByObject。
	//区别在于存在字符串使用LIKE操作查找
	public Integer updateByLike(${entityName} ${objectName}Pre,${entityName} ${objectName});

	//同updateByObject。
	//区别在于${objectName}Pre中非空属性界定下界，${objectName}Post中非空属性界定上界
	public Integer updateByObjects(${entityName} ${objectName}Pre,${entityName} ${objectName}Post,${entityName} ${objectName});

	//查询记录。
	//查询条件由对象${objectName}中非空属性界定，
	//对象${objectName}为空或对象${objectName}所有属性为空，将返回表中所有记录，
	//按主键查询需将对象${objectName}中除主键外属性置为空
	//order指定排序字段和方式
	//page指定分页信息
	public List<${entityName}> queryByObject(${entityName} ${objectName} , Order order, Page page);

	//同queryByObject。
	//区别在于存在字符串使用LIKE操作查找
	public List<${entityName}> queryByLike(${entityName} ${objectName} , Order order, Page page);

	//同queryByObject。
	//区别在于${objectName}Pre中非空属性界定下界，${objectName}Post中非空属性界定上界
	public List<${entityName}> queryByObjects(${entityName} ${objectName}Pre,${entityName} ${objectName}Post  , Order order, Page page);
}