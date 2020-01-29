resource "aws_cloudformation_stack" "outputs" {
  name = "${local.project}-outputs"
  template_body = <<EOF
{
  "Resources": {
    "VPCSecurityGroupId": {
      "Type": "AWS::SSM:Parameter",
      "Properties": {
        "Name": "vpc-security-group-id",
        "Type": "String",
        "Value": "${module.vpc.vpc_security_group_id}"
      }
    },
    "VPCPrivateSubnets": {
      "Type": "AWS::SSM:Parameter",
      "Properties": {
        "Name": "vpc-private-subnets",
        "Type": "String",
        "Value": "${module.vpc.vpc_private_subnets}"
      }
    }
  },
  "Outputs": {
    "VPCSecurityGroupId": {
      "Value": "${module.vpc.vpc_security_group_id}"
    },
    "VPCPrivateSubnets": {
      "Value": "${module.vpc.vpc_private_subnets}"
    },
  }
}
  EOF
}
