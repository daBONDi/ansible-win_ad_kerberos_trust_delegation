# ansible-win_ad_kerberos_trust_delegation

Ansible Module to enable TrustedToAuthForDelegation for a User or Computer Object

## Installation

Copy win_ad_kerberos_trust_delegation into your libary folder

## Examples

```yaml
# Enable TrustedToAuthForDelegation for Server1
- win_ad_kerberos_trust_delegation:
    win_ad_kerberos_trust_delegation:
    identity: "Server1"

# Enable TrustedToAuthForDelegation for Server1
- win_ad_kerberos_trust_delegation:
    win_ad_kerberos_trust_delegation:
    identity: "Server1"
    identity_type: computer
    trusted_to_auth_for_delegation: no

# Enable TrustedToAuthForDelegation for User1
- win_ad_kerberos_trust_delegation:
    win_ad_kerberos_trust_delegation:
    identity: "User1"
    identity_type: user

# Disable TrustedToAuthForDelegation for User1
- win_ad_kerberos_trust_delegation:
    win_ad_kerberos_trust_delegation:
    identity: "User1"
    identity_type: user
    trusted_to_auth_for_delegation: no
```

> Maybe check also my other Module to set the SPNs for the AD Object [https://github.com/daBONDi/ansible-win_ad_kerberos_deleg](https://github.com/daBONDi/ansible-win_ad_kerberos_deleg)
