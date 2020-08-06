package com.hqyj.realm;


import com.hqyj.mapper.ReaderMapper;
import com.hqyj.pojo.Reader;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;


public class MyRealm extends AuthorizingRealm {
    @Autowired
    private ReaderMapper am;
    public String m(String rPassword,String rName){
        //设置加密方式
        String alg="MD5";
        //加载加密密码
        Object pas=rPassword;
        //设置加盐方式
        Object salt=rName;
        //加密次数
        int num=1024;
        String newPassword=new SimpleHash(alg,pas,salt,num).toHex();
        //System.out.println(newPassword);
        return newPassword;
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token1 = (UsernamePasswordToken)authenticationToken;
        Reader a = am.queryPersonBymName(token1.getUsername());
        //System.err.println(a.getrName()+a.getrPassword());
        if(a!=null){
           // System.err.println("ffdgdgdgfdgf");
            //2.设置shiro比对器身份
            Object Reader =a.getrName();
            //3.设置比对器里面的密码(把数据库里面的密码作为比对密码)
            Object credentials = a.getrPassword();
            //4.自动给令牌类里面的用户名设置加盐方式
            ByteSource salt= ByteSource.Util.bytes(a.getrName());
            //5.设置realm的名称
            String realmName = this.getName();
            //new SimpleAuthenticationInfo(principal,credentials,salt,realmName)才是真正的认证
            /*
           如何认证：
           将上面的principal和token1里面的用户名来比对
           将上面的credentials和token1里面的密码来比对
           因为spring-shiro.xml里面配置加密方式 所以会自动把token1里面的密码以MD5加密，加密1024次
          因为上面传了个salt，表示再把token1里面的密码再以salt加盐
           * */
            return  new SimpleAuthenticationInfo(Reader,credentials,salt,realmName);
        }else{
            throw  new AuthenticationException();
        }


    }
    public static void main(String[] args) {
        //加密测试代码
        //设置加密方式
        String algorithmName="MD5";
        //设置待加密的原密码
        Object source="123";
        //设置加盐方式(一般来说都是以用户名来加盐)
        Object salt= ByteSource.Util.bytes("qqq");
        //加密次数
        int hashIterations=1024;
        SimpleHash newPassword=new SimpleHash(algorithmName, source, salt, hashIterations);
        System.out.println(newPassword.toString());
    }

}
