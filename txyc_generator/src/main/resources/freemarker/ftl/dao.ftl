/**
* @filename:${entityName}Dao ${createTime}
* @project ${project}  ${version}
* Copyright(c) 2018 ${author} Co. Ltd.
* All right reserved.
*/

package ${daoUrl};

import java.util.List;
import java.util.Date;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.gzpg.txycypt.common.plugin.Order;
import com.gzpg.txycypt.common.plugin.Page;
import ${entityUrl}.${entityName};

/**
* @Description:  ${entityComment}——数据存取接口
* @Author:       ${author}
* @CreateDate:   ${createTime}
* @Version:      ${version}
*/
@Repository
@Mapper
public interface ${entityName}Dao {

    public Integer addByObject(@Param("d") ${entityName} ${objectName});
    public Integer addByObjects(@Param("d") List<${entityName}> ${objectName}List);
    public Integer deleteByObject(@Param("c") ${entityName} ${objectName});
    public Integer deleteByLike(@Param("c") ${entityName} ${objectName});
    public Integer deleteByObjects(@Param("cb") ${entityName} ${objectName}Pre,@Param("ce") ${entityName} ${objectName}Post);
    public Integer update(@Param("d") ${entityName} ${objectName});
    public Integer updateByObject(@Param("c") ${entityName} ${objectName}Pre,@Param("d") ${entityName} ${objectName});
    public Integer updateByLike(@Param("c") ${entityName} ${objectName}Pre,@Param("d") ${entityName} ${objectName});
    public Integer updateByObjects(@Param("cb") ${entityName} ${objectName}Pre,@Param("cd") ${entityName} ${objectName}Post,@Param("d") ${entityName} ${objectName});
    public List<${entityName}> queryByObject(@Param("c") ${entityName} ${objectName} , @Param("order") Order order, @Param("page")Page page);
    public List<${entityName}> queryByLike(@Param("c") ${entityName} ${objectName} , @Param("order") Order order, @Param("page")Page page);
    public List<${entityName}> queryByObjects(@Param("cb") ${entityName} ${objectName}Pre,@Param("ce") ${entityName} ${objectName}Post , @Param("order") Order order, @Param("page")Page page);
}
	