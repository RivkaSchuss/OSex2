//Rivka Schuss 340903129

#include <stdio.h>
#include <memory.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

#define INPUT_SIZE 1000
#define JOBS_NUM 50

/**
 * calls the function execv
 * @param args the arguments for the function
 * @param background boolean if there is a background process
 * @return the current pid
 */
int callExecv(char **args, int background) {
    int stat, execReturn;
    pid_t pid;
    pid = fork();
    //if we're currently in the son's process
    if (pid == 0) { 
        execReturn = execvp(args[0], &args[0]);
        if (execReturn == -1) {
            fprintf(stderr, "Error in system call");
            printf("\n");
            exit(-1);
        }

        //if we're in the son's process
    } else {
        //prints the id of the son
        printf("%d \n", pid);
        if (!background) {
            wait(&stat);  
        }
    }
    return pid;
}

/**
 * deals with the cd command with a specific directory given
 * @param dir the directory given
 * @param recentCdDir the last directory we've been in
 * @param cdNeg if the cd returned negative
 * @return success or failure
 */
int cdSpecific(char *dir, char *recentCdDir, int cdNeg) {
    char currentDirectory[INPUT_SIZE];
    getcwd(currentDirectory, INPUT_SIZE);
    if (chdir(dir) == -1) {
        fprintf(stderr, "Error in system call");
        printf("\n");
        return -1;
    } else {
        if(cdNeg == 1){
            printf("%s\n", dir);
        }
        strcpy(recentCdDir, currentDirectory);
        return 1;
    }
}

/**
 * deals with the cd command when there is no argument given
 * @param recentCdDir the last directory we've been in
 * @return success or failure
 */
int cdToHomeDirectory(char *recentCdDir){
    char currentDirectory[INPUT_SIZE];
    getcwd(currentDirectory,INPUT_SIZE);
    if(chdir(getenv("HOME")) == -1) {
        fprintf(stderr, "Error in system call");
        printf("\n");
        return -1;
    } else {
        strcpy(recentCdDir, currentDirectory);
        return 1;
    }
}

/**
 * prints the current jobs
 * @param pidArray the array of pids
 * @param jobs array of jobs
 * @param j number of jobs
 */
void printJobs(int pidArray[], char jobs[JOBS_NUM][INPUT_SIZE], int j){
    int flag = 0;
    int i;
    for (i = 0; i < j; i++) {
        pid_t returnPid = waitpid(pidArray[i], NULL, WNOHANG);
        if (returnPid ==0) {
            flag = 1;
            printf("%d ", pidArray[i]);
            int len = strlen(jobs[i]);
            int k;
            for (k = 0; k < len;k++){
                if (!((k == len-1) && jobs[i][k] == '&')) {
                    printf("%c", jobs[i][k]);
                }
            }
        }
    }
    if (flag) {
        printf("\n");
    }
}

/**
 * initializes the args
 * @param args array of args
 * @param input input given
 * @param background if the process is in the background
 */
void initializeArgs(char **args, char *input, int *background){
    const char sep[2] = " ";
    char *tok;
    int i = 0;
    tok = strtok(input, sep);
    args[i]= tok;
    //iterate over all the tokens
    while (tok != NULL) {
        tok = strtok(NULL, sep);
        if (tok != NULL && strcmp(tok, "&") != 0) {
            i++;
            args[i]= tok;
        } else if (tok != NULL && strcmp(tok, "&") == 0) {
            *background = 1;
        }
    }
    i++;
    args[i] = NULL;
}

/**
 * performs the cd command
 * @param args the arguments given
 * @param recentCdDir the last directory we've been in
 * @return success or failure
 */
int cdCommand(char **args, char *recentCdDir){
    if (args[1] == NULL){
        return cdToHomeDirectory(recentCdDir);
    } else {
        int i =0;
        while (args[i] != NULL) {
            i++;
        }
        if (i == 2 && strcmp(args[1],"-") == 0){
            return cdSpecific(recentCdDir, recentCdDir, 1);

        } else if (i == 2 && strcmp(args[1], "~") == 0) {
            return cdToHomeDirectory(recentCdDir);
        } else {
            return cdSpecific(args[1], recentCdDir, 0);
        }
    }
}

/**
 * the main
 * @return 0
 */
int main() {
    //allocate memory for jobs arrays
    char jobs[JOBS_NUM][INPUT_SIZE];
    int pidArray[JOBS_NUM];
    int j = 0;
    char recentCdDir[INPUT_SIZE] ="";
    //endless loop that runs the shell
    while (1) {
        printf("prompt>");
        int background = 0;
        //allocate memory for input
        char input[INPUT_SIZE];
        char copyInput[INPUT_SIZE];
        //scan input from user
        fgets(input, INPUT_SIZE, stdin);
        //remove '/n'
        input[strlen(input) - 1] = '\0';
        //copy input
        strcpy(copyInput,input);
        //operate the action
        if (strcmp(input, "jobs") == 0) {
            printJobs(pidArray,jobs,j);
        } else if (strcmp(input, "exit") == 0) {
            printf("%d \n", getpid());
            exit(0);
        } else {
            //allocates memory for the array of args
            char *args[INPUT_SIZE];
            initializeArgs(args, input, &background);
            if (args[0]==NULL){
                continue;
            }
            if (strcmp(args[0],"cd")==0) {
                printf("%d \n", getpid());
                cdCommand(args, recentCdDir);
            } else {
                int pid = callExecv(args, background);
                pidArray[j] = pid;
                strcpy(jobs[j], copyInput);
                j++;
            }
        }
    }
    return (0);
}