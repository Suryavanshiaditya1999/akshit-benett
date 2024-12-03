[# Kubernetes Health Checks: Liveness vs. Readiness vs. Startup Probe](https://stackoverflow.com/questions/55423405/k8s-livenessprobe-vs-readinessprobe)

Probes are basically healthchecks in Kubernetes . There are two types of probes in kubernetes
- Liveliness Probe
- Readiness Probe

**livenessProbe**

```
 livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 3
      periodSeconds: 3
```

- It is used to indicate if the container has started and is alive or not i.e. proof of being available.
- In the given example, if the request fails, it will restart the container.
- If not provided the default state is Success.

**readinessProbe**

```
 readinessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 3
      periodSeconds: 3
```

- It is used to indicate if the container is ready to serve traffic or not i.e.proof of being ready to use.
- It checks dependencies like database connections or other services your container is depending on to fulfill its work.
- In the given example, until the request returns Success, it won't serve any traffic(by removing the Pod’s IP address from the endpoints of all Services that match the Pod).
- Kubernetes relies on the readiness probes during rolling updates, it keeps the old container up and running until the new service declares that it is ready to take traffic.
- If not provided the default state is Success.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Both readiness probe and liveness probe seem to have same behavior. They do same type of checks. But the action they take in case of failures is different.
Readiness Probe shuts the traffic from service down. so that service can always the send the request to healthy pod whereas the liveness probe restarts the pod in case of failure. It does not do anything for the service. Service continues to send the request to the pods as usual if it is in ‘available’ status.


## Startup Probe
