openstack overcloud deploy --templates \
    --timeout 90 \
    -r roles_data_osp11.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/neutron-ovs-dpdk.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
    -e network-environment-update.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/major-upgrade-converge.yaml
