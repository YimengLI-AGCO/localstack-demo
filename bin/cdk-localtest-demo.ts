#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { CdkLocaltestDemoStack } from '../lib/cdk-localtest-demo-stack';

const app = new cdk.App();
new CdkLocaltestDemoStack(app, 'CdkLocaltestDemoStack');
