# What is this?  
このScriptは、Teamsを作成してから365グループを作成するものです。  
元々Teamsは365グループがベースとなって作成されますが、  
じつは365グループを作成しただけでは、そのグループに紐付けされたTeamsは作成されません。  
管理センターで作成ボタンを押せばよいのですが、組織等で一括作成をしたい場合はかなりの手間がかかってしまいます。  
その解消のため、色々と拡充されてきたMicrosoftTeams Moduleを使って本Scriptを作成しました。  
想定シナリオとしては、「Teamsを利用するために365グループを一括で複数作成したい」です。

# Requirements  
MicrosoftTeams module  
[Install](https://docs.microsoft.com/en-us/microsoftteams/teams-powershell-install)

# How to use
1.事前にPowerShellへMicrosoftTeams ModuleをInstallしてください。  
2.実行には管理者権限が必要です。  
3.Install後、  
```Connect-MicrosoftTeams```   
でSign inします。  
4.実行してください。
