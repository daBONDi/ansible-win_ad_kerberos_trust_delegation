#!powershell

# Copyright: (c) 2019, David Baumann (@daBONDi) <me@davidbaummann.at>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

#AnsibleRequires -CSharpUtil Ansible.Basic

$spec = @{
    options = @{
        identity = @{ type="str"; required=$true }
        identity_type = @{ type = "str"; choices="computer","user"; default="computer" }
        trusted_to_auth_for_delegation = @{ type = "bool"; default = $true }
    }
    supports_check_mode = $true
}

$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

$trusted_to_auth_for_delegation = $module.Params.trusted_to_auth_for_delegation
$identity_type = $module.Params.identity_type
$identity = $module.Params.identity

  try{
    $ad_object=$null
    if($identity_type.ToLower() -eq "computer"){
      $ad_object = Get-ADComputer -Identity $identity -Properties TrustedToAuthForDelegation
    }elseif($identity_type.ToLower() -eq "user"){
      $ad_object = Get-ADUser -Identity $identity -Properties TrustedToAuthForDelegation
    }else{
      $module.FailJson("Looks like Ansible not catch the choice of identity_type")
    }
    
  }catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]{
    # We don't got found the AD Object
    $module.FailJson("Could not find $identity_type $identity in active directory")
  }catch{
    $module.FailJson("Error on fetching $identity_type Object with Identity $identity from AD", $_ )
  }
  
  if($trusted_to_auth_for_delegation -ne $ad_object.TrustedToAuthForDelegation){
    if(-not $module.CheckMode){
      $ad_object | Set-ADAccountControl -TrustedToAuthForDelegation $trusted_to_auth_for_delegation
    }
    $module.Result.changed = $true
  }

$module.ExitJson()
