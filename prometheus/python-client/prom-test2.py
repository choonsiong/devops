from prometheus_client import start_http_server, Summary, Counter, Gauge
import random
import time

REQUEST_TIME = Summary("request_processing_second", "Time spent processing a function")
MY_COUNTER = Counter("my_counter", "My counter", ["name", "age"])
MY_GAUGE = Gauge("my_gauge", "My gauge")

# @REQUEST_TIME.time()
# @MY_COUNTER.count_exceptions()
def process_request(t):
    MY_COUNTER.labels(name="Foobar", age=42).inc(3)
    time.sleep(t)


# pip3 install prometheus-client
if __name__ == '__main__':
    start_http_server(8000);
    while True:
        process_request(random.random())
    print("The program end")