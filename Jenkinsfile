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
  if (Env == 'Production') {
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
 
   stage ('Download Infra as a Code') {
    steps {
        echo "Building in ${env.BRANCH_NAME}"
        
            dir('iac') {
              checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/xenonstack/blue-prism-iac.git']]])
            
            }
        }
    }
    
    stage('Download Release Artifact'){
        steps{
            script {
        
                if ( environment == 'Production') {
                    checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'git@github.com:xenonstack/blue-prism-release.git']]])
                }
                else if ( environment == 'UAT') {
                    checkout([$class: 'GitSCM', branches: [[name: 'uat']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'git@github.com:xenonstack/blue-prism-release.git']]])
                }
                else{
                    checkout([$class: 'GitSCM', branches: [[name: 'develop']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'git@github.com:xenonstack/blue-prism-release.git']]])
                }

            }
        }
    }

    stage('Import Release to ${environment} BluePrism') {
    steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: CREDENTIAL_ID,
                        usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        powershell '''
        C:/Jenkins/workspace/Emaar-Poc/iac/run.ps1 $env:BPRelease_Name $env:USERNAME $env:PASSWORD
        '''
        }
    }
}
}
}
