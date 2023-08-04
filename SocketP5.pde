import io.socket.client.*;
import io.socket.client.On;
import io.socket.emitter.*;
import java.net.URISyntaxException;

import io.socket.parser.Packet;
import io.socket.parser.Parser;
import io.socket.thread.EventThread;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import io.socket.backo.Backoff;
import io.socket.emitter.Emitter;
import io.socket.parser.DecodingException;
import io.socket.parser.IOParser;
import io.socket.parser.Packet;
import io.socket.parser.Parser;
import io.socket.thread.EventThread;
import okhttp3.Call;
import okhttp3.WebSocket;

import java.net.URI;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;


import java.util.*;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.logging.Level;
import java.util.logging.Logger;


String url = "https://example.com";
Socket socket;

void setup() {
  try {
    socket = IO.socket(url);
  } catch (URISyntaxException e) {
    throw new RuntimeException(e);
  }

socket.on(Socket.EVENT_CONNECT, new Emitter.Listener() {
    @Override
    public void call(Object... args) {
        System.out.println(socket.id()); // x8WIv7-mJelg7on_ALbx
    }
});

socket.on(Socket.EVENT_DISCONNECT, new Emitter.Listener() {
    @Override
    public void call(Object... args) {
        System.out.println(socket.id()); // null
    }
});
}

void draw() {
}
