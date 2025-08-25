Get-ChildItem -LiteralPath "microsoft_directx_redistributables" -Recurse | Where {
  $_.Name -cne $_.Name.ToLower()
} | ForEach-Object {
  $tn="$($_.Name)-temp";
  $tfn="$($_.FullName)-temp";
  $nn=$_.Name.ToLower();
  Rename-Item -LiteralPath $_.FullName -NewName $tn;
  Rename-Item -Path $tfn -NewName $nn -Force;
  Write-Host "New Name: $($nn)";
}
