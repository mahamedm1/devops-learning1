# AWS

## Availability Zones - AZ's
- One region may have multiple AZ's
- Each AZ's is a separate physical location with one or many data center's.
- The logic behind it is, if one AZ was to fail, resources will still be running through the other. Hence the isolation.


## IAM - Identity Access Manager

### Users & Groups
- Root account - Made by default once you've made an AWS account. This shouldn't be shared or used
- Users - People within your organisation that can be grouped
- Groups - A collection of users
- One user can be in multiple groups or no group at all

### Permissions
- Users & Groups can be assigned JSON docs called policies
- These define permissions of the user
- Good practice is to apply only the relevant permissions to each role.

### Inheritance
- Users can belong to multiple groups and inherit those permissions from those groups
- But as user in a group can have inline policies attached to them only

  
