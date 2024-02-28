# Generated with Microsoft365DSC version 1.24.221.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $Credential
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    if ($null -eq $Credential)
    {
        <# Credentials #>
        $Credscredential = Get-Credential -Message "Credentials"

    }
    else
    {
        $CredsCredential = $Credential
    }

    $OrganizationName = $CredsCredential.UserName.Split('@')[1]

    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.24.221.1'

    Node localhost
    {
        IntuneSettingCatalogCustomPolicyWindows10 "IntuneSettingCatalogCustomPolicyWindows10-87d92e51-d36e-418f-9c97-81f3c3f64965"
        {
            Assignments          = @();
            Credential           = $Credscredential;
            Description          = "";
            Ensure               = "Present";
            Id                   = "87d92e51-d36e-418f-9c97-81f3c3f64965";
            Name                 = "My Settings";
            Platforms            = "windows10";
            Settings             = @(
                MSFT_MicrosoftGraphdeviceManagementConfigurationSetting{

                    SettingInstance = MSFT_MicrosoftGraphDeviceManagementConfigurationSettingInstance{
                        odataType = '#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance'
                        SettingDefinitionId = 'device_vendor_msft_policy_config_authentication_allowaadpasswordreset'

                        choiceSettingValue = MSFT_MicrosoftGraphDeviceManagementConfigurationChoiceSettingValue{

                            Value = 'device_vendor_msft_policy_config_authentication_allowaadpasswordreset_1'
                        }

                    }

                }
                MSFT_MicrosoftGraphdeviceManagementConfigurationSetting{

                    SettingInstance = MSFT_MicrosoftGraphDeviceManagementConfigurationSettingInstance{
                        odataType = '#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance'
                        SettingDefinitionId = 'device_vendor_msft_bitlocker_requiredeviceencryption'

                        choiceSettingValue = MSFT_MicrosoftGraphDeviceManagementConfigurationChoiceSettingValue{

                            Value = 'device_vendor_msft_bitlocker_requiredeviceencryption_1'
                        }

                    }

                }
            );
            Technologies         = "mdm";
        }
    }
}

M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential
