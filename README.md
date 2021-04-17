# terraform-sops-demo

A simple demo of [mozilla/sops](https://github.com/mozilla/sops) and usage within Terraform. This is for a quick talk I'm giving at [the DevOps Boulder Meetup](https://www.meetup.com/DevOps-Boulder/) on 4/19/21.

[See the slide deck here for more information](https://slides.com/gowiem/gitops-secrets-management-and-terraform).

## Running this code...

You can't unfortunately 😁.

The whole point to utilizing `sops` for the "secret" values that we are storing in `secrets.yaml` is that you would need to have access to my AWS Account's KMS key to be able to decrypt those secrets. So if you try to run a `terraform plan` as part of this project, the sops provider ([`terraform-provider-sops`](https://github.com/carlpett/terraform-provider-sops)) will fail because it can't decrypt those secret values.

If you would like to try, then you're more than welcome! You'll need to do the following:

1. Remove the `secrets.yaml` file from your local working directory
1. Utilize [`sops`](https://github.com/mozilla/sops) to create a new one using your own AWS KMS key or PGP key:
    ```bash
    sops --kms arn:aws:kms:<REGION>:<ACCOUNT_ID>:key/<KMS_KEY_ID> secrets.yaml
    ```
1. Run `terraform plan`.

If you have AWS credentials (`AWS_ACCESS_KEY_ID` + `AWS_SECRET_ACESS_KEY`) properly exported to your shell's environment then it will work!