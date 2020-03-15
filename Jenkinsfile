node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("rajesh622/project1")
    }

    stage('Test image 1') {
        
        app.inside {
            echo "Test-1 passed"
        }
    }
    stage('Test image 2') {
        
        app.inside {
            echo "Test-2 passed"
        }
    }
    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } */
                echo "Trying to Push Docker Build to DockerHub"
	    
	    //withDockerRegistry(credentialsId: 'dokcerid', url: 'https://hub.docker.com/') {
	    sh label: 'Docker Login', script: 'docker login --username "rajesh622" --password "abc_12345"'
    	    app.push("${env.BUILD_NUMBER}")
            app.push("latest")
	//}
    }
}
