## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.24 |
| google | ~> 3.5.0 |
| google-beta | ~> 3.5.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| activate\_apis | The list of apis to activate within the project | `list(string)` | <pre>[<br>  "compute.googleapis.com"<br>]</pre> | no |
| billing\_account | The ID of the billing account to associate the projects with | `string` | `"01Z39Z-EE241Q-206G7U"` | no |
| bucket | The bucket to store state files | `string` | `"bucket-test"` | no |
| organization\_id | The organization ID | `string` | `"210987654321"` | no |
| prefix | The prefix used for projects and dataset ID/names | `string` | `"madhava"` | no |
| product | The prefix used for projects and dataset ID/names | `string` | `"client"` | no |

## Outputs

No output.
