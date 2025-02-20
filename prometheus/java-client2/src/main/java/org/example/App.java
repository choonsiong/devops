package org.example;

import io.prometheus.client.Gauge;
import io.prometheus.client.CollectorRegistry;
import io.prometheus.client.exporter.PushGateway;

import java.io.IOException;

public class App {
    public static void main(String[] args) throws IOException
    {

        PushGateway pushGateway = new PushGateway("ubuntu-push-gateway:9091");
        CollectorRegistry registry = new CollectorRegistry();

        Gauge gauge = Gauge.build()
                .name("java_push_gateway")
                .help("java_push_gateway")
                .register(registry);

        for (int i=0; i<=10000l; i++)
        {
            gauge.setToCurrentTime();
            pushGateway.push(registry, "Job B");
        }

    }
}