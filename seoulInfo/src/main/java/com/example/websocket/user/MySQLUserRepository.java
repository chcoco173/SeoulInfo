package com.example.websocket.user;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class MySQLUserRepository {

    private final JdbcTemplate jdbcTemplate;

    public MySQLUserRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<String> findAllMemberIds() {
        return jdbcTemplate.query("SELECT member_id FROM member", new MemberIdRowMapper());
    }

    private static class MemberIdRowMapper implements RowMapper<String> {
        @Override
        public String mapRow(ResultSet rs, int rowNum) throws SQLException {
            return rs.getString("member_id");
        }
    }
}