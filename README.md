# 5/24/17 DevOps Meetup Demo
awspec and serverspec demo

## Setup
1. You'll need to install some ruby dependencies. Use [rvm](rvm.io/rvm/install)
or the [ChefDK](https://downloads.chef.io/chefdk) to get a reliable version of
ruby. I prefer the version bundled with ChefDK
1. You'll need an AWS account for testing
    - Setup an IAM user and take note of the secret key and access key.
    - Install the AWS tools and run `aws configure`
    - [More Info](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
    - If you have more than one profile in your ~/.aws/credentials file, make
    sure you set the environment var to your default profile.
    ```bash
    $ export AWS_PROFILE=<YOUR_AWS_PROFILE_NAME>
    ```
1. Spin up an EC2 Instance
    - Once you have an instance you can verify that your cli is working by
    running:
    ```bash
    $ aws ec2 describe-instances
    ```

## [awspec](https://github.com/k1LoW/awspec)
For more documentation on how to use awspec,
[see here](https://github.com/k1LoW/awspec)

1. Generate repo structure
    ```bash
    chef exec awspec init
    ```
1. Generate tests
    ```bash
    $ chef exec awspec generate ec2 <vpc-abc123> \
    >> spec/ec2_spec.rb
    ```
1. Run tests
    ```bash
    $ chef exec rake
    ```

## [inspec](https://inspec.io) / [serverspec](http://serverspec.org/)
For more information on serverspec or inspec, see the following sites:
- https://inspec.io
- http://serverspec.org

