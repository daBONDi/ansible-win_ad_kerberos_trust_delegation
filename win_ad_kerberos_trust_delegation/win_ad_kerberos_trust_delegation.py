#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2019, David Baumann (@daBONDi) <me@davidbaumann.at>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

ANSIBLE_METADATA = {'metadata_version': '1.0',
                    'status': ['preview'],
                    'supported_by': 'community'}

DOCUMENTATION = r'''
---
module: win_ad_kerberos_trust_delegation
version_added: '2.0'
description:
- Enable or Disable the AD Object Property of TrustedToAuthForDelegation
- If enabled AD Object  allow Kerberos Auth Delegation from other Protocols

options:

  identity:
    description:
    - Identity String to find the Object
    - Get-ADComputer -Identity IdentityProperty
    - Get-ADUser -Identity IdentityProperty
    type: str
    required: yes


  identity_type:
    description:
    - The Active Directory Object Type where we set the Property
    type: str
    choices: [ computer, user]
    default: computer
  
  trusted_to_auth_for_delegation:
    description:
    - If **yes** AD Object is allowed to Delegate Kerberos Auth/Token over other Protocols
    - If **no** AD Object is only Allow to Delegate Kerberos Auth/Token over Kerberos itself
    type: bool
    default: yes
author:
- David Baumann(@daBONDi)
'''

EXAMPLES = r'''
- name: Enable trusted_to_auth_for_delegation for Server1
  win_ad_kerberos_trust_delegation:
    identity: "Server1"
'''
