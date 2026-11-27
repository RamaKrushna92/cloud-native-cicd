pipeline {
    agent any

    stages {
        stage('gitCheckout') {
            steps {
                 git branch: 'feature/jenkinsfile', credentialsId: 'e559adaa-2276-4e59-9d32-6e6692b6c08c', url: 'https://github.com/RamaKrushna92/cloud-native-cicd.git'
            }
        }
        stage('Trivy Dockerfile scan') {
            steps {
                sh '''
                    cd "${WORKSPACE}"
                    trivy config Dockerfile
                '''
            }
        }
        stage('Docker Image Build') {
            steps {
                sh '''
                    set +x
                    cd "${WORKSPACE}";pwd
                    echo
                    echo "************************************"
                    echo "  image build starts from here..    "
                    echo "************************************"
                    echo
                    sudo docker build -t python-service:v1.0 .
                    echo
                    echo "************************************"
                    echo "    list out docker images          "
                    echo "************************************"
                    echo
                    sudo docker images
                    echo
                '''
            }
        }
        stage ('Trivy Image Scan') {
            steps {
                sh '''
                    trivy image python-service:v1.0
                '''
            }
        }
        stage ('start container') {
            steps {
                sh '''
                    docker run -d --name welcom-note -p 5000:5000 python-service:v1.0
                '''
            }
        }
    }
}