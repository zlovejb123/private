/**
* @filename:${entityName} ${createTime}
* @project ${project}  ${version}
* Copyright(c) 2018 ${author} Co. Ltd.
* All right reserved.
*/
package ${entityUrl};

import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
*
* @Description:  ${entityComment}——实体层
* @Author:       ${author}
* @CreateDate:   ${createTime}
* @Version:      ${version}
*
*/
public class ${entityName} implements Serializable {

    private static final long serialVersionUID = ${agile}L;
	
<#list cis as ci>
	<#if ci.javaType=="Date">
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	</#if>
    //"${ci.property}" , "${ci.comment}"
    private ${ci.javaType} ${ci.property};
</#list>

<#list cis as ci>

    public ${ci.javaType} get${ci.property?cap_first}()
    {
        return this.${ci.property};
    }
</#list>

<#list cis as ci>

    public void set${ci.property?cap_first}(${ci.javaType} ${ci.property})
    {
        this.${ci.property} = ${ci.property};
    }
</#list>
}
	