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

node {
    agent { label agentLabel }

    stage 'Checkout' {
    checkout([$class: 'GitSCM', branches: [[name: '${BRANCH_NAME}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/xenonstack/blue-prism-release.git']]])
    }

    stage('Deploy') {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: ${CREDENTIAL_ID},
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']])
    powershell '''
    ./run.ps1 %BPRelease_Name% %USERNAME% %PASSWORD%
    '''
}
}
