pipeline{
    agent any
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
        parameters {
            string(name: 'Env', defaultValue: 'Test', description: 'Version to deploy')
            booleanParam(name: 'executeTests', defaultValue: true, description: 'Decide to run test cases')
            choice(name: 'APPVERSION', choices: ['1.1', '1.2', '1.3'], description: 'Select application version')
        }
    
    stages{
        stage('Compile'){
            steps{
                echo 'Compile the environment ${params.Env}...'
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
            when {
                expression { params.executeTests == true }
            }
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
                input{
                    echo "Packaging the app with version ${params.APPVERSION}..."
                    message "Package the app with version ${params.APPVERSION}?"
                    ok "Yes, Package it!"
                }
                echo 'Packaging...'
                sh "mvn package"
            }
        }
    }
}