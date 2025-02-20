from prometheus_client import start_http_server, Summary, Counter, Gauge
import random
import time

REQUEST_TIME = Summary("request_processing_second", "Time spent processing a function")
MY_COUNTER = Counter("my_counter", "My counter")
MY_GAUGE = Gauge("my_gauge", "My gauge")

@REQUEST_TIME.time()
@MY_COUNTER.count_exceptions()
def process_request(t):
    MY_COUNTER.inc(2)
    MY_GAUGE.set(10)
    MY_GAUGE.inc(20)
    MY_GAUGE.dec(5)
    time.sleep(t)


# pip3 install prometheus-client
if __name__ == '__main__':
    start_http_server(8000);
    while True:
        process_request(random.random())
    print("The program end")