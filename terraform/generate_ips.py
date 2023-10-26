import sys

bastion_ip = sys.argv[1]
ci_cd_ip = sys.argv[2]
frontend_ip = sys.argv[3]
backend_ip = sys.argv[4]
monitoring_ip = sys.argv[5]


with open("D:/project/itca_demo/ansible/roles/kubespray/inventory/sample/inventory.ini", "r") as f:
    lines = f.readlines()

lines[4] = f"master ansible_host={bastion_ip} ansible_user=dev_ops_itca\n"
lines[5] = f"node1 ansible_host={frontend_ip} ansible_user=dev_ops_itca\n"
lines[6] = f"node2 ansible_host={backend_ip} ansible_user=dev_ops_itca\n"
lines[7] = f"node3 ansible_host={ci_cd_ip} ansible_user=dev_ops_itca\n"
lines[8] = f"node4 ansible_host={monitoring_ip} ansible_user=dev_ops_itca\n"

with open("D:/project/itca_demo/ansible/roles/kubespray/inventory/sample/inventory.ini", "w") as f:
    f.writelines(lines)

#     to run
#     python generate_ips.py $(./terraform output bastion_ip) $(./terraform output ci_cd_ip) $(./terraform output frontend_ip) $(./terraform output backend_ip) $(./terraform output monitoring_ip)
