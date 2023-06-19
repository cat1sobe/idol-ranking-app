import { Stack, StackProps } from 'aws-cdk-lib';
import {
  aws_elasticloadbalancingv2 as elbv2,
  aws_ecs as ecs,
  aws_ec2 as ec2,
} from 'aws-cdk-lib';
import { Construct } from 'constructs';


export class IdolAwsCdkTypeStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here

    const vpcId = 'vpc-0ca9ef0405ab595d5'; 

    //指定のvpcを取得
    const vpc = ec2.Vpc.fromLookup(this, 'existing-vpc', {
      vpcId: vpcId
    });

    // ECS Cluster作成
    const cluster = new ecs.Cluster(this, 'cluster', {
      vpc
    });
  }  
}
