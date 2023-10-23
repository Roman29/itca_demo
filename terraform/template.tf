data "template_file" "init" {
  template = "${file("${path.module}./ansible/roles/kubespray/inventory/hosts.ini")}"
  vars = {
    bastion = "${aws_instance.bastion.private_ip}"
    frontend = "${aws_instance.frontend.private_ip}"
    backend = "${aws_instance.backend.private_ip}"
    ci_cd = "${aws_instance.ci_cd.private_ip}"
    monitoring = "${aws_instance.monitoring.private_ip}"
  }
}