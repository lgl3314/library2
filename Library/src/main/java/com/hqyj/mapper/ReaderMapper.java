package com.hqyj.mapper;

import com.hqyj.pojo.Reader;
import org.apache.ibatis.annotations.Select;

public interface ReaderMapper {
    int deleteByPrimaryKey(Integer rId);

    int insert(Reader record);

    int insertSelective(Reader record);

    Reader selectByPrimaryKey(Integer rId);
    Reader selectByPrimaryKey01(String uName);

    int updateByPrimaryKeySelective(Reader record);

    int updateByPrimaryKey(Reader record);
@Select("select r_id as rId,r_name as rName,r_password as rPassword,r_sex AS rSex,r_birthday as rBirthday,r_contact AS rContact,r_email AS rEmail,r_credibility AS rCredibility,r_number AS rNumber from reader where r_name = #{username}")
    Reader queryPersonBymName(String username);
}