import io.socket.client.IO;
import io.socket.client.Socket;
import io.socket.emitter.Emitter;
import io.socket.backo.Backoff;
import io.socket.parser.DecodingException;
import io.socket.parser.IOParser;
import io.socket.parser.Packet;
import io.socket.parser.Parser;
import io.socket.thread.EventThread;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import okhttp3.Call;
import okhttp3.WebSocket;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.logging.Level;
import java.util.logging.Logger;


String url = "http://localhost:8080"; ///socketio/:8443";
io.socket.client.Socket socket;

void setup() {
  IO.Options options = IO.Options.builder().setForceNew(false).build();
  socket = IO.socket(URI.create(url), options);
  socket.connect();

  socket.onAnyIncoming(new Emitter.Listener() {
      @Override
      public void call(Object... args) {
          println("Any incoming " + socket.id());
      }
  });

  socket.onAnyOutgoing(new Emitter.Listener() {
      @Override
      public void call(Object... args) {
          println("Any outgoing " + socket.id());
      }
  });

  socket.on(Socket.EVENT_CONNECT_ERROR, new Emitter.Listener() {
      @Override
      public void call(Object... args) {
          println("Event connect error " + socket.id());
      }
  });

  socket.on(io.socket.client.Socket.EVENT_CONNECT, new Emitter.Listener() {
      @Override
      public void call(Object... args) {
          println("Opened " + socket.id());
      }
  });
  
  socket.on(io.socket.client.Socket.EVENT_DISCONNECT, new Emitter.Listener() {
      @Override
      public void call(Object... args) {
          println("Closed " + socket.id());
      }
  });
}

void draw() {
  //
}

void stop() {
  socket.disconnect();
}
