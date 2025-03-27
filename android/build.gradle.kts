allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Define a new build directory path relative to the root project
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

// Configure subprojects' build directory to use the custom build directory
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app") // Ensure the app project is evaluated first
}

// Clean task to delete the custom build directory
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// Android-specific configurations


