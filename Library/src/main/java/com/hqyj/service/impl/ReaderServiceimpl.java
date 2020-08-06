package com.hqyj.service.impl;

import com.hqyj.mapper.ReaderMapper;
import com.hqyj.pojo.Reader;
import com.hqyj.service.ReaderService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReaderServiceimpl implements ReaderService {
    @Autowired
    private ReaderMapper mapper;

    @Override
    public String checkLogin(Reader a) {
        //拿到当前用户
        Subject s = SecurityUtils.getSubject();
        //判断当前用户是否被认证，并做相关处理
        if (!s.isAuthenticated()) {
            //UsernamePasswordToken 令牌类  稍后会把保存在里面账号密码和shiro的身份和凭证比对
            UsernamePasswordToken upt = new UsernamePasswordToken(a.getrName(), a.getrPassword());
            upt.setRememberMe(true);
            try {
               // System.err.println("我进来了");
                //进行认证(因为我们写了自定义的realm类，所以会自动到realm类里面去认证)
                s.login(upt);
                s.getSession().setAttribute("rName", a.getrName());
                return "success";
            } catch (AuthenticationException e) {
                //登录失败
                return "ERROR";
            }
        } else {

        }
        return null;
    }

    @Override
    public String register(Reader a) {
        return null;
    }

    @Override
    public int reader(Reader reader) {
        return mapper.insertSelective(reader);
    }

    @Override
    public Reader selectByUname(String rName) {
        return mapper.selectByPrimaryKey01(rName);
    }


}
