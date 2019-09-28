def agentLabel
def CREDENTIAL_ID
def BRANCH_NAME = "master"
if (BRANCH_NAME == "master") {
    agentLabel = "windows-agent-prod"
    CREDENTIAL_ID = "windows-agent-prod-creds"
} else {
    agentLabel = "windows-agent-stg"
    CREDENTIAL_ID = "windows-agent-stg-creds"
}


pipeline {
    agent { label agentLabel }
stages {
 
   stage ('Checkout') {
    steps {
    checkout([$class: 'GitSCM', branches: [[name: '${BRANCH_NAME}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/xenonstack/blue-prism-release.git']]])
    }
    }

    stage('Deploy') {
    steps {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: CREDENTIAL_ID,
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
    powershell '''
    & "C:/Program Files/Git/bin/git.exe" clone https://github.com/xenonstack/blue-prism-iac.git
    C:/Jenkins/workspace/Emaar-Poc/blue-prism-iac/run.ps1 $env:BPRelease_Name $env:USERNAME $env:PASSWORD
    '''
}
}
}
}
}
