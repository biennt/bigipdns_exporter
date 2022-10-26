#!/bin/bash
./getstats.sh &
./bigipdns_exporter &
./node_exporter &
