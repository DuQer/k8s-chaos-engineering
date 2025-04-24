# ⚙️ Kubernetes Chaos Engineering & Monitoring Setup

This project provides a complete setup for **Chaos Engineering** and **Kubernetes cluster monitoring** using:

- 🔥 Chaos Mesh – for injecting chaos and testing resiliency
- 📈 Prometheus – for metrics collection
- 📊 Grafana – for visualization
- 📦 Node Exporter – for node-level metrics
- 🧪 Custom Grafana Dashboard – tailored for real, node-level metrics

All components run inside **Minikube** and are accessible via **ngrok** tunnel for external access.

---

## 🚀 Tech Stack

- **Kubernetes (Minikube)**
- **Prometheus** for time-series metrics
- **Grafana** for visualization
- **Node Exporter** for host-level metrics
- **Chaos Mesh** for chaos injection

---

## 🛠️ Setup Instructions

### 1. Start Minikube
```bash
minikube start --driver=docker
```
### 2. Apply Kubernetes manifests
```bash
kubectl apply -f manifests/
```
### 3. Port-forward Prometheus and Grafana
```bash
kubectl port-forward -n monitoring svc/prometheus 9090:9090
kubectl port-forward -n monitoring svc/grafana 3000:80
```
### 4. Access services in the browser

Prometheus → http://localhost:9090

Grafana → http://localhost:3000

## 📊 Grafana Dashboard
Located at: grafana/dashboards/dashboard-provider.json

Includes panels for:

- Node CPU Usage
- Node Memory Usage
- Node Disk Usage
- Node Filesystem Free Space
- Node Network I/O (Receive + Transmit)
- Node Disk I/O (Read + Write)
- Node Filesystem I/O
- Node Load (1m avg)
- Node Network Errors
- Node Swap Usage
