param (
    [switch]$Check,
	[switch]$AddAuther,
    [switch]$ReleaseAuther,
    [switch]$CurrentMFAtype,
    [switch]$Test
       )

#Import-Module MSOnline
#Connect-MsolService

#環境変数の設定
$CurrentFolder = Split-Path $MyInvocation.MyCommand.Path -Parent
$CSVFilePath = $CurrentFolder + "\Add-AutherReq.csv"
$filename = Get-Date -Format "yyyy-MMdd-HHmmss"
$OutputLogFilePath = $CurrentFolder + "\Out-AutherReq$filename.csv"

#$CSVファイルの読み込み
$users = Import-Csv -Path $CSVFilePath -Encoding Default

Write-Host "パロメーターを入れて実行してください。　Check=状態確認,AddAuther=多要素認証有効化,ReleaseAuther=多要素認証無効化です。ResetAuther=認証方法のリセットです。"


$users | ForEach-Object{ 

    if($Check){
        Get-MsolUser -UserPrincipalName $_.UserID | Format-Table -AutoSize -Wrap -Property DisplayName,StrongAuthenticationRequirements
    }

    if($CurrentMFAtype){
        $UserMFAtype = Get-MsolUser -UserPrincipalName $_.UserID
        $auth = $UserMFAtype.StrongAuthenticationMethods
        $UserMFAtype.DisplayName
        $auth | Format-List
    }

    if($AddAuther){

        $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
        $st.RelyingParty = "*"
        $st.State = "Enabled"

        Set-MsolUser -UserPrincipalName $_.UserID -StrongAuthenticationRequirements @($st) 
        Get-MsolUser -UserPrincipalName $_.UserID | Format-Table -AutoSize -Wrap -Property UserPrincipalName,StrongAuthenticationRequirements,DisplayName | Export-Csv -path $OutputLogFilePath -NoTypeInformation -Append -Force 
        Write-Host "処理が完了しました"
    }

    if($ReleaseAuther){

        $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
        $st.RelyingParty = "*"
        $st.State = "Enabled"

        Set-MsolUser -UserPrincipalName $_.UserID -StrongAuthenticationRequirements @()
        Get-MsolUser -UserPrincipalName $_.UserID | Format-Table -AutoSize -Wrap -Property UserPrincipalName,StrongAuthenticationRequirements,DisplayName | Export-Csv -path $OutputLogFilePath -NoTypeInformation -Append -Force
        Write-Host "処理が完了しました"
    }

   
}


Pause
