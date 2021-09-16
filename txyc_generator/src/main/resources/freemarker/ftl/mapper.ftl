<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${daoUrl}.${entityName}Dao">
	<resultMap id="${entityName}ResultMap" type="${entityUrl}.${entityName}">
	<#list cis as ci>
	<id column="${ci.column}" jdbcType="${ci.jdbcType?upper_case}" property="${ci.property}" />
	</#list>
	</resultMap>
	<sql id="${entityName}_Column_List">
	${agile}
	</sql>

	<!-- 选择添加 -->
	<insert id="addByObject" parameterType="${entityUrl}.${entityName}">
		<#if autoIncrement>
		<selectKey keyProperty="d.${ids[0].property}" order="AFTER" resultType="java.lang.${ids[0].javaType}">
			SELECT
			LAST_INSERT_ID()
		</selectKey>
		</#if>
		insert into ${table}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#if autoIncrement>
			<#list noIds as ci>
			<if test="d.${ci.property} != null">
				${ci.column},
			</if>
			</#list>
			<#else>
			<#list cis as ci>
			<if test="d.${ci.property} != null">
				${ci.column},
			</if>
			</#list>
			</#if>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
			<#if autoIncrement>
			<#list noIds as ci>
			<if test="d.${ci.property} != null">
				${r'#{'}d.${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
			<#else>
			<#list cis as ci>
			<if test="d.${ci.property} != null">
				${r'#{'}d.${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
			</#if>
		</trim>
	</insert>
	<insert id="addByObjects">
		insert into ${table}
		<trim prefix="(" suffix=") values " suffixOverrides=",">
			<#if autoIncrement>
			<#list noIds as ci>
			<if test="d[0].${ci.property} != null">
				${ci.column},
			</if>
			</#list>
			<#else>
			<#list cis as ci>
			<if test="d[0].${ci.property} != null">
				${ci.column},
			</if>
			</#list>
			</#if>
		</trim>
		<foreach collection="d" item="t" separator="," close=";">
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#if autoIncrement>
			<#list noIds as ci>
			<if test="d[0].${ci.property} != null">
				${r'#{'}d[0].${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
			<#else>
			<#list cis as ci>
			<if test="d[0].${ci.property} != null">
				${r'#{'}d[0].${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
			</#if>
		</trim>
		</foreach>
	</insert>
	<!-- 选择修改 -->
	<update id="update" parameterType="${entityUrl}.${entityName}">
		<#if noIds?? && noIds?size != 0>
		update ${table}
		<set>
			<#list noIds as ci>
			<if test="d.${ci.property} != null">
				${ci.column} = ${r'#{'}d.${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
		</set>
			<trim prefix="where" prefixOverrides="AND|OR">
				<#list ids as ci>
				AND ${ci.column} = ${r'#{'}d.${ci.property},jdbcType=${ci.jdbcType?upper_case}}
				</#list>
			</trim>
		</#if>
	</update>
	<update id="updateByObject" parameterType="${entityUrl}.${entityName}">
		<#if noIds?? && noIds?size != 0>
		update ${table}
		<set>
			<#list noIds as ci>
			<if test="d.${ci.property} != null">
				${ci.column} = ${r'#{'}d.${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
		</set>
		<trim prefix="where" prefixOverrides="AND|OR">
			<#list cis as ci>
			<if test="c.${ci.property}  != null">
				AND ${ci.column} = ${r'#{'}c.${ci.property},jdbcType=${ci.jdbcType?upper_case}}
			</if>
			</#list>
		</trim>
		</#if>
	</update>
	<update id="updateByLike" parameterType="${entityUrl}.${entityName}">
		<#if noIds?? && noIds?size != 0>
		update ${table}
		<set>
			<#list noIds as ci>
			<if test="d.${ci.property} != null">
				${ci.column} = ${r'#{'}d.${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
		</set>
		<trim prefix="where" prefixOverrides="AND|OR">
			<#list cis as ci>
			<if test="c.${ci.property}  != null">
				<#if ci.javaType = "String">
				AND ${ci.column} like "%${r'${'}c.${ci.property},jdbcType=${ci.jdbcType?upper_case}}%"
				<#else>
				AND ${ci.column} = ${r'#{'}c.${ci.property},jdbcType=${ci.jdbcType?upper_case}}
				</#if>
			</if>
			</#list>
		</trim>
		</#if>
	</update>
	<update id="updateByObjects" parameterType="${entityUrl}.${entityName}">
		<#if noIds?? && noIds?size != 0>
		update ${table}
		<set>
			<#list noIds as ci>
			<if test="d.${ci.property} != null">
				${ci.column} = ${r'#{'}d.${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
		</set>
		<trim prefix="where" prefixOverrides="AND|OR">
			<#list cis as ci>
			<if test="cb == null and ce.areaId  != null and cb.areaId  == null">
				AND area_id &lt; ${r'#{'}ce.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			<if test="ce == null and d.areaId  == null and cb.areaId  != null">
				AND area_id &gt; ${r'#{'}cb.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			<if test="ce.areaId  != null and cb.areaId  != null">
				AND area_id between ${r'#{'}cb.${ci.property} ,jdbcType=INTEGER} and ${r'#{'}ce.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			</#list>
		</trim>
		</#if>
	</update>
	<!-- 组合条件查询 -->
	<select id="queryByObject" parameterType="${entityUrl}.${entityName}"
		resultMap="${entityName}ResultMap">
		select
		<include refid="${entityName}_Column_List" />
		from ${table}
		<if test = "c != null">
			<trim prefix="where" prefixOverrides="AND|OR">
				<#list cis as ci>
				<if test="c.${ci.property}  != null">
					AND ${ci.column} = ${r'#{'}c.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
				</if>
				</#list>
			</trim>
		</if>
	</select>
	<select id="queryByLike" parameterType="${entityUrl}.${entityName}"
			resultMap="${entityName}ResultMap">
		select
		<include refid="${entityName}_Column_List" />
		from ${table}
		<if test = "c != null">
			<trim prefix="where" prefixOverrides="AND|OR">
				<#list cis as ci>
				<if test="c.${ci.property}  != null">
					<#if ci.javaType = "String">
					AND ${ci.column} like "%${r'${'}c.${ci.property},jdbcType=${ci.jdbcType?upper_case}}%"
					<#else>
					AND ${ci.column} = ${r'#{'}c.${ci.property},jdbcType=${ci.jdbcType?upper_case}}
					</#if>
				</if>
				</#list>
			</trim>
		</if>
	</select>
	<select id="queryByObjects" parameterType="${entityUrl}.${entityName}"
			resultMap="${entityName}ResultMap">
		select
		<include refid="${entityName}_Column_List" />
		from ${table}
		<trim prefix="where" prefixOverrides="AND|OR">
			<#list cis as ci>
			<if test="cb == null and ce.areaId  != null and cb.areaId  == null">
				AND area_id &lt; ${r'#{'}ce.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			<if test="ce == null and d.areaId  == null and cb.areaId  != null">
				AND area_id &gt; ${r'#{'}cb.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			<if test="ce.areaId  != null and cb.areaId  != null">
				AND area_id between ${r'#{'}cb.${ci.property} ,jdbcType=INTEGER} and ${r'#{'}ce.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			</#list>
		</trim>
	</select>
	<delete id="deleteByObject">
		delete from ${table}
		<trim prefix="where" prefixOverrides="AND|OR">
			<#list cis as ci>
			<if test="c.${ci.property}  != null">
				AND ${ci.column} = ${r'#{'}c.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			</#list>
		</trim>
	</delete>
	<delete id="deleteByLike">
		delete from ${table}
		<trim prefix="where" prefixOverrides="AND|OR">
			<#list cis as ci>
			<if test="c.${ci.property}  != null">
				<#if ci.javaType = "String">
				AND ${ci.column} like "%${r'${'}c.${ci.property},jdbcType=${ci.jdbcType?upper_case}}%"
				<#else>
				AND ${ci.column} = ${r'#{'}c.${ci.property},jdbcType=${ci.jdbcType?upper_case}}
				</#if>
			</if>
			</#list>
		</trim>
	</delete>
	<delete id="deleteByObjects">
		delete from ${table}
		<trim prefix="where" prefixOverrides="AND|OR">
			<#list cis as ci>
			<if test="cb == null and ce.areaId  != null and cb.areaId  == null">
				AND area_id &lt; ${r'#{'}ce.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			<if test="ce == null and d.areaId  == null and cb.areaId  != null">
				AND area_id &gt; ${r'#{'}cb.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			<if test="ce.areaId  != null and cb.areaId  != null">
				AND area_id between ${r'#{'}cb.${ci.property} ,jdbcType=INTEGER} and ${r'#{'}ce.${ci.property} ,jdbcType=${ci.jdbcType?upper_case}}
			</if>
			</#list>
		</trim>
	</delete>
</mapper>