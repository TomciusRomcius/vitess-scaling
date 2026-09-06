# Horizontal sharding with a hash algorithm in Vitess

Mini demo to learn about simple Vitess deployments on Kubernetes, and horizontal sharding.

## Instructions
* Create a vitess namespace: <br>
```bash
kubectl create namespace vitess
```
* Deploy the operator, and the Vitess cluster to your Kubernetes cluster: <br>
```bash
kubectl apply -f yaml/vitess_operator.yaml
kubectl apply -f yaml/vitess_cluster.yaml
```
* Wait until all Vitess components start up.
* On a separate terminal, portforward Vitess to your host machine (this has to keep running for portforwarding to work):
```bash
./scripts/pf.sh
```
* Create a VSchema, and SQL tables:
```bash
./scripts/apply_schema.sh
```
* Seed MySQL data:
```bash
mysql -h 127.0.0.1 -P 15306 -u user -e "$(cat sql/seed_data.sql)"
```
* List shards, and view data:
```bash
./scripts/view_data.sh
```
