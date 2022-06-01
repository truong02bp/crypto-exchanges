package com.price.services.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;
import com.price.exceptions.BusinessException;
import com.price.services.WebSocketListenerCallBack;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.springframework.http.HttpStatus;

import java.io.IOException;

public class BinanceWebSocketListener<T> extends WebSocketListener {
    private final WebSocketListenerCallBack<T> callBack;
    private final ObjectMapper mapper = new ObjectMapper();
    private final ObjectReader reader;
    private boolean closing = false;

    public BinanceWebSocketListener(WebSocketListenerCallBack<T> callBack, Class<T> eventClass) {
        this.callBack = callBack;
        reader = mapper.readerFor(eventClass);
    }

    @Override
    public void onMessage(WebSocket webSocket, String text) {
        try {
            T event = reader.readValue(text);
            callBack.onResponse(event);
        } catch (IOException e) {
            throw BusinessException.builder().status(HttpStatus.INTERNAL_SERVER_ERROR).message(e.getLocalizedMessage()).build();
        }
    }

    @Override
    public void onClosing(final WebSocket webSocket, final int code, final String reason) {
        closing = true;
    }

    @Override
    public void onFailure(WebSocket webSocket, Throwable t, Response response) {
        if (!closing) {
            callBack.onFailure(t);
        }
    }
}
