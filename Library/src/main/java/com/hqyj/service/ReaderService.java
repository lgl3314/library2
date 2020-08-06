package com.hqyj.service;

import com.hqyj.pojo.Reader;

public interface ReaderService {
    String checkLogin(Reader a);

    String register(Reader a);


    int reader(Reader reader);

    Reader selectByUname(String getrName);
}
