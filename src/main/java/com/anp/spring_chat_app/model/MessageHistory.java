package com.anp.spring_chat_app.model;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MessageHistory {

    private Long id;

    private Long userId;

    @NotBlank
    private String username;

    private String lastMessage;

    private Date lastMessageTimestamp;
}