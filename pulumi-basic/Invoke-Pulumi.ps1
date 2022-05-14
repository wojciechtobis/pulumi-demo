try {
    Write-Host "Pulumi login"
    pulumi login

    Write-Host "Pulumi up"
    pulumi up
}
finally {
    pulumi logout
}