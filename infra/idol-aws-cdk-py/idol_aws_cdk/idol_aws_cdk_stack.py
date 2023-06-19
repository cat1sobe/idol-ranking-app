from aws_cdk import (
    # Duration,
    Stack,
    # aws_sqs as sqs,
    aws_s3 as s3,
    aws_ec2 as ec2,
    # core as cdk,
    aws_ecs as ecs,
    aws_elasticloadbalancingv2 as elbv2,
    aws_autoscaling as autoscaling
)

from constructs import Construct

class IdolAwsCdkStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # The code that defines your stack goes here

        idolVpcId = 'vpc-0ca9ef0405ab595d5'
        vpc = ec2.Vpc.from_lookup(self, 'existing-vpc', vpc_id=idolVpcId)

        #クラスターの作成
        cluster = ecs.Cluster(self, 'cluster', vpc=vpc)

        # Auto Scaling Groupを作成
        asg = autoscaling.AutoScalingGroup(
            self,
            "my-asg",
            vpc=vpc,
            instance_type=ec2.InstanceType("t3.micro"),
            machine_image=ecs.EcsOptimizedImage.amazon_linux2(),
            desired_capacity=3,
            min_capacity=1,
            max_capacity=4
        )

        # Auto Scaling GroupをECS Clusterに追加
        cluster.autoscaling_group = asg


        
