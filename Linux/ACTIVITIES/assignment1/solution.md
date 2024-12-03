```
#!/bin/bash

# Create a Directory
function addDir() {
    path="${1:?Path argument is missing}"
    dirName="${2:?Directory name argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ ! -d "$path/$dirName" ]; then
        mkdir "$path/$dirName"
        echo "Directory $dirName created successfully in $path"
    else
        echo "Directory $dirName already exists in $path"
    fi
}

# Delete a Directory
function deleteDir() {
    dirName="${1:?Directory name argument is missing}"
    if [ -d "$dirName" ]; then
        rm -rf "$dirName"
        echo "Directory $dirName deleted successfully"
    else
        echo "Directory $dirName does not exist"
    fi
}

# Only list files in a Directory
function listFiles() {
    path="${1:?Path argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Directory $path does not exist"
        return 1
    fi
    for file in "$path"/*; do
        if [ -f "$file" ]; then
            ls -l "$file"
        fi
    done
}

# Only list directories in a Directory
function listDirs() {
    path="${1:?Path argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Directory $path does not exist"
        return 1
    fi
    find "$path" -maxdepth 1 -type d -exec ls -ld {} \;
}

# List all files and directories
function listAll() {
    path="${1:?Path argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Directory $path does not exist"
        return 1
    fi
    ls -l "$path"
}

# Create a file
function addFile() {
    path="${1:?Path argument is missing}"
    fileName="${2:?File name argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ ! -f "$path/$fileName" ]; then
        touch "$path/$fileName"
        echo "File $fileName created successfully in $path"
    else
        echo "File $fileName already exists in $path"
    fi
}

# Add content to file
function addContentToFile() {
    path="${1:?Path argument is missing}"
    fileName="${2:?File name argument is missing}"
    content="${3:?Content argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ -f "$path/$fileName" ]; then
        echo "$content" >>"$path/$fileName"
        echo "Content added to $fileName successfully in $path"
    else
        echo "File $fileName does not exist in $path"
    fi
}

# Add content at the beginning of the file
function addContentToFileBegining() {
    path="${1:?Path argument is missing}"
    fileName="${2:?File name argument is missing}"
    content="${3:?Content argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ -f "$path/$fileName" ]; then
        echo "$content" | cat - "$path/$fileName" >temp && mv temp "$path/$fileName"
        echo "Content added to $fileName successfully in $path"
    else
        echo "File $fileName does not exist in $path"
    fi
}

# Show top n lines of a file
function showFileBeginingContent() {
    path="${1:?Path argument is missing}"
    fileName="${2:?File name argument is missing}"
    lines="${3:?Number of lines argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ -f "$path/$fileName" ]; then
        head -n "$lines" "$path/$fileName"
    else
        echo "File $fileName does not exist in $path"
    fi
}

# Show last n lines of a file
function showFileEndContent() {
    path="${1:?Path argument is missing}"
    fileName="${2:?File name argument is missing}"
    lines="${3:?Number of lines argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ -f "$path/$fileName" ]; then
        tail -n "$lines" "$path/$fileName"
    else
        echo "File $fileName does not exist in $path"
    fi
}

# Show contents of a specific line number without using sed
function showFileContentAtLine() {
    path="${1:?Path argument is missing}"
    fileName="${2:?File name argument is missing}"
    lineNumber="${3:?Line number argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ -f "$path/$fileName" ]; then
        awk "NR == $lineNumber" "$path/$fileName"
    else
        echo "File $fileName does not exist in $path"
    fi
}

# Show content of a specific line number range
function showFileContentForLineRange() {
    path="${1:?Path argument is missing}"
    fileName="${2:?File name argument is missing}"
    startLine="${3:?Start line number argument is missing}"
    endLine="${4:?End line number argument is missing}"
    if [ ! -d "$path" ]; then
        echo "Error: Path $path does not exist"
        return 1
    fi
    if [ -f "$path/$fileName" ]; then
        awk "NR >= $startLine && NR <= $endLine" "$path/$fileName"
    else
        echo "File $fileName does not exist in $path"
    fi
}

# Move file from one location to another
function moveFile() {
    sourceFile="${1:?Source file argument is missing}"
    destinationFile="${2:?Destination file argument is missing}"
    if [ ! -f "$sourceFile" ]; then
        echo "Error: Source file $sourceFile does not exist"
        return 1
    fi
    mv "$sourceFile" "$destinationFile"
    echo "File moved from $sourceFile to $destinationFile successfully"
}

# Copy file from one location to another
function copyFile() {
    sourceFile="${1:?Source file argument is missing}"
    destinationFile="${2:?Destination file argument is missing}"
    if [ ! -f "$sourceFile" ]; then
        echo "Error: Source file $sourceFile does not exist"
        return 1
    fi
    cp "$sourceFile" "$destinationFile"
    echo "File copied from $sourceFile to $destinationFile successfully"
}

# Delete file
function deleteFile() {
    filePath="${1:?File path argument is missing}"
    if [ -f "$filePath" ]; then
        rm "$filePath"
        echo "File $filePath deleted successfully"
    else
        echo "File $filePath does not exist"
    fi
}

function help() {
    echo -e "\033[1mUsage:\033[0m ./FileManager.sh [option] [arguments]"
    echo ""
    echo -e "\033[1mOptions and Arguments:\033[0m"
    echo -e "  \033[32maddDir\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m                : Create a Directory"
    echo -e "  \033[32mdeleteDir\033[0m \033[34m[path]\033[0m                    : Delete a Directory"
    echo -e "  \033[32mlistFiles\033[0m \033[34m[path]\033[0m                    : Only list files in a Directory"
    echo -e "  \033[32mlistDirs\033[0m \033[34m[path]\033[0m                     : Only list directories in a Directory"
    echo -e "  \033[32mlistAll\033[0m \033[34m[path]\033[0m                      : List all files and directories"
    echo -e "  \033[32maddFile\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m               : Create a file"
    echo -e "  \033[32maddContentToFile\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m \033[34m[content]\033[0m : Add content to file"
    echo -e "  \033[32maddContentToFileBegining\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m \033[34m[content]\033[0m : Add content at the beginning of the file"
    echo -e "  \033[32mshowFileBeginingContent\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m \033[34m[lines]\033[0m : Show top n lines of a file"
    echo -e "  \033[32mshowFileEndContent\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m \033[34m[lines]\033[0m : Show last n lines of a file"
    echo -e "  \033[32mshowFileContentAtLine\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m \033[34m[lineNumber]\033[0m : Show contents of a specific line number"
    echo -e "  \033[32mshowFileContentForLineRange\033[0m \033[34m[path]\033[0m \033[34m[name]\033[0m \033[34m[startLine]\033[0m \033[34m[endLine]\033[0m : Show content of a specific line number range"
    echo -e "  \033[32mmoveFile\033[0m \033[34m[sourceFile]\033[0m \033[34m[destinationFile]\033[0m : Move file from one location to another"
    echo -e "  \033[32mcopyFile\033[0m \033[34m[sourceFile]\033[0m \033[34m[destinationFile]\033[0m : Copy file from one location to another"
    echo -e "  \033[32mdeleteFile\033[0m \033[34m[path]\033[0m                    : Delete file"
}

# Make the functions available to the script using case
case $1 in
    addDir)
        addDir "$2" "$3"
        ;;
    deleteDir)
        deleteDir "$2" "$3"
        ;;
    listFiles)
        listFiles "$2"
        ;;
    listDirs)
        listDirs "$2"
        ;;
    listAll)
        listAll "$2"
        ;;
    addFile)
        addFile "$2" "$3"
        ;;
    addContentToFile)
        addContentToFile "$2" "$3" "$4"
        ;;
    addContentToFileBegining)
        addContentToFileBegining "$2" "$3" "$4"
        ;;
    showFileBeginingContent)
        showFileBeginingContent "$2" "$3" "$4"
        ;;
    showFileEndContent)
        showFileEndContent "$2" "$3" "$4"
        ;;
    showFileContentAtLine)
        showFileContentAtLine "$2" "$3" "$4"
        ;;
    showFileContentForLineRange)
        showFileContentForLineRange "$2" "$3" "$4" "$5"
        ;;
    moveFile)
        moveFile "$2" "$3"
        ;;
    copyFile)
        copyFile "$2" "$3"
        ;;
    deleteFile)
        deleteFile "$2" "$3"
        ;;
    help)
        help
        ;;
    *)
        echo "Invalid option, use ./FileManager.sh help for more information"
        ;;
esac
```
