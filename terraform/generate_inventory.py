import sys

bastion_ip = sys.argv[1]
ci_cd_ip = sys.argv[2]
frontend_ip = sys.argv[3]
backend_ip = sys.argv[4]
monitoring_ip = sys.argv[5]
rds_endpoint = sys.argv[6]

with open("D:/project/itca_demo/ansible/roles/kubespray/inventory/sample/inventory.ini", "r") as f:
    lines = f.readlines()

lines[0] = f"master ansible_host={bastion_ip} ansible_user=dev_ops_itca\n"
lines[1] = f"node1 ansible_host={frontend_ip} ansible_user=dev_ops_itca\n"
lines[2] = f"node2 ansible_host={backend_ip} ansible_user=dev_ops_itca\n"
lines[3] = f"node3 ansible_host={ci_cd_ip} ansible_user=dev_ops_itca\n"
lines[4] = f"node4 ansible_host={monitoring_ip} ansible_user=dev_ops_itca\n"

with open("D:/project/itca_demo/ansible/roles/kubespray/inventory/sample/inventory.ini", "w") as f:
    f.writelines(lines)