pipeline {
agent any
environment {
        tenancy_ocid     = credentials('TENANCY_OCID')
        user_ocid        = credentials('USER_OCID')
        fingerprint      = credentials('FINGERPRINT')
        private_key      = credentials('PRIVATE_KEY')
        /*PATH = "${PATH}:${getTerraformPath()}*/
}
     stages {
    stage('Init') {
    steps {
                sh "terraform init"
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
  /*def getTerraformPath(){
  def tfHome = tool name: 'Terraform' type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
  return tfHome
}*/
