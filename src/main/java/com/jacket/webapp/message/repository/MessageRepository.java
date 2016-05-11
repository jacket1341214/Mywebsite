package com.jacket.webapp.message.repository;

import com.github.abel533.mapper.Mapper;
import com.jacket.webapp.message.entity.Message;
import org.springframework.stereotype.Repository;

/**
 * Created by jacket on 2016/3/19.
 */
@Repository
public interface MessageRepository extends Mapper<Message> {
}
