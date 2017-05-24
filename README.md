# 5/24/17 DevOps Meetup Demo
awspec and inspec demo

## Setup
1. You'll need to install some ruby dependencies. Use [rvm](rvm.io/rvm/install)
or the [ChefDK](https://downloads.chef.io/chefdk) to get a reliable version of
ruby. I prefer the version bundled with ChefDK
1. You'll also need an AWS account for testing
    - Setup an IAM user and take note of the secret key and access key.
    - Install the AWS tools and run `aws configure`
    - [More Info](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
    - If you have more than one profile in your ~/.aws/credentials file, make
    sure you set the environment var to your default profile.

    ```bash
    export AWS_PROFILE=<YOUR_AWS_PROFILE_NAME>
    ```
1. Finally, you'll need an ssh key pair to use for logging into the EC2 server. [See here for more info](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
    - You will to export export private key name and path to following environment vars. These variables will be used by test kitchen and can be configured in the `.kitchen.yml`

    ```bash
    export PERSONAL_AWS_PRIVATE_KEY_NAME=<SSH_PRIVATE_KEY_NAME>
    export PERSONAL_AWS_PRIVATE_KEY_PATH=<FULL_PATH_TO_YOUR_SSH_KEY>
    ```

## Demo Instructions
1. Spin up infrastructure with test kitchen

```bash
kitchen create
```

1. Generate awspec tests for ec2

```bash
chef exec awspec ec2 <YOUR_VPC_ID> >> spec/ec2_spec.rb
```

1. Execute awspec test by calling the `spec` Rake task

```
chef exec rake spec
```

1. Run inspec tests via test kitchen
```bash
kitchen verify
```

1. Cleanup
```bash
kitchen destroy
```

## Resources
* [awspec](https://github.com/k1LoW/awspec)
* [inspec](https://inspec.io)
* [serverspec](http://serverspec.org/)
* [test kitchen](http://kitchen.ci)

