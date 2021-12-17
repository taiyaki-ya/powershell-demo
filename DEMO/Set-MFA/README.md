# What is this?  
このScriptは複数名を対象としたMulti-Factor Authenticationの管理を行うScriptです。  
対象ユーザーのデータはcsvで流し込みます。

# Requirements  
Microsoft Azure Active Directory Module  
[Install](https://docs.microsoft.com/en-us/microsoft-365/enterprise/connect-to-microsoft-365-powershell?view=o365-worldwide)

# How to use
1.事前にPowerShellへMicrosoft Azure Active Directory ModuleをInstallしてください。  
```Install-Module MSOnline```  
2.実行には管理者権限が必要です。  
3.Install後、  
```Connect-MsolService```  
でSign inします。  
4.同一ディレクトリに流し込み用csvをおいてから実行してください。  
5.パロメーター選択で、MFAの有効化（-AddAuther）・無効化（-ReleaseAuther）・適応状態（-Check）のチェックが可能です。  
6.有効化と無効化処理時のみ作業ログが出力されます。  