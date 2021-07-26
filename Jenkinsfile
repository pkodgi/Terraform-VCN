pipeline {
agent any
environment {
      
	def tfHome = tool name: 'Terraform'
	def terraformVars = fileExists '/var/jenkins_home/workspace/TFProject/terraform.tfvars'
	
}
     stages {
	   stage('File Exist') {
   when { expression { terraformVars == 'true' } }
            steps {
		   sh '''
		   rm '/var/jenkins_home/workspace/TFProject/terraform.tfvars'
		   rm '/var/jenkins_home/workspace/TFProject/terraform.pem'
		   '''
		    			    withCredentials([file(credentialsId: 'TERRAFORMTFVARS', variable: 'MYTFVARS')]){
	    sh '''
	           cp $MYTFVARS /var/jenkins_home/workspace/TFProject
	       '''

}    
		       withCredentials([file(credentialsId: 'PRIVATEKEYFILE', variable: 'SECRETKEY')]) {
    sh '''
	 cp $SECRETKEY /var/jenkins_home/workspace/TFProject 
    '''
		   }
		   }
	   }
		   stage('File Does Not Exist') {
			  when { expression { terraformVars == 'false' } }   
			   steps {
				    withCredentials([file(credentialsId: 'TERRAFORMTFVARS', variable: 'MYTFVARS')]){
	    sh '''
	           cp $MYTFVARS /var/jenkins_home/workspace/TFProject
	       '''

}    
		       withCredentials([file(credentialsId: 'PRIVATEKEYFILE', variable: 'SECRETKEY')]) {
    sh '''
	 cp $SECRETKEY /var/jenkins_home/workspace/TFProject 
    '''
            }
}
			   
	   }

		   
	     
    stage('Init') {
    steps {
	    sh "${tfHome}/terraform init"
	   
	
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
