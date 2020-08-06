package com.hqyj.conroller;

import com.hqyj.pojo.Reader;
import com.hqyj.realm.MyRealm;
import com.hqyj.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@Controller
@RequestMapping("use")
public class ReaderConroller {
    @Autowired
    private ReaderService as;
    @RequestMapping("firstShiro.do")
    public String login(){
        return "jsp/reader/login";
    }

//登录
    @RequestMapping("checkLogin.ajax")
    @ResponseBody
    public String checkLogin(Reader a){
     // System.out.println(a);
        String info=as.checkLogin(a);
       // System.err.println(info);
        return info;
    }
 @RequestMapping("register.do")
    public String register(){
        return "jsp/reader/register";
    }

@RequestMapping("success.do")
    public String success(){
        return "jsp/reader/index";
    }

    //注册
    @RequestMapping("register.ajax")
    @ResponseBody
    public int register(Reader reader){
        MyRealm myRealm=new MyRealm();
        Reader reader1=as.selectByUname(reader.getrName());
        reader.setrPassword(myRealm.m(reader.getrPassword(),reader.getrName()));
        reader.setrCredibility(100);
        reader.setrNumber(0);
        if(reader1!=null){
            return 0;
        }else {
            int n=as.reader(reader);
            return n;
        }
    }
}
