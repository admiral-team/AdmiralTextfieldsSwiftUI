DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

cd "$DIR"

swiftgen config run --config .swiftgenAdmiral.yml
swiftgen config run --config .swiftgenViewerAdmiral.yml