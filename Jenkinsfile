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
	    echo '$tenancy_ocid'
	
        }
    }
        stage('Plan') {
            steps {
               sh "${tfHome}/terraform plan"
            }
        }
        stage('Apply') {
            steps {
                  sh "${tfHome}/terraform apply--auto-approve"
            }
        }
	}
  }
