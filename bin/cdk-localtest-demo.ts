#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { CdkLocalTestDemoStack } from '../lib/cdk-localtest-demo-stack';

const app = new cdk.App();
new CdkLocalTestDemoStack(app, 'CdkLocalTestDemoStack');
