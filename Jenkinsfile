node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("mitchins/alpine-bottle:${BRANCH_NAME}")
    }

    stage('Test image') {
    	/* Try and test that the image works */

        app.inside() {
            sh 'echo "Trivial Test"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
            app.push("${BRANCH_NAME}")
        }
    }
}