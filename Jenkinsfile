pipeline{
    agent any
    stages{
        stage('Compile'){
            steps{
                echo 'Compiling...'
                sh "mvn compile"
            }
        }
        stage('CodeReview'){
            steps{
                echo 'Code Review...'
                sh "mvn pmd:pmd"
            }
        }
        stage('UnitTest'){
            steps{
                echo 'Running Unit Tests...'
                sh "mvn test"  
            }
        }
        stage('CoverageAnalysis'){
             steps{
                echo 'Analyzing Code Coverage...'
                sh "mvn verify"
            }
        }
        stage('Package'){
            steps{
                echo 'Packaging...'
                sh "mvn package"
            }
        }
    }
}