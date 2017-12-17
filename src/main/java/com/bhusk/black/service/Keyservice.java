package com.bhusk.black.service;

import com.bhusk.black.mapper.InfoMapper;
import com.bhusk.black.mapper.KeysMapper;
import com.bhusk.black.model.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by kzyuan on 2017/11/25 23:00
 * @author kzyuan
 */
@Service
public class Keyservice {

    @Autowired
    private KeysMapper keysMapper;

    public Keys getKeys(Keys keys) {
        return keysMapper.getKeys(keys);
    }
}
