package com.price.services.impl;

import com.price.services.BinanceWebSocketClient;
import lombok.AllArgsConstructor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import org.springframework.stereotype.Service;

import java.io.Closeable;

@Service
@AllArgsConstructor
public class BinanceWebSocketClientImpl implements BinanceWebSocketClient {

    private final OkHttpClient client;

    private Closeable createNewWebSocket(String channel, BinanceWebSocketListener<?> listener) {
//        wss://stream.binance.com:9443/ws
//        session.send(connectedHeaders, "{\"method\": \"SUBSCRIBE\", \"params\":[\"btcusdt@trade\"], \"id\": 1}");
        String streamingUrl = String.format("%s/%s", "wss://stream.binance.com:9443/ws", channel);
        Request request = new Request.Builder().url(streamingUrl).build();
        final WebSocket webSocket = client.newWebSocket(request, listener);
        return () -> {
            final int code = 1000;
            listener.onClosing(webSocket, code, null);
            webSocket.close(code, null);
            listener.onClosed(webSocket, code, null);
        };
    }
}
