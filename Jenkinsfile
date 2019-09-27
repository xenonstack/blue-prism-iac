def agentLabel
if (BRANCH_NAME == "master") {
    agentLabel = "windows-agent-prod"
} else {
    agentLabel = "windows-agent-stg"
}

def CREDENTIAL_ID
if (BRANCH_NAME == "master") {
    CREDENTIAL_ID = "windows-agent-prod-creds"
} else {
    CREDENTIAL_ID = "windows-agent-stg-creds"
}

pipeline {
    agent { label agentLabel }
    stage('Deploy') {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: %CREDENTIAL_ID%,
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']])
    powershell '''
    ./run.ps1 %BPRelease_Name% %USERNAME% %PASSWORD%
    '''
}
}
