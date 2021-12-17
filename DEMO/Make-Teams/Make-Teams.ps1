param(
    [parameter(Mandatory)][string]$BaseData
)

#CSV:DisplayName,MailNickName

#デフォルト値の設定（最初の所有者と公開設定）
$DefaultOwner = sample@test.com
#公開したい場合はここをPublicにする
$DefaultVisibility = Private

#環境変数の設定
$base = Import-Csv -Path $BaseData -Encoding Default
$CurrentFolder = Split-Path $MyInvocation.MyCommand.Path -Parent
$Today = Get-Date -Format "yyyy-MMdd-HHmmss"
$OutputLogFilePath = $CurrentFolder + "\Out-MakeingTeamslog$Today.csv"

#CSVからデータ取り出してきて、順番にTeamsを作成、ログファイルに追記
$base | ForEach-Object {
  New-Team -DisplayName $_.DisplayName -MailNickName $_.MailNickName`
  -Owner $DefaultOwner -Visibility $DefaultVisibility -Description $_.DisplayName

  Get-Team -DisplayName $_.DisplayName | Format-Table -AutoSize -Wrap | Export-Csv`
  -Path $OutputLogFilePath -Append -Force
}  


write-Host "処理が完了しました"

Pause