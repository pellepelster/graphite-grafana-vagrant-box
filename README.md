# Graphite, Carbon, Grafana (2.x) - All-in-one

Provision a virtual machine with vagrant and puppet with 

* Graphite (http://graphite.wikidot.com/)
* Carbon (http://graphite.wikidot.com/carbon)
* Grafana (2.x) (http://grafana.org/) 

## Details:

## Port overview 
* Graphite: http://localhost:9100/
* Carbon: http://localhost:2003
* Grafana: http://localhost:9100/grafana/
 

## Installation

```
git clone https://github.com/pellepelster/graphite-grafana-vagrant-box.git
cd graphite-grafana-vagrant-box
vagrant up
vagrant provision
open http://localhost:9100/ to see Graphite running
open http://localhost:9100/grafana/ to see Grafana running
```
