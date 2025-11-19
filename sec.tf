# -------------------------------------------------------------------
# Data: Existing VPC
# -------------------------------------------------------------------
data "aws_vpc" "vince_exiting_vpc" {
  id = "vpc-07eede624774fec02"
  # Above VPC ID already exists in my AWS account
}

# -------------------------------------------------------------------
# Security Group: Base definition (no inline rules)
# -------------------------------------------------------------------
resource "aws_security_group" "vince_sec_groups" {
  name        = "vince_allow_rules"
  description = "Allow HTTP/HTTPS inbound traffic"
  vpc_id      = data.aws_vpc.vince_exiting_vpc.id

  tags = {
    Name = "vince_firewall_rules"
  }
}

# -------------------------------------------------------------------
# Egress Rules: Allow all outbound
# -------------------------------------------------------------------

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.vince_sec_groups.id
  cidr_ipv4         = "0.0.0.0/0"

  ip_protocol = "-1" # semantically equivalent to all ports
}

# -------------------------------------------------------------------
# Ingress Rules: Allow HTTP (80) and HTTPS (443) inbound
# -------------------------------------------------------------------

# Ingress for HTTP (port 80) from anywhere
resource "aws_vpc_security_group_ingress_rule" "ingress_http" {
  security_group_id = aws_security_group.vince_sec_groups.id
  cidr_ipv4         = "0.0.0.0/0"

  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
}

# Ingress for HTTPS (port 443) from anywhere
# resource "aws_vpc_security_group_ingress_rule" "ingress_https" {
#   security_group_id = aws_security_group.vince_sec_groups.id
#   cidr_ipv4         = "0.0.0.0/0"

#   ip_protocol = "tcp"
#   from_port   = 443
#   to_port     = 443
# }

# -------------------------------------------------------------------
# Ingress Rules: Allow port 22 inbound
# -------------------------------------------------------------------

resource "aws_vpc_security_group_ingress_rule" "ingress_port22" {
  security_group_id = aws_security_group.vince_sec_groups.id
  cidr_ipv4         = "0.0.0.0/0"

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}
