pipeline {
agent any
environment {
        tenancy_ocid     = credentials('TENANCY_OCID')
        user_ocid        = credentials('USER_OCID')
        fingerprint      = credentials('FINGERPRINT')
        private_key      = credentials('PRIVATE_KEY')
	def tfHome = tool name: 'Terraform'
	
}
     stages {
    stage('Init') {
    steps {
	    sh "${tfHome}/terraform init"
        }
    }
        stage('Plan') {
            steps {
               sh "terraform plan"
            }
        }
        stage('Apply') {
            steps {
                  sh "terraform apply--auto-approve"
            }
        }
	}
  }
