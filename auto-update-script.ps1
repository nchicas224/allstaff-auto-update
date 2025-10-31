$acceptedDomains = @("REDACTED")

$mailboxes = Get-Mailbox -ResultSize Unlimited | Where-Object {
    $_.RecipientTypeDetails -eq 'UserMailbox' -and  
    ($_.UserPrincipalName -split '@')[-1] -in $acceptedDomains -and
    $_.CustomAttribute1 -ne 'Service' -and
    $_.UserPrincipalName -ne "REDACTED"
} | Select-Object DisplayName, UserPrincipalName, RecipientType, RecipientTypeDetails | Sort-Object DisplayName

$acceptedUsersArray = New-Object System.Collections.ArrayList

$mailboxes | ForEach-Object {
    $user = $_
    $licenseDetails = Get-MgUserLicenseDetail -UserId $user.UserPrincipalName
    $licenseInfo = [PSCustomObject]@{
        DisplayName = $user.DisplayName
        UserPrincipalName = $user.UserPrincipalName
        LicenseCount = $licenseDetails.Count
    }
    if ($licenseInfo.LicenseCount -ne 0){
        $acceptedUsersArray.Add($licenseInfo.UserPrincipalName) | Out-Null
    }
}

$acceptedEmailStrings = $acceptedUsersArray | Select-Object -ExpandProperty $_

$allStaffMembers = Get-DistributionGroupMember -Identity "REDACTED_DISTRO" | Select-Object DisplayName, PrimarySmtpAddress | Sort-Object DisplayName


$allStaffMembers | ForEach-Object {
    $address = $_.PrimarySmtpAddress
    Add-DistributionGroupMember -Identity "REDACTED_TEST_DISTRO" -Member $address -Verbose
}


$testListMembers = Get-DistributionGroupMember -Identity "REDACTED_TEST_DISTRO" | Select-Object DisplayName, PrimarySmtpAddress | Sort-Object DisplayName

$existingTestListMembers = $testListMembers | Select-Object -ExpandProperty PrimarySmtpAddress

Write-Output "-------BREAK-------"

$acceptedEmailStrings | ForEach-Object {
    $validUser = $_
    if ($existingTestListMembers -notcontains $validUser) {
        Add-DistributionGroupMember -Identity "REDACTED_TEST_DISTRO" -Member $validUser
        Write-Output "---------------BREAK---------------"
        Write-Output "$validUser was added!"
        Write-Output "---------------BREAK---------------"
    } else {
        Write-Output "ALERT: $validUser already exists in this distro group: Skipping..."
    }
}

$updatedTestListMembers = Get-DistributionGroupMember -Identity "REDACTED_TEST_DISTRO" | Select-Object DisplayName, PrimarySmtpAddress | Sort-Object DisplayName

$updatedTestListMemberEmail = $updatedTestListMembers | Select-Object -ExpandProperty PrimarySmtpAddress

$updatedTestListMemberEmail |ForEach-Object {
    $testMember = $_
    if ($acceptedEmailStrings -notcontains $testMember){
        Remove-DistributionGroupMember -Identity "REDACTED_TEST_DISTRO" -Member $testMember -Confirm:$false
        Write-Output "$testMember removed from distro list"
    }
}

