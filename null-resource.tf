resource "null_resource" "userdata" {
  connection {
    host = "${element(aws_instance.example.*.public_ip, 0)}"
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("/root/.ssh/id_rsa")}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo yum install telnet -y",
      "sudo systemctl start httpd",
      "sudo echo hello-word >> /var/www/html/index.html",
    ]
  }
}
