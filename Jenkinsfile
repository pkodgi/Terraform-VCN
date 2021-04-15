pipeline {
agent any
environment {
      
	def tfHome = tool name: 'Terraform'
	
}
     stages {
	   stage('PreInit') {
		   steps { 
		   withCredentials([file(credentialsId: 'TERRAFORMTFVARS', variable: 'MYTFVARS')]) {
   sh '''
	 cp $MYTFVARS /var/jenkins_home/workspace/TFProject
	 ls -la /var/jenkins_home/workspace/TFProject
    '''
}
			   
 withCredentials([file(credentialsId: 'PRIVATEKEYFILE', variable: 'SECRETKEY')]) {
    sh '''
	 cp $SECRETKEY /var/jenkins_home/workspace/TFProject
	 ls -la /var/jenkins_home/workspace/TFProject
    '''
}
		   }
			   
	      }
	     
    stage('Init') {
    steps {
	    sh "${tfHome}/terraform init"
	    echo '${tenancy_ocid}'
	
        }
    }
        stage('Plan') {
            steps {
               sh "${tfHome}/terraform plan"
            }
        }
        stage('Apply') {
            steps {
                  sh "${tfHome}/terraform apply -auto-approve"
            }
        }
	}
  }
