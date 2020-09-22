#!/bin/bash

PARAMS="$*"
USER_THT="$HOME/osp16_ref"

openstack overcloud roles generate -o $HOME/roles_data.yaml Controller ComputeOvsDpdkSriov

openstack overcloud deploy $PARAMS \
    --templates \
    --timeout 120 \
    -r $HOME/roles_data.yaml \
    -n $HOME/osp16_ref/network_data.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovs.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovs-dpdk.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-sriov.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/disable-telemetry.yaml \
    -e $HOME/osp16_ref/environment.yaml \
    -e $HOME/osp16_ref/network-environment.yaml \
    -e $HOME/osp16_ref/ml2-ovs-nfv.yaml \
    -e $HOME/containers-prepare-parameter.yaml

