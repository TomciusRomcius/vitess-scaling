# Vitess scaling

Mini demo to learn about simple Vitess deployments on Kubernetes, and horizontal sharding.

## Instructions
* Deploy the operator, and the Vitess cluster to your Kubernetes cluster: <br>
```bash
kubectl apply -f vitess_operator.yaml
kubectl apply -f vitess_cluster.yaml
```
* Wait until all Vitess components start up.
* Portforward Vitess to your host machine:
```bash
./scripts/pf.sh
```
* Create a VSchema, SQL tables, and seed data:
```bash
./scripts/apply_schema.sh
```
* List shards, and view data:
```bash
./scripts/view_data.sh
```
