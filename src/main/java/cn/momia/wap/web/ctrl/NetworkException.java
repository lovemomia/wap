package cn.momia.wap.web.ctrl;

public class NetworkException extends RuntimeException {
    public NetworkException(String msg) {
        super(msg);
    }

    @Override
    public Throwable fillInStackTrace() {
        return this;
    }
}
