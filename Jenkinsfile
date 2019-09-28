def agentLabel
def CREDENTIAL_ID
if (environment == "Production") {
    agentLabel = "windows-agent-prod"
    CREDENTIAL_ID = "windows-agent-prod-creds"
} else {
    agentLabel = "windows-agent-stg"
    CREDENTIAL_ID = "windows-agent-stg-creds"
}

def getBranchFromEnv(Env) {
  if (Env == 'production') {
    return 'master'
  } else {
    return 'uat'
 }
}


pipeline {
    agent { label agentLabel }
    
    
    environment {
        BRANCH_NAME = getBranchFromEnv(environment)
    }
    
stages {
 
   stage ('Checkout') {
    steps {
        echo "Building in ${env.BRANCH_NAME}"
        echo "Environment in ${environment}"
        checkout([$class: 'GitSCM', branches: [[name: '${env.BRANCH_NAME}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/xenonstack/blue-prism-release.git']]])
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
